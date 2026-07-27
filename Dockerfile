# Static Astro build served by nginx (Coolify build_pack=dockerfile;
# nixpacks crash-loops on static output with no start command).
FROM node:22-alpine AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
# Build-time inlined into the requirements form; must exist as ARG here.
ARG PUBLIC_REQUIREMENTS_ENDPOINT=https://api.brotea.dev/requirements
ENV PUBLIC_REQUIREMENTS_ENDPOINT=$PUBLIC_REQUIREMENTS_ENDPOINT
RUN npm run build

FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
