FROM ubuntu:19.10
LABEL maintainer="pnowy"

RUN apt update && \
    apt install git -y && \
    apt install curl -y && \
    apt install unzip -y && \
    apt install zip -y && \
    apt install wget -y

RUN apt-get install openjdk-11-jdk -y && \
    apt install maven -y

RUN curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator && \
    chmod +x ./aws-iam-authenticator && \
    mkdir -p $HOME/bin && cp ./aws-iam-authenticator $HOME/bin/aws-iam-authenticator && export PATH=$HOME/bin:$PATH && \
    echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc

RUN apt install amazon-ecr-credential-helper