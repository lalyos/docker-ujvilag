FROM ubuntu:focal-20200925
RUN apt-get update -qq
RUN apt-get install -y curl nginx
EXPOSE 80

COPY start.sh /
RUN chmod +x /start.sh
ENV BODY="please use the BODY env var to specify this msg"
CMD [ "/start.sh" ]