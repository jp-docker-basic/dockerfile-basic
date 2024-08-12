# Build stage
FROM node:16-alpine AS build
WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# Production stage
FROM node:16-alpine

WORKDIR /app

COPY --from=build /app/build .

EXPOSE 3000

CMD ["node", "index.js"]