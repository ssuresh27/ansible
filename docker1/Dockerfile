# #https://kinsta.com/blog/ssh-into-docker-container/
# #https://github.com/mmumshad/ubuntu-ssh-enabled
FROM debian:latest
WORKDIR '/app'
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:root123' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]