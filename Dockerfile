FROM ubuntu:latest

# COPY vsftpd.conf /etc/vsftpd.conf
COPY hola.txt /usr/share/hola.txt

EXPOSE 20 21

# CMD ["apt install vsftpd", "ufw allow 20/tcp", "ufw allow 21/tcp", "daemon off;"]

