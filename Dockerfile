FROM wordpress:latest
RUN echo "build-$(date -u +'%Y%m%dT%H%M%SZ')" > /build-info.txt
