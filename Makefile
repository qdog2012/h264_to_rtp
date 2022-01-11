#CROSS_COMPILE?= mips-linux-uclibc-gnu-

C_COMPILER   =  $(CROSS_COMPILE)gcc


CFLAGS = -Wall -O2
LDLIBS = -lpthread

TARGET := h264tortp
#		  test_tcp_send_nal test_tcp_recv_nal \
#		  test_decode_rtp2h264

.PHONY : clean all

all: $(TARGET)

test_tcp_send_nal: test_tcp_send_nal.o

test_tcp_recv_nal: test_tcp_recv_nal.o

test_rtp2h264: test_rtp2h264.o

test_decode_rtp2h264: test_decode_rtp2h264.o

h264tortp: h264tortp.o llist_i386.o
	$(C_COMPILER) $^ -o $@ -Wall

h264tortp.o: h264tortp.c h264tortp.h
	$(C_COMPILER) -c $< -o $@ -Wall

llist_i386.o: llist.c
	$(C_COMPILER) -c $< -o $@ -Wall

test: h264tortp
	#cvlc test.sdp &  # or mplayer(or ffplay) test.sdp &
	./h264tortp record.h264 127.0.0.1 5004

clean:
	@rm -f $(TARGET) *.o

