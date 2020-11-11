FROM ubuntu
RUN apt-get update
RUN apt-get install -y nginx
RUN apt-get clean
EXPOSE 80
