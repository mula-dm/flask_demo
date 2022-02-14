FROM ubuntu:21.04
ADD . /opt/
WORKDIR /opt/
EXPOSE 80

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get install python3-pip gunicorn -yyqq
RUN pip3 install -r requirements.txt

CMD ["gunicorn", "-b", "0.0.0.0:80", "app:app"]
