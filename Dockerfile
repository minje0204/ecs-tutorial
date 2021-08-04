FROM node:latest AS builder
WORKDIR /app
COPY ./package.json ./
RUN npm install
COPY . .
RUN npm run build

FROM node:current-alpine3.11
WORKDIR /app
COPY --from=builder /app ./
EXPOSE 3000
CMD ["npm","run","start:prod"]