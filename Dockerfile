FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get install -y python3.8 python3-dev  build-essential pip gunicorn
RUN pip install --upgrade setuptools
RUN pip install ez_setup
COPY . /app
WORKDIR /app
RUN pip install -r /app/req.txt
CMD [ "gunicorn", "wsgi:app", "-b", "0.0.0.0:8000"]