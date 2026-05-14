FROM n8nio/n8n:latest

USER root

RUN apt-get update && apt-get install -y ffmpeg python3 python3-pip curl

RUN pip3 install edge-tts

USER node