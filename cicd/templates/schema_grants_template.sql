grant usage on schema {{ database_name }}.{{ schema_name }} to role {{ role_name }};
grant all privileges on all tables in schema {{ database_name }}.{{ schema_name }}  to role {{ role_name }};
grant all privileges on all stages in schema {{ database_name }}.{{ schema_name }}  to role {{ role_name }};
grant usage on all stages in schema {{ database_name }}.{{ schema_name }}  to role {{ role_name }};
grant select on future tables in schema {{ database_name }}.{{ schema_name }} to role {{ role_name }};
grant select on future views in schema {{ database_name }}.{{ schema_name }}  to role {{ role_name }};
grant usage on future stages in schema {{ database_name }}.{{ schema_name }}  to role {{ role_name }};
