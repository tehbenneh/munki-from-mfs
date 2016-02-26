FROM dtank/core:latest

MAINTAINER benharker@mac.com

RUN wget -O - http://ppa.moosefs.com/moosefs.key | apt-key add - && echo "deb http://ppa.moosefs.com/current/apt/ubuntu/trusty trusty main" >> /etc/apt/sources.list.d/moosefs.list ;
RUN apt-get update ; apt-get install -y moosefs-client moosefs-cli nano nginx wget dialog net-tools ; rm -rf /var/lib/apt/lists/* ; mkdir /mnt/MFS ;
ADD nginx.conf /etc/nginx/
ADD run-munki /usr/local/bin/run-munki
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN chmod 777 /usr/local/bin/run*
EXPOSE 80

CMD ["/bin/bash /usr/local/bin/run-munki"]
