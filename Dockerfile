FROM progrium/busybox
RUN opkg-install curl tar node &&\
    curl --insecure https://nodejs.org/dist/v5.9.1/node-v5.9.1-linux-x64.tar.gz  | gunzip | tar -xf - -C / && \
    mv /node-v5.9.1-linux-x64/bin/node /usr/bin/node && \
    opkg-cl remove curl  --autoremove && \
    rm -rf /node-v5.9.1-linux-x64 \
    opkg-install make git python

COPY bin/* /src/bin/
