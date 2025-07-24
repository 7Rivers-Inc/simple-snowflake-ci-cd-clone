# pseudocode:
# 1. Clone schemas (create other schemas if not exists)
# 2. re-apply grants on schemas
# 3. re-create refined schema objects
# 4. re-create reporting schema objects 
# 5. verify manually (could automate later)

import os
from typing import Tuple
import yaml
import jinja2

from snowflake.connector import connect, SnowflakeConnection
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import serialization

from logging import getLogger
_logger = getLogger(__name__)


# initialize Jinja
package_loader = jinja2.FileSystemLoader("templates")

jinja2_env = jinja2.Environment(
    loader=package_loader, lstrip_blocks=True, trim_blocks=True
)

def template(template_name: str) -> jinja2.Template:
    """
    Name of the template to load
        Must be .html or .sql file
    """
    return jinja2_env.get_template(template_name)



def get_config(config_path: str = "cicd_config.yaml") -> dict:
    with open(config_path) as file:
        try:
            config = yaml.safe_load(file)
        except yaml.YAMLError as e:
            _logger.warning(f"could not load yaml: {e}")

    return config


def get_sf_conn():
    conn_params = {
        'user': os.getenv('SNOWFLAKE_USER'),
        'password': os.getenv('SNOWFLAKE_PASSWORD'),
        'account': os.getenv('SNOWFLAKE_ACCOUNT'),
        'warehouse': os.getenv('SNOWFLAKE_WAREHOUSE'),
        'role': os.getenv('SNOWFLAKE_ROLE'),
    }

    conn = connect(**conn_params)

    try:
        cursor = conn.cursor()

        cursor.execute("SELECT 1")
        for row in cursor:
            _logger.info(f"database health check {row}")
    except Exception as e:
        _logger.warning(f"database conn test failed: {e}")

    return conn

def get_rsa_conn() -> SnowflakeConnection:
    # get the environmental variables based on auth type

    _logger.info("attempting to connect with rsa key")
    # docs are acutally inaccurate for this (or non-existant)
    # Luckily we can create the connection from the Snowflake Connector
    # Line 238: https://github.com/snowflakedb/snowpark-python/blob/main/src/snowflake/snowpark/session.py#L373
    p_key_raw = os.environ["SNOWFLAKE_PK"].encode()

    # check if there is a passphrase for the rsa key - if not set password to None
    if len(os.getenv("SNOWFLAKE_PRIVATE_KEY_PASSPHRASE", "")) > 0:
        private_key_password = os.environ[
            "SNOWFLAKE_PRIVATE_KEY_PASSPHRASE"
        ].encode()
    else:
        private_key_password = None

    p_key = serialization.load_pem_private_key(
        p_key_raw,
        password=private_key_password,
        backend=default_backend(),
    )

    pkb = p_key.private_bytes(
        encoding=serialization.Encoding.DER,
        format=serialization.PrivateFormat.PKCS8,
        encryption_algorithm=serialization.NoEncryption(),
    )

    conn_params = {
        'user': os.getenv('SNOWFLAKE_USER'),
        'account': os.getenv('SNOWFLAKE_ACCOUNT'),
        'warehouse': os.getenv('SNOWFLAKE_WAREHOUSE'),
        'role': os.getenv('SNOWFLAKE_ROLE'),
        'private_key': pkb,
        'database': os.getenv('SNOWFLAKE_DATABASE'),
        'session_parameters': {"QUERY_TAG": "ci_cd"}
    }

    conn = connect(**conn_params)

    try:
        cursor = conn.cursor()

        cursor.execute("SELECT 1")
        for row in cursor:
            print(f"database health check {row}")
    except Exception as e:
        print(f"database conn test failed: {e}")

    return conn


def query(conn: SnowflakeConnection, sql: str) -> Tuple[tuple, tuple]:
    print(f"executing sql: {sql}")

    cursor = conn.cursor()
    cursor.execute(sql)
    column_names = cursor.description
    rows = cursor.fetchall()
    cursor.close()

    return column_names, rows

def read_and_execute(conn, filepath:str, role:str) -> None:

    with open(filepath, "r") as f:
        sql_str = f.read()

    sql_list = sql_str.split(";")

    query(conn, f"USE ROLE {role}")

    for sql in sql_list:
        try:
            column_names, rows = query(conn, sql)
        except Exception as e:
            # TODO - save these somewhere
            print(f"ERROR: {e} \nCould not Run: {sql}")
            continue
    
    return None


if __name__ == "__main__":

    config = get_config(config_path = "cicd/cicd_config.yaml")

    # get snowflake connection
    conn = get_rsa_conn()

    read_and_execute(conn, config['clone_ddl']['path'], config['clone_ddl']['role'])
    read_and_execute(conn, config['clone_grant_ddl']['path'], config['clone_grant_ddl']['role'])
    read_and_execute(conn, config['refined_views']['path'], config['refined_views']['role'])
    read_and_execute(conn, config['reporting_views']['path'], config['reporting_views']['role'])

    # close connection
    conn.close()