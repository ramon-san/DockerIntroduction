FROM ubuntu:latest

# COPY hola.txt /usr/share/hola.txt # Example of a simple COPY.
# COPY vsftpd.conf /etc/vsftpd.conf # Possible solution to a problem, not sure yet.
# RUN echo "Hello Mexico City!" >> /usr/share/HelloCDMX.txt # Example of a simple RUN.
RUN apt update
RUN apt install vsftpd -y

EXPOSE 20 21

# CMD ["apt install vsftpd", "ufw allow 20/tcp", "ufw allow 21/tcp", "daemon off;"]

