FROM alpine

# install requirements
RUN apk --no-cache --update add \
      ca-certificates  git openssh util-linux && \
      rm -rf /var/lib/apt/lists/* && \
      rm -f /var/cache/apk/*

RUN git clone https://github.com/alexkaratarakis/gitattributes.git /root/.gitattributes-boilerplates
COPY gabo gabo

ENTRYPOINT ["./gabo"]
