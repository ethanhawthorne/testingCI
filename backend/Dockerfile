FROM node:20-alpine AS build

WORKDIR /usr/src/app
COPY package*.json ./
COPY prisma ./prisma
RUN npm ci --include=dev
COPY src ./src
COPY tsconfig.json ./tsconfig.json
RUN npm run build && npx prisma generate --schema=prisma/schema.prisma

FROM node:20-alpine
RUN apk add --no-cache ca-certificates openssl && update-ca-certificates
ENV NODE_ENV=production
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci --omit=dev
COPY --from=build /usr/src/app/dist ./dist
COPY --from=build /usr/src/app/node_modules/.prisma ./node_modules/.prisma
COPY prisma ./prisma
ENV NODE_TLS_REJECT_UNAUTHORIZED=0
EXPOSE 3001
CMD ["node", "dist/index.js"]
