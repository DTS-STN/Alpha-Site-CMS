# Alpha Site CMS


## Environment Variables

### API

`DATABASE_HOST`: The postgresql address

`DATABASE_PORT`: The postgresql port

`DATASBASE_USERNAME`: The postgresql user to use for strapi 

`DATABASE_PASSWORD`: The postgresql password

`DATABASE_SSL`: Whether to use a secure connection between the api and the database

`STRAPI_API_BACKEND_URL`: Public url of the server. Required for many different features (ex: reset password, third login providers etc.). Also enables proxy support such as Apache or Nginx. Absolute url is recommended.

`STRAPI_API_HOST`: Host for the API 

`STRAPI_API_PORT`: The port for the API

`STRAPI_STORAGE`: What storage provider to use. Currently `local` and `azure` are supported

`STORAGE_ACCOUNT`: If using azure storage what account

`STORAGE_ACCOUNT_KEY`: If using azure storage, the seceret account key.

`STORAGE_ACCOUNT_URL`: If using azure storage. The full url of the storage account

`STORAGE_ACCOUNT_CONTAINER`: If using azure storage. The blob container name

`STRAPI_ADMIN_JWT_SECRET`: Secret used to encode JWT tokens.

