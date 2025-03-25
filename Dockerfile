# Menggunakan base image node dengan versi 14
FROM node:14

# Membuat /app sebagai working directory untuk docker image aplikasinya
WORKDIR /app

# Menyalin semua codingan yang terdapat pada level directory yang sama dengan Dockerfile ke dalam working directory container
COPY . .

# Setting Environtment yang akan digunakan oleh aplikasi
ENV NODE_ENV=production
ENV DB_HOST=item-db

# Menjalankan perintah pada container untuk menginstall lalu membuild aplikasi
RUN npm install --production --unsafe-perm && npm run build

# Mengekspos port 8080 pada container karena aplikasi mendengarkan pada port 8080
EXPOSE 8080

# Ketika container di jalankan, itu akan menjalankan perintah npm start
CMD [ "npm", "start" ]