FROM node:lts-alpine

RUN apk add --no-cache --virtual python make g++ pkgconf libsecret-dev

ARG NODE_ENV='production'
ARG STRAPI_API_HOST="0.0.0.0"
ARG STRAPI_API_PORT=5535
ARG STRAPI_STORAGE="azure"
ARG STRAPI_ADMIN_BACKEND_URL="http://localhost:5535"
ARG STRAPI_API_BACKEND_URL="http://localhost:5535"

ENV NODE_ENV $NODE_ENV
ENV STRAPI_API_HOST $STRAPI_API_HOST
ENV STRAPI_API_PORT $STRAPI_API_PORT
ENV STRAPI_PORT $STRAPI_API_PORT
ENV STRAPI_ADMIN_BACKEND_URL $STRAPI_ADMIN_BACKEND_URL
ENV STRAPI_API_BACKEND_URL $STRAPI_API_BACKEND_URL
ENV STRAPI_STORAGE $STRAPI_STORAGE
ENV STORAGE_ACCOUNT ""
ENV STORAGE_ACCOUNT_KEY ""
ENV STORAGE_ACCOUNT_URL ""
ENV STORAGE_CONTAINER_NAME ""
ENV STRAPI_ADMIN_JWT_SECRET ""
ENV NOTIFY_BASE_API_URL ""
ENV NOTIFY_EMAIL_TEMPLATE_ID ""
ENV NOTIFY_API_KEY ""

COPY . .

RUN yarn install && yarn build

EXPOSE 5535

CMD ["yarn", "start"]
