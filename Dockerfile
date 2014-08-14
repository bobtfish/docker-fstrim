FROM ubuntu:lucid
ENV VERSION 2.25
RUN apt-get update -q
RUN apt-get install -qy curl build-essential
RUN mkdir /src
WORKDIR /src
RUN curl https://www.kernel.org/pub/linux/utils/util-linux/v$VERSION/util-linux-$VERSION.tar.gz \
     | tar -zxf-
RUN ln -s util-linux-$VERSION util-linux
WORKDIR /src/util-linux
RUN ./configure --without-ncurses --without-python
RUN make LDFLAGS=-all-static fstrim
RUN cp fstrim /
ADD installer /installer
CMD /installer
