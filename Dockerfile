FROM smartapps/bitbucket-pipelines-debian-9
LABEL maintainer="Chrometoaster"

RUN apt-get update -qy \
 && apt-get install -qy \
        bzip2 \
        ca-certificates \
        fonts-liberation \
        gcc \
        gconf-service \
        libappindicator1 \
        libasound2 \
        libatk1.0-0 \
        libcairo2 \
        libcups2 \
        libdbus-1-3 \
        libgconf-2-4 \
        libgdk-pixbuf2.0-0 \
        libgtk-3-0 \
        libnspr4 \
        libnss3 \
        libpango-1.0-0 libpangocairo-1.0-0 \
        libpng-dev \
        libx11-xcb1 \
        libxcomposite1 \
        libxcursor1 \
        libxdamage1 \
        libxfixes3 \
        libxi6 \
        libxrandr2 \
        libxrender1 \
        libxss1 \
        libxtst6 \
        make \
        pngquant \
        wget \
        xdg-utils \
    --no-install-recommends \
    --no-upgrade \
 && apt-get autoclean \
 && apt-get autoremove \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
