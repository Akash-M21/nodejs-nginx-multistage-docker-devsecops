# =====================
# Stage 1: Build
# =====================
FROM node:22 AS build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

RUN npm run build


# =====================
# Stage 2: Test
# =====================
FROM node:22 AS test

WORKDIR /app

COPY --from=build /app .

RUN npm test


# =====================
# Stage 3: Runtime (Nginx)
# =====================
FROM nginx:alpine

COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
