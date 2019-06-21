FROM ubuntu:latest

RUN apt-get update -y
RUN apt-get install software-properties-common -y

RUN apt-add-repository --yes --update ppa:ansible/ansible
RUN apt-add-repository universe -y
RUN apt-add-repository main -y

RUN apt-get update -y
RUN apt-get install -y ansible \
    python-pip python-dev build-essential \
    python-selinux rsync nano iputils-ping

RUN pip install --upgrade pip
RUN pip install configparser
RUN pip install requests
RUN pip install pywinrm
RUN pip install proxmoxer

RUN mkdir /ansible
COPY ./container-files /
RUN chmod +x /etc/ansible/proxmox.py
RUN chmod +x /etc/ansible/get-wm-ip.py

COPY ./playbooks /ansible
COPY ./roles /etc/ansible/roles

RUN find /ansible -type f -name '*.retry' -delete

ENV ANSIBLE_HOST_KEY_CHECKING=False

