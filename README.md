# Nginx Begginer Guide

## Simple Proxy Server

Nginx can act as a **reverse proxy**, receiving a request from the client and forwarding it to another internal server using `proxy_pass`.

Example:

```nginx
location / {
    proxy_pass http://localhost:8080;
}
```

Requests to `/` are sent to the backend running on port **8080**, and Nginx returns the backend’s response to the user.

## Static Files + Proxy

Nginx can also serve static files directly:

```nginx
location ~ \.(gif|jpg|png)$ {
    root /data/images;
}
```

So Nginx can both:

- proxy dynamic requests to a backend
- serve static files from disk

## Multiple Servers

You can define a backend inside Nginx itself:

```nginx
server {
    listen 8080;
    root /data/up1;
}
```

Then the main server proxies to it. This forms a simple and complete proxy setup.
