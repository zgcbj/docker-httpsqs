FROM alpine:latest
MAINTAINER zgcbj(https://github.com/zgcbj)
RUN apk add --no-cache alpine-sdk zlib-dev bzip2-dev bsd-compat-headers
ADD httpsqs-1.7.tar.gz /usr/local/src/
ADD libevent-2.0.12-stable.tar.gz /usr/local/src/
ADD tokyocabinet-1.4.47.tar.gz /usr/local/src/
#RUN tar zxf /usr/local/src/httpsqs-1.7.tar.gz -C /usr/local/src/sqs
#RUN tar zxf /usr/local/src/libevent-2.0.12-stable.tar.gz -C /usr/local/src/libevent
#RUN tar zxf /usr/local/src/tokyocabinet-1.4.47.tar.gz -C /usr/local/src/tokyocabinet
RUN cd /usr/local/src/libevent-2.0.12-stable && ./configure --prefix=/usr/local/libevent-2.0.12-stable/ && make && make install
RUN cd /usr/local/src/tokyocabinet-1.4.47 && ./configure --prefix=/usr/local/tokyocabinet-1.4.47/ && make && make install
RUN cd /usr/local/src/httpsqs-1.7 && make && make install
RUN rm -rf /usr/local/src/*
RUN apk del alpine-sdk bsd-compat-headers
RUN ulimit -SHn 65535
RUN mkdir -p /data
CMD ["-h"]
ENTRYPOINT ["/usr/bin/httpsqs"]
