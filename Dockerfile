FROM python:3.6-alpine

USER root
ENV PYTHONIOENCODING=utf-8
USER root

RUN mkdir /crawler_app
WORKDIR /crawler_app

RUN apk add --update --no-cache g++ gcc libxslt-dev
RUN apk update && apk add bash

ADD . .

RUN pip3 install -r requirements.txt

EXPOSE 5000

CMD python3 cron_job/cron_schedule.py; cd rest_api; python3 app.py

# sudo docker build --no-cache -t crawler-python:latest .
<<<<<<< HEAD
# sudo docker run -it --rm -e LANG=C.UTF-8 -p 5000:5000 crawler-python
=======
# sudo docker run -it --rm -e LANG=C.UTF-8 -p 5000:5000 crawler-python
>>>>>>> develop
