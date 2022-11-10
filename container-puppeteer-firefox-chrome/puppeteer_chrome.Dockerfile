FROM ubuntu:22.04

# PUPPETEER
RUN apt update \
    && apt install curl gnupg nano -y \
    && curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
    && curl -fsSL https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt update \
    && apt install nodejs google-chrome-stable fonts-ipafont-gothic fonts-wqy-zenhei \
    fonts-freefont-ttf libxss1 --no-install-recommends -y \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www
COPY ./package.json /var/www/package.json
RUN npm i

# Chrome somehow cannot start without root and in order to start. This is a quick fix
RUN chmod -R 777 /var/www/node_modules/puppeteer/.local-chromium/
RUN chmod 777 /var/www/

# Switching to a non-root user for security concerns
USER 1001
CMD ["bash"]
