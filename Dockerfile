FROM ubuntu:19.10

LABEL maintainer="pnowy"

RUN apt update && \
    apt install git -y && \
    apt install curl -y && \
    apt install gnupg2 wget iputils-ping -y

RUN apt-get install openjdk-11-jdk -y && \
    apt install maven -y

ENV KUBECTL_VERSION="v1.14.7"
ENV KUBECTX_VERSION "0.6.3"

RUN apt-get install -y apt-transport-https && curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list && \
    apt-get update && \
    apt-get install -y kubectl

RUN curl -L -o /usr/local/bin/kubectx https://raw.githubusercontent.com/ahmetb/kubectx/v${KUBECTX_VERSION}/kubectx \
	&& curl -L -o /usr/local/bin/kubens https://raw.githubusercontent.com/ahmetb/kubectx/v${KUBECTX_VERSION}/kubens \
    && chmod +x /usr/local/bin/kubectx && chmod +x /usr/local/bin/kubens

RUN mkdir -p $HOME/.kube