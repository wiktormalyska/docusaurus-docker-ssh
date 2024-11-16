FROM node:20-alpine

ARG ROOT_PASSWORD=root

ENV ROOT_PASSWORD=${ROOT_PASSWORD}

WORKDIR /

RUN apk add --no-cache tree wget bash openssh

RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh && \
    ssh-keygen -A && \
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && \
    echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config


RUN echo "root:${ROOT_PASSWORD}" | chpasswd

WORKDIR /home
RUN npx create-docusaurus@latest docs classic --typescript

WORKDIR /home/docs

CMD ["sh", "-c", "/usr/sbin/sshd && npm start -- --host 0.0.0.0"]

EXPOSE 3000 22
