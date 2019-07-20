FROM alpine

# install requirements
RUN apk --no-cache --update add git \
      && git clone https://github.com/alexkaratarakis/gitattributes.git /root/.gitattributes-boilerplates
COPY gabo gabo

ENTRYPOINT ["./gabo"]
