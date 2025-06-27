FROM node:18-bullseye

RUN apt-get update && \
    apt-get install -y \
        git \
        unzip \
        net-tools \
        iputils-ping \
        && rm -rf /var/lib/apt/lists/*

COPY config/pjsip.conf /etc/asterisk/pjsip.conf
COPY config/extensions.conf /etc/asterisk/extensions.conf

EXPOSE 5060/udp
EXPOSE 10000-20000/udp

CMD ["asterisk", "-f"]