FROM nginx:1.17.6
ENV NGINX_ROOT /etc/nginx/conf.d
ADD nginx.conf /etc/nginx/
RUN mkdir sockets
CMD ["nginx", "-g", "daemon off;", "-c", "/etc/nginx/nginx.conf"]
