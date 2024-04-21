FROM fedora

RUN yum update -y && yum install -y ansible && yum install -y openssh-server
RUN mkdir /var/run/sshd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN echo 'root:root123' | chpasswd

EXPOSE 22
# CMD ["/usr/sbin/sshd", "-D", "-o", "ListenAddress=0.0.0.0"]

# CMD ["/usr/sbin/sshd", "-D"]
# ENTRYPOINT systemctl start sshd && /bin/bash
# CMD [ "systectl ssh start" ]
# CMD ["/usr/sbin/sshd", "-D", "-o", "ListenAddress=0.0.0.0"]