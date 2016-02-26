FROM dtank/core:latest

MAINTAINER benharker@mac.com

RUN wget -O - http://ppa.moosefs.com/moosefs.key | apt-key add - && echo "deb http://ppa.moosefs.com/current/apt/ubuntu/trusty trusty main" >> /etc/apt/sources.list.d/moosefs.list ;
RUN apt-get update ; apt-get install -y moosefs-client moosefs-cli nano wget dialog net-tools ; rm -rf /var/lib/apt/lists/* ; mkdir /mnt/MFS ;
ADD nginx.conf /etc/nginx/
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
EXPOSE 80

CMD ["/usr/bin/mfsmount /mnt/MFS -H 10.2.0.91 -o allow_other; service nginx start"]
