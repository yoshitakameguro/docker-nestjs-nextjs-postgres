# base
FROM node:19.4.0-alpine3.16 as base

RUN apk add --no-cache libc6-compat
RUN apk update

WORKDIR /app
RUN yarn global add pnpm
CMD pnpm install

# frontend
FROM base as frontend
CMD pnpm dev

# backend
FROM base as backend
RUN yarn global add @nestjs/cli
CMD pnpm turbo dev
