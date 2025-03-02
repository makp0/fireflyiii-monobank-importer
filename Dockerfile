FROM python:3.11-bookworm

WORKDIR /app
COPY /src .

RUN pip install -r /app/requirements.txt

COPY cronconfig /etc/crontabs/root

CMD ["crond", "-f"]