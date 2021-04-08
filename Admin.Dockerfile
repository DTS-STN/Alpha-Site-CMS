FROM node:lts-alpine

RUN apk add --no-cache --virtual python make g++ pkgconf libsecret-dev

ARG NODE_ENV='production'
ARG STRAPI_API_BACKEND_URL='http://localhost:1337'
ENV NODE_ENV $NODE_ENV
ENV STRAPI_API_BACKEND_URL $STRAPI_API_BACKEND_URL

COPY ./ ./

RUN npm install && npm run build

FROM nginx

COPY --from=0 build /usr/share/nginx/html





