FROM node:10-alpine

ENV XBROWSERSYNC_VERSION v1.1.4

RUN wget --quiet https://github.com/xBrowserSync/API/archive/${XBROWSERSYNC_VERSION}.tar.gz \
    && mkdir /xbrowsersync \
    && tar -C /xbrowsersync --strip-components=1 -xzf ${XBROWSERSYNC_VERSION}.tar.gz \
    && rm ${XBROWSERSYNC_VERSION}.tar.gz

WORKDIR /xbrowsersync

RUN npm install

COPY run.sh .

CMD [ "/bin/bash", "run.sh" ]

EXPOSE 8080
