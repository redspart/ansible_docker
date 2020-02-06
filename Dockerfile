FROM centos/systemd

MAINTAINER "Hung Nguyen" <you@example.com>

RUN yum -y install openssh-server openssh-clients; yum clean all; systemctl enable sshd.service

# Create user 
RUN adduser super && \
    usermod -a -G wheel super && \
    echo "super:password" | chpasswd

RUN rm /usr/lib/tmpfiles.d/systemd-nologin.conf

EXPOSE 22

CMD ["/usr/sbin/init"]

#docker run --privileged --name sshserver -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 2222:22 -d  sshd
#docker build --rm --no-cache -t sshd .
