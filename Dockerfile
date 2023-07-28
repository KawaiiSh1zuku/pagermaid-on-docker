FROM ubuntu:latest
SHELL ["/bin/bash", "-c"]
WORKDIR /opt
RUN apt update -y && apt install -y git neofetch libzbar-dev python3-pip ffmpeg && mkdir -p PagerMaid
COPY pgm.tar ./
RUN tar -xvf pgm.tar -C PagerMaid && rm -rf pgm.tar
WORKDIR /opt/PagerMaid
RUN pip3 install -r requirements.txt
EXPOSE 2288
CMD ["python3", "-m", "pagermaid"]
