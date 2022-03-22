FROM ubuntu:devel

# COPY hola.txt /usr/share/hola.txt # Example of a simple COPY.
# COPY vsftpd.conf /etc/vsftpd.conf # Possible solution to a problem, not sure yet.
# RUN echo "Hello Mexico City!" >> /usr/share/HelloCDMX.txt # Example of a simple RUN.

# Instalamos todas las dependencias necesarias.
RUN apt update
RUN apt install vsftpd -y
RUN apt install ftp -y
RUN apt install iproute2 -y

# Comandos de launch para FTP.
RUN service vsftpd start
# RUN service vsftpd enable
RUN useradd -m testuser
# RUN passwd -testuser -testuser -testuser

# Creación del servidor en el contenedor.
RUN mkdir /srv/ftp/new_location
RUN echo "Hello world!" >> /srv/ftp/new_location/Hello.txt
RUN usermod -d /srv/ftp/new_location ftp
RUN service vsftpd restart

EXPOSE 20 21

# CMD ["apt install vsftpd", "ufw allow 20/tcp", "ufw allow 21/tcp", "daemon off;"]

