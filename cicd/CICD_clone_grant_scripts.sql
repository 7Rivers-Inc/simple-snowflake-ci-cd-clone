grant usage on schema dev_raw.raw_example_1 to role SNOWFLAKE_TRANSFORMATION_NONPROD;
grant all privileges on all tables in schema dev_raw.raw_example_1 to role SNOWFLAKE_TRANSFORMATION_NONPROD;
grant all privileges on all stages in schema dev_raw.raw_example_1 to role SNOWFLAKE_TRANSFORMATION_NONPROD;
grant select on future tables in schema dev_raw.raw_example_1 to role SNOWFLAKE_TRANSFORMATION_NONPROD;
grant select on future views in schema dev_raw.raw_example_1 to role SNOWFLAKE_TRANSFORMATION_NONPROD;
grant usage on future stages in schema dev_raw.raw_example_1 to role SNOWFLAKE_TRANSFORMATION_NONPROD;

grant usage on schema dev_raw.raw_example_2 to role SNOWFLAKE_TRANSFORMATION_NONPROD;
grant all privileges on all tables in schema dev_raw.raw_example_2 to role SNOWFLAKE_TRANSFORMATION_NONPROD;
grant all privileges on all stages in schema dev_raw.raw_example_2 to role SNOWFLAKE_TRANSFORMATION_NONPROD;
grant select on future tables in schema dev_raw.raw_example_2 to role SNOWFLAKE_TRANSFORMATION_NONPROD;
grant select on future views in schema dev_raw.raw_example_2 to role SNOWFLAKE_TRANSFORMATION_NONPROD;
grant usage on future stages in schema dev_raw.raw_example_2 to role SNOWFLAKE_TRANSFORMATION_NONPROD;

grant usage on schema DEV_EDW.REFINED_CONTROL to role SNOWFLAKE_TRANSFORMATION_NONPROD;
grant all privileges on all tables in schema DEV_EDW.REFINED_CONTROL to role SNOWFLAKE_TRANSFORMATION_NONPROD;
grant all privileges on all stages in schema DEV_EDW.REFINED_CONTROL to role SNOWFLAKE_TRANSFORMATION_NONPROD;
grant select on future tables in schema DEV_EDW.REFINED_CONTROL to role SNOWFLAKE_TRANSFORMATION_NONPROD;
grant select on future views in schema DEV_EDW.REFINED_CONTROL to role SNOWFLAKE_TRANSFORMATION_NONPROD;
grant usage on future stages in schema DEV_EDW.REFINED_CONTROL to role SNOWFLAKE_TRANSFORMATION_NONPROD;

grant usage on schema dev_raw.raw_example_1 to role SNOWFLAKE_DEVELOPER;
grant all privileges on all tables in schema dev_raw.raw_example_1 to role SNOWFLAKE_DEVELOPER;
grant all privileges on all stages in schema dev_raw.raw_example_1 to role SNOWFLAKE_DEVELOPER;
grant select on future tables in schema dev_raw.raw_example_1 to role SNOWFLAKE_DEVELOPER;
grant select on future views in schema dev_raw.raw_example_1 to role SNOWFLAKE_DEVELOPER;
grant usage on future stages in schema dev_raw.raw_example_1 to role SNOWFLAKE_DEVELOPER;

grant usage on schema dev_raw.raw_example_2 to role SNOWFLAKE_DEVELOPER;
grant all privileges on all tables in schema dev_raw.raw_example_2 to role SNOWFLAKE_DEVELOPER;
grant all privileges on all stages in schema dev_raw.raw_example_2 to role SNOWFLAKE_DEVELOPER;
grant select on future tables in schema dev_raw.raw_example_2 to role SNOWFLAKE_DEVELOPER;
grant select on future views in schema dev_raw.raw_example_2 to role SNOWFLAKE_DEVELOPER;
grant usage on future stages in schema dev_raw.raw_example_2 to role SNOWFLAKE_DEVELOPER;

grant usage on schema DEV_EDW.REFINED_CONTROL to role SNOWFLAKE_DEVELOPER;
grant all privileges on all tables in schema DEV_EDW.REFINED_CONTROL to role SNOWFLAKE_DEVELOPER;
grant all privileges on all stages in schema DEV_EDW.REFINED_CONTROL to role SNOWFLAKE_DEVELOPER;
grant select on future tables in schema DEV_EDW.REFINED_CONTROL to role SNOWFLAKE_DEVELOPER;
grant select on future views in schema DEV_EDW.REFINED_CONTROL to role SNOWFLAKE_DEVELOPER;
grant usage on future stages in schema DEV_EDW.REFINED_CONTROL to role SNOWFLAKE_DEVELOPER;

grant usage on schema dev_raw.raw_example_1 to role SNOWFLAKE_DATA_SCIENTIST;
grant all privileges on all tables in schema dev_raw.raw_example_1 to role SNOWFLAKE_DATA_SCIENTIST;
grant all privileges on all stages in schema dev_raw.raw_example_1 to role SNOWFLAKE_DATA_SCIENTIST;
grant select on future tables in schema dev_raw.raw_example_1 to role SNOWFLAKE_DATA_SCIENTIST;
grant select on future views in schema dev_raw.raw_example_1 to role SNOWFLAKE_DATA_SCIENTIST;
grant usage on future stages in schema dev_raw.raw_example_1 to role SNOWFLAKE_DATA_SCIENTIST;

grant usage on schema dev_raw.raw_example_2 to role SNOWFLAKE_DATA_SCIENTIST;
grant all privileges on all tables in schema dev_raw.raw_example_2 to role SNOWFLAKE_DATA_SCIENTIST;
grant all privileges on all stages in schema dev_raw.raw_example_2 to role SNOWFLAKE_DATA_SCIENTIST;
grant select on future tables in schema dev_raw.raw_example_2 to role SNOWFLAKE_DATA_SCIENTIST;
grant select on future views in schema dev_raw.raw_example_2 to role SNOWFLAKE_DATA_SCIENTIST;
grant usage on future stages in schema dev_raw.raw_example_2 to role SNOWFLAKE_DATA_SCIENTIST;

grant usage on schema DEV_EDW.REFINED_CONTROL to role SNOWFLAKE_DATA_SCIENTIST;
grant all privileges on all tables in schema DEV_EDW.REFINED_CONTROL to role SNOWFLAKE_DATA_SCIENTIST;
grant all privileges on all stages in schema DEV_EDW.REFINED_CONTROL to role SNOWFLAKE_DATA_SCIENTIST;
grant select on future tables in schema DEV_EDW.REFINED_CONTROL to role SNOWFLAKE_DATA_SCIENTIST;
grant select on future views in schema DEV_EDW.REFINED_CONTROL to role SNOWFLAKE_DATA_SCIENTIST;
grant usage on future stages in schema DEV_EDW.REFINED_CONTROL to role SNOWFLAKE_DATA_SCIENTIST;