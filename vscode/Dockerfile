FROM gianv9/xpra-base-ubuntu

RUN apt-get update && \
    apt-get install -y \
    gpg \
    curl \
    apt-transport-https

RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
    install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/ && \
    sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

RUN apt-get update && \
    apt-get install -y code

RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg

COPY entrypoint.sh /
RUN chmod 755 /entrypoint.sh

CMD [ "/entrypoint.sh"]