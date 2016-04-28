FROM mhimmer/dropbox

RUN apt-get update && apt-get install -y vim screen

COPY src/dropbox-whitelist /usr/bin/dropbox-whitelist
RUN mkdir -p /root/Dropbox/Apps/Blot && \
    mkdir -p /root/Dropbox/fagerheimen.no && \
    mkdir -p /root/Hjemmeside/filer && \
    mkdir -p /root/Hjemmeside/tekst && \
    ln --symbolic /root/Hjemmeside/filer /root/Dropbox/Apps/Blot/public && \
    ln --symbolic /root/Hjemmeside/tekst /root/Dropbox/Apps/Blot/text && \
    ln --symbolic /root/Hjemmeside/filer /root/Dropbox/fagerheimen.no/filer && \
    ln --symbolic /root/Hjemmeside/tekst /root/Dropbox/fagerheimen.no/tekst

RUN crontab -l | { cat; echo "* * * * * /usr/bin/dropbox-whitelist >>/var/log/dropbox-whitelist.log 2>&1"; } | crontab -
RUN touch /var/log/dropbox-whitelist.log

CMD service cron start ; /usr/bin/dropbox-whitelist ; tail -f /var/log/dropbox-whitelist.log
