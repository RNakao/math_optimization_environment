FROM --platform=linux/amd64 python:3.7
# https://stackoverflow.com/questions/71040681/qemu-x86-64-could-not-open-lib64-ld-linux-x86-64-so-2-no-such-file-or-direc

WORKDIR /app
ADD . /app/

RUN apt-get -y update --allow-releaseinfo-change && \
    apt-get -y update && \
    apt-get install -y vim && \
    apt-get install -y libzbar-dev && \
    apt-get install -y build-essential && \
    apt-get install -y libgmp3-dev && \
    apt-get install -y libatlas3-base && \
    apt-get install -y libatlas-base-dev && \
    apt-get install -y libgsl0-dev && \
    apt-get install -y libfftw3-dev && \
    apt-get install -y libglpk-dev && \
    apt-get install -y libdsdp-dev

RUN pip install -U pip
RUN pip install -r requirements.txt
RUN sh install_cvxopt.sh
RUN jt -t monokai -f inconsolata -N -T -fs 11 -nfs 11 -cellw 95% -lineh 140
