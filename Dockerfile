FROM node:20-alpine

ARG ROOT_PASSWORD=root

WORKDIR /

RUN apk add --no-cache tree wget bash openssh openrc

RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh && \
    ssh-keygen -A && \
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && \
    echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config && \
    mkdir -p /run/openrc && \
    touch /run/openrc/softlevel


RUN echo "root:${ROOT_PASSWORD}" | chpasswd

WORKDIR /home

RUN npx create-docusaurus@latest docs classic --typescript

WORKDIR /home/docs

CMD ["sh", "-c", "rc-status; rc-service sshd start; npm start -- --host 0.0.0.0"]

EXPOSE 3000 22