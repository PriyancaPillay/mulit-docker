FROM node:alpine
WORKDIR /usr/app
COPY ./package.json ./
COPY ./certs/* /etc/ssl/certs/
ENV SSL_CERT_DIR=/etc/ssl/certs
RUN apk add --update --no-cache openssl ca-certificates && \
    update-ca-certificates
RUN  npm install
COPY ./ /usr/app
CMD ["npm","run","start"]