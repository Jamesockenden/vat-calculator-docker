FROM node:24-alpine AS stage1

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx:1.28-alpine
COPY --from=stage1 /app/build /usr/share/nginx/html

COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf

COPY docker-cmd.sh /docker-cmd.sh
 
RUN chmod +x /docker-cmd.sh

EXPOSE 80

CMD ["/docker-cmd.sh"]