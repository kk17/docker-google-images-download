FROM python:3.8-slim-buster

# install google-chrome, chromedriver and git
# https://gist.github.com/varyonic/dea40abcf3dd891d204ef235c6e8dd79
RUN apt-get update && \
    apt-get install -y git gnupg wget curl unzip --no-install-recommends && \
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list && \
    apt-get update -y && \
    apt-get install -y google-chrome-stable && \
    CHROMEVER=$(google-chrome --product-version | grep -o "[^\.]*\.[^\.]*\.[^\.]*") && \
    DRIVERVER=$(curl -s "https://chromedriver.storage.googleapis.com/LATEST_RELEASE_$CHROMEVER") && \
    wget -q --continue -P /chromedriver "http://chromedriver.storage.googleapis.com/$DRIVERVER/chromedriver_linux64.zip" && \
    unzip /chromedriver/chromedriver* -d /chromedriver

WORKDIR /root
# install forked version google-images-download
RUN git clone https://github.com/Joeclinton1/google-images-download.git \
  && cd google-images-download && pip install -e .

WORKDIR /workspace

ENTRYPOINT [ "googleimagesdownload" ]
