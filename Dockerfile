FROM ubuntu:latest

# Instalamos todas las dependencias necesarias.
RUN apt update
RUN apt install vsftpd -y
RUN apt install systemctl -y
RUN apt install ftp -y
RUN apt install iproute2 -y

# Modificamos el archivo de configuración.
RUN sed 's/anonymous_enable=NO/anonymous_enable=YES/g' vsftpd.conf -i

# Comandos de launch para FTP.
RUN systemctl start vsftpd
RUN systemctl enable vsftpd
# RUN useradd -m testuser
# RUN passwd -testuser -testuser -testuser

# Creación del servidor en el contenedor.
RUN mkdir /srv/ftp/new_location
RUN echo "Hello world!" >> /srv/ftp/new_location/Hello.txt
RUN usermod -d /srv/ftp/new_location ftp
RUN systemctl restart

EXPOSE 20 21
