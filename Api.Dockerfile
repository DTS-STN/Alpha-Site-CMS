FROM strapi/base

ARG NODE_ENV="production"
ARG STRAPI_API_HOST="0.0.0.0"
ARG STRAPI_API_PORT=1337
ARG STRAPI_API_BACKEND_URL="/api"
ARG STRAPI_STORAGE="azure"

ENV NODE_ENV $NODE_ENV
ENV STRAPI_API_HOST $STRAPI_API_HOST
ENV STRAPI_PORT $STRAPI_API_PORT
ENV STRAPI_STORAGE $STRAPI_STORAGE
ENV STORAGE_ACCOUNT ""
ENV STORAGE_ACCOUNT_KEY ""
ENV STORAGE_ACCOUNT_URL ""
ENV STORAGE_CONTAINER_NAME ""
ENV STRAPI_ADMIN_JWT_SECRET ""

COPY ./package.json ./
COPY ./yarn.lock ./

RUN yarn install

COPY . .

EXPOSE 1337

CMD ["yarn", "start"]
