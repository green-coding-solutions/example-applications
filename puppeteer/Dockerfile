FROM ubuntu

# PUPPETEER
RUN apt-get update \
    && curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install -y wget gnupg nodejs \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-stable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-freefont-ttf libxss1 \
      --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/puppeteer
COPY ./puppeteer/ /var/www/puppeteer

# For production enable these commands. Otherwise use the pre-downloaded modules folder
# RUN npm i
# RUN node puppeteer.js

RUN chmod -R 777 /var/www/puppeteer/node_modules/puppeteer/.local-chromium/
RUN chmod 777 /var/www/puppeteer/

# Debugging. Remove in production
RUN apt-get update
RUN apt-get install nano curl telnet -y

USER 1001
CMD ["bash"]
# docker build --tag tgwf-puppeteer .
# docker compose run bash