FROM alpine:latest

LABEL maintainer="Philipp Staiger"

RUN apk add --update --no-cache  \
		bash \
		gnupg \
		duply \
		haveged \
		ncftp \
		pwgen \
		rsync \
		openssh-client \
		py-boto \
   && rm -rf /var/cache/apk/*
#   && rc-service crond start && rc-update add crond
#   \
#	&& pip install \
#		boto \
#		paramiko \
#		python-dev \
#   python-boto \
#   python-paramiko \

ENV HOME /root

ENV KEY_TYPE      RSA
ENV KEY_LENGTH    2048
ENV SUBKEY_TYPE   RSA
ENV SUBKEY_LENGTH 2048
ENV NAME_REAL     Duply Backup
ENV NAME_EMAIL    duply@localhost
ENV PASSPHRASE    random

VOLUME ["/root"]

COPY files/entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/bin/bash"]
#CMD ["startcron"]
