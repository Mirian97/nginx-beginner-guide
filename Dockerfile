FROM nginx:1.29.3-alpine

COPY nginx.conf /etc/nginx/nginx.conf
COPY data /data

CMD ["nginx", "-g", "daemon off;"]