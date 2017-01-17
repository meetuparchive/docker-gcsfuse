FROM mup.cr/orgx/build-sbt-gcloud:2

RUN echo "deb http://packages.cloud.google.com/apt gcsfuse-jessie main" | tee /etc/apt/sources.list.d/gcsfuse.list; \ 
  curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \ 
  apt-get update ; apt-get install -y apt-utils kmod && apt-get install -y gcsfuse

RUN mkdir -p /mnt/gcs

COPY gcsfuse.sh /