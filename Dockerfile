FROM ubuntu:16.04
#
RUN apt-get update
RUN apt-get -y install sudo openssh-server openjdk-8-jdk git gcc make openssl libssl-dev libbz2-dev libreadline-dev libsqlite3-dev
#
RUN mkdir -p /var/run/sshd
RUN useradd -d /home/jenkins -m -s /bin/bash jenkins
RUN echo jenkins:password | chpasswd
RUN echo 'jenkins ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
#
RUN apt-get install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common \
    && curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg \
     | apt-key add - \
    && add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
     $(lsb_release -cs) \
     stable" \
    && apt-get update \
    && apt-get install -y docker-ce \
    && usermod -aG docker jenkins
#
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
