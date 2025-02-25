# Menggunakan base image Node.js versi 14
FROM node:14

# Menentukan working directory di dalam container
WORKDIR /app

# Menyalin seluruh source code ke dalam working directory
COPY . .

# Menentukan environment variables untuk production mode dan database host
ENV NODE_ENV=production \
    DB_HOST=item-db

# Menginstal dependencies untuk production dan build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# Mengekspos port 8080
EXPOSE 8080

# Menjalankan aplikasi
CMD ["npm", "start"]