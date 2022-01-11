send_h264file_by_rtp
====================

send h264 file by rtp via udp

test:

```console
$ make
$ make test

$ # cvlc test.sdp &  # or mplayer(or ffplay) test.sdp &
or
$ # gst-launch-1.0 -v udpsrc address=0.0.0.0 port=5004 caps="application/x-rtp, media=(string)video, clock-rate=(int)90000, encoding-name=(string)H264, payload=(int)96" ! rtph264depay ! avdec_h264 ! autovideosink

$ # ./h264tortp record.h264 127.0.0.1 5004
```

