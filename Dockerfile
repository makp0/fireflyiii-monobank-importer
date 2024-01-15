FROM alpine:latest

RUN apk add --update --no-cache python3 py-pip tzdata && ln -sf python3 /usr/bin/python
WORKDIR /app
COPY src/requirements .
RUN pip install -r requirements
RUN rm requirements

COPY /src ./src

COPY cronconfig /etc/crontabs/root

CMD ["crond", "-f"]