# Icesi Health Backend - Node.js Database Adapter for Cloudant.

1. Set `CLOUDANT_URL` to Cloudant connection details:

    ```
    export CLOUDANT_URL=https://username:pass.cloudantnosqldb.cloud
    ```
    or create `credentials.json` in the root directory:
    ```
    {
        "url": "https://username:pass.cloudantnosqldb.cloud"
    }
    ```

1. Run `npm start`.

ENV USER admin
ENV PASSWORD password
ENV DATABASE_URL http://$USER:$PASSWORD@my-couchdb:5984

```bash 
sudo docker build -t valejo/icesihealthapp-back:0.1 .
```
```bash
sudo docker volume create couchdb_data
```
```bash 
sudo docker run -e COUCHDB_USER=admin -e COUCHDB_PASSWORD=password --name my-couchdb -v couchdb_data:/opt/couchdb/data couchdb:3
```
```bash 
sudo docker run -p 5000:5000 --name nodeback --link my-couchdb:couchdb underdotcom/icesihealthapp-back:0.1
```