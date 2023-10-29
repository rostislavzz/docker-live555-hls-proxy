# LIVE555 HLS Proxy
The "LIVE555 HLS Proxy" is an application - built from the ["LIVE555 Streaming Media" software](http://www.live555.com/liveMedia/) - that allows a web browser to view a 'back-end' (unicast or multicast) RTSP/RTP stream (e.g., from a network camera). An arbitrary number of web browser clients can view the stream, but the back-end RTSP stream is accessed only once.

```
                                                                --> [HTTP (web browser) client1]
[back-end RTSP/RTP stream] --> [LIVE555 HLS Proxy] [Web Server] --> [HTTP (web browser) client2]
                                                                ...
                                                                --> [HTTP (web browser) clientN]
```

 Specifically, the "LIVE555 HLS Proxy" converts a live RTSP stream (e.g., from a network camera) into a set of HLS (["HTTP Live Streaming"](https://en.wikipedia.org/wiki/HTTP_Live_Streaming)) segments that can be viewed in a HLS-compliant browser (e.g., "Safari" on Macs or iPhones).

# LIVE555 HLS Proxy for Docker
Automated build of [LIVE555 HLS Proxy](http://www.live555.com/hlsProxy/).

# Usage
Provide the RTSP url and HLS-prefix to your Docker container as the ```command``` property: <rtsp://-url-of-your-RTSP-stream> <HLS-prefix>
Where <HLS-prefix> is a name to give to your stream (as seen by web browser users).

HLS-compatible web browsers will then be able to view the stream via the HTTP (or HTTPS) URL:  <URL-of-your-web-server>/<HLS-prefix>.m3u8

Here are some example snippets to help you get started creating a container.

**docker-compose**
```
version: '2'
services:
  live555-hls-proxy:
    image: paradisi/live555-hls-proxy
    container_name: live555-hls-proxy
    network_mode: host
    ports:
      - 8080:80
    command: <rtsp://-url-of-your-RTSP-stream> <HLS-prefix>
    restart: unless-stopped
```

**docker cli**
```
docker run -d \
  --name=live555-hls-proxy \
  --net=host \
  -p 8080:80 \
  --restart unless-stopped \
  paradisi/live555-hls-proxy \
  <rtsp://-url-of-your-RTSP-stream> <HLS-prefix>
```
