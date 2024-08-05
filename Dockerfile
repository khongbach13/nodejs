# Sử dụng image cơ sở Node.js
FROM node:14

# Tạo thư mục ứng dụng
WORKDIR /usr/src/app

# Sao chép package.json và package-lock.json
COPY package*.json ./

# Cài đặt các phụ thuộc
RUN npm install

# Sao chép mã nguồn vào container
COPY . .

# Mở cổng cho ứng dụng
EXPOSE 3000

# Chạy ứng dụng
CMD [ "npm", "start" ]

