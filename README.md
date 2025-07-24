# Snowflake CI/CD Scripts

This repo has some info and examples on setting up a cloning CI/CD flow for Snowflake through github actions.  
A lot of people end up using the workflow dispatch (manual) trigger to avoid interupting other developers who may be working in the cloned environment.  

It is also recommended to handle automation using service accounts with RSA keys.  

### Create Snowflake RSA Service User
https://docs.snowflake.com/en/user-guide/key-pair-auth  

1. Create RSA key:
I usually run this in WSL if I'm on Windows - create the private key:
```bash
openssl genrsa 2048 | openssl pkcs8 -topk8 -inform PEM -out rsa_key.p8 -nocrypt
```
Create the public key:
```bash
openssl rsa -in rsa_key.p8 -pubout -out rsa_key.pub
```

2. Create the user and assign the RSA key login

```sql
USE ROLE USERADMIN; -- builtin snowflake role
CREATE USER CI_CD_SVC; -- also look at setting some defaults (role + warehouse for the svc account)
```

```sql
USE ROLE SECURITYADMIN; -- builtin securityadmin role already has privileges to set rsa key
ALTER USER CI_CD_SVC SET RSA_PUBLIC_KEY='MIIBIjANBgkqh...';
```
*note -*  
you need to copy the part bettween the "key" tags:  
-----BEGIN PUBLIC KEY-----  
MIIBIj... (just this)  
-----END PUBLIC KEY-----  
And it expects the string to have no new line terminators.   
