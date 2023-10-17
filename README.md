# LIVE555 HLS Proxy
The "LIVE555 HLS Proxy" is an application - built from the ["LIVE555 Streaming Media" software](http://www.live555.com/liveMedia/) - that allows a web browser to view a 'back-end' (unicast or multicast) RTSP/RTP stream (e.g., from a network camera). An arbitrary number of web browser clients can view the stream, but the back-end RTSP stream is accessed only once.

```
                                                                --> [HTTP (web browser) client1]
[back-end RTSP/RTP stream] --> [LIVE555 HLS Proxy] [Web Server] --> [HTTP (web browser) client2]
                                                                ...
                                                                --> [HTTP (web browser) clientN]
```

# LIVE555 HLS Proxy for Docker
Automated build of [LIVE555 HLS Proxy](http://www.live555.com/hlsProxy/).  
