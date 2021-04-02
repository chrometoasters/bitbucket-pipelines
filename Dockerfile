FROM smartapps/bitbucket-pipelines-debian-10
LABEL maintainer="Chrometoaster"

RUN apt-get update -qy \
 && apt-get install -qy \
        bzip2 \
        curl \
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
        libfontconfig1 \
        libgconf-2-4 \
        libgdk-pixbuf2.0-0 \
        libgmp-dev \
        libgtk-3-0 \
        libnspr4 \
        libnss3 \
        libpango-1.0-0 \
        libpangocairo-1.0-0 \
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
        php7.3-gmp \
        pngquant \
        software-properties-common \
        wget \
        xdg-utils \
    --no-install-recommends \
    --no-upgrade \
 && apt-get purge --auto-remove -y \
 && apt-get autoclean \
 && apt-get autoremove \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# install PhantomJS
RUN mkdir /tmp/phantomjs \
 && curl -L https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 \
        | tar -xj --strip-components=1 -C /tmp/phantomjs \
 && mv /tmp/phantomjs/bin/phantomjs /usr/local/bin
