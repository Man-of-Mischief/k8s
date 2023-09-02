FROM python:3.8-alpine

ENV DOCROOT /home/nidhin

ENV PORT 3000

ENV USER nidhin

RUN adduser -h $DOCROOT -D -s /bin/sh $USER

WORKDIR /app

COPY app.py .

COPY requirements.txt .

RUN chown -R $USER:$USER $DOCROOT

RUN apk update

RUN apk add python3 py3-pip --no-cache 

RUN pip3 install -r requirements.txt

EXPOSE $PORT

USER $USER

CMD ["python", "app.py"]