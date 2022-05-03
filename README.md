# Alpha Site CMS
The CMS counterpart of [Alpha Site](https://github.com/DTS-STN/Alpha-Site), powered by [Strapi CMS](https://strapi.io/).

## Setup
Ensure you have `node >= 14` and `yarn` installed before running the following:
```sh
$ yarn
```
Next, duplicate the `.env.example` file into `.env`. Reach out to an contributor of this repo for the configuration values!

## Development
It's required that [Postgres](https://www.postgresql.org/download/) is running locally on port `5433` before you can actively run the app in development mode.
```sh
$ yarn develop
```

## Docker
If you wish to run the app in a container to emulate what it would look like in staging, production, or any other integrated environment of ours, simply start [Docker](https://www.docker.com/products/docker-desktop/) and run the following:
```sh
$ docker-compose up
```
This launches the app and the Postgres containers in an isolated environment.

**Note:** Docker will pick up the `.env` in the project root and use it for any `ENV` variables required by `docker-compose.yml`. 

## Deployment Pipeline
Deployment occurs automatically when code is merged into `master`. All integrated environments of ours are currently managed by Azure's container service; meaning our app is deployed in a Docker container by Azure to an environment provided and managed by Azure "app services".

The deployment jobs for non-prod and prod are described in the `dev-azure-pipelines.yml` and `prod-azure-pipelines.yml` files, respectively. 

## Configuration
Configuration of the app is done in different ways depending on the environment of the running app.

### Local Environment
For local development, the `.env` file is used since the app doesn't run in Docker but rather directly from the Strapi binary in `node_modules`. 

### Integrated Environments
Our integrated environments are maintained as Azure app services and thus the entire configuration of the pipeline for the deployment job(s) can be found in the `Admin (app service) > Configuration` section. If you'd like to see/update pipeline configuration values, please request access to it.

**Important:** When the app is ran as a Docker container, either locally or in an integrated environment (Azure), it expects one `build` `args`: `STRAPI_ADMIN_BACKEND_URL`.

### Available Variables
`STRAPI_ADMIN_BACKEND_URL`: Public url of the admin panel\
`NOTIFY_BASE_API_URL`: Required base URL for all GC Notify API calls\
`NOTIFY_API_KEY`: Required GC Notify API key for the project\
`NOTIFY_EMAIL_TEMPLATE_ID`: Required GC Notify template ID for sign in notification\
`DATABASE_HOST`: The postgresql address\
`DATABASE_PORT`: The postgresql port\
`DATASBASE_USERNAME`: The postgresql user to use for strapi\
`DATABASE_PASSWORD`: The postgresql password\
`DATABASE_SSL`: Whether to use a secure connection between the api and the database\
`STRAPI_API_HOST`: Host for the API \
`STRAPI_API_PORT`: The port for the API\
`STRAPI_STORAGE`: What storage provider to use. Currently `local` and `azure` are supported\
`STORAGE_ACCOUNT`: If using azure storage what account\
`STORAGE_ACCOUNT_KEY`: If using azure storage, the seceret account key.\
`STORAGE_ACCOUNT_URL`: If using azure storage. The full url of the storage account\
`STORAGE_ACCOUNT_CONTAINER`: If using azure storage. The blob container name\
`STRAPI_ADMIN_JWT_SECRET`: Secret used to encode JWT tokens.


### WordPress
#### Localization
Go to https://make.wordpress.org/polyglots/teams/ for a list of currently support language packs for the admin panel. From here, download the packs needed for the site into the /wp-content/translations folder.
