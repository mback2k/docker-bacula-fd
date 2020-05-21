FROM mback2k/ubuntu:rolling

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        bacula-fd && \
    apt-get clean

EXPOSE 9102

VOLUME /run/bacula
VOLUME /var/lib/bacula

ADD docker-entrypoint.d/ /run/docker-entrypoint.d/
ENV DOCKER_ENV_HIDEVARS BACULA_CLIENT_PASS

CMD ["/usr/sbin/bacula-fd", "-f"]
