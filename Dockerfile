FROM nginx:alpine

LABEL maintainer="Industrial Arm 3D Visualization"
LABEL description="3D interactive visualization for industrial robotic arm"

WORKDIR /app

COPY industrial-arm-3d.html index.html

COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget --quiet --tries=1 --spider http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
