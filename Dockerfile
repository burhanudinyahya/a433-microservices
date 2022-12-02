# base image Node.js versi 14.
FROM node:14-alpine

# working directory untuk container adalah /app.
WORKDIR /app

# menyalin seluruh source code ke working directory di container.
COPY . .

# set production mode dan menggunakan container bernama item-db sebagai database host.
ENV NODE_ENV=production DB_HOST=item-db

# install dependencies untuk production dan kemudian build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# ekspos bahwa port yang digunakan oleh aplikasi adalah 8080.
EXPOSE 8080

# saat container diluncurkan, jalankan server dengan perintah npm start.
CMD ["npm", "start"]