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

### En el dockerfile
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
sudo docker run -p 8089:8089 --name nodeback --link my-couchdb:couchdb valejo/icesihealthapp-back:0.1
```

### Prueba de la conexión con la base de datos
http://localhost:8089/getInfo/patients/ef5335dd-db17-491e-8150-20ce24712b06