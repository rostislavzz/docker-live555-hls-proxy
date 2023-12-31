FROM alpine AS builder
RUN apk add --update --no-cache build-base openssl-dev

# Get LIVE555 Media Server source code
RUN cd /tmp/ && \
  wget http://www.live555.com/liveMedia/public/live555-latest.tar.gz && \
  tar zxf live555-latest.tar.gz && rm live555-latest.tar.gz

# Building with C++ version 20
# http://lists.live555.com/pipermail/live-devel/2023-August/022380.html
RUN echo -e "CPPFLAGS = -std=c++20\r\n$(cat /tmp/live/config.linux)" > /tmp/live/config.linux

# Compile LIVE555 HLS Proxy
RUN cd /tmp/live && ./genMakefiles linux && \
  make && make install && make distclean

FROM alpine
RUN apk add --update --no-cache libstdc++ lighttpd

COPY --from=builder /usr/local/bin/live555HLSProxy /usr/local/bin/
COPY docker-entrypoint.sh /usr/local/bin

WORKDIR /var/www/localhost/htdocs/
COPY index.html ./

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
