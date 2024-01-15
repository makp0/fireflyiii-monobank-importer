FROM alpine:latest

RUN apk add --update --no-cache python3 py-pip tzdata && ln -sf python3 /usr/bin/python
WORKDIR /app
COPY /src .

RUN pip install --user -r requirements.txt

COPY cronconfig /etc/crontabs/root

CMD ["crond", "-f"]