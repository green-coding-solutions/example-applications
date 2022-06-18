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

WORKDIR /var/www/puppeteer
COPY ./puppeteer/ /var/www/puppeteer

RUN npm i

RUN chmod -R 777 /var/www/puppeteer/node_modules/puppeteer/.local-chromium/
RUN chmod 777 /var/www/puppeteer/

USER 1001
CMD ["bash"]
