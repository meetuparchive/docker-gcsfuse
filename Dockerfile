FROM mup.cr/blt/build-sbt:80

ENV GCLOUD_VERSION 107.0.0
ENV GCLOUD_PLATFORM linux-x86_64

RUN cd /usr/local \
    && curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-$GCLOUD_VERSION-$GCLOUD_PLATFORM.tar.gz \
    && tar zxf google-cloud-sdk-$GCLOUD_VERSION-$GCLOUD_PLATFORM.tar.gz \
    && rm google-cloud-sdk-$GCLOUD_VERSION-$GCLOUD_PLATFORM.tar.gz \
    && ./google-cloud-sdk/install.sh --additional-components beta gcd-emulator -q \
    && ln -s /usr/local/google-cloud-sdk/bin/gcloud /usr/bin/gcloud
