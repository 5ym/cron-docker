FROM alpine

RUN apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata && \
    apk --no-cache add ssmtp docker-cli
ADD ssmtp.conf /etc/ssmtp/ssmtp.conf

CMD crond -f -d 8
