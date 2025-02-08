FROM rockylinux/rockylinux:9.5-ubi
# needed for rlm
RUN dnf -y install libxcrypt-compat \
    && dnf clean all
# /usr/borisfx/rlm needs to be owned by the rlm user so that a self-signed can be generated on first run
RUN groupadd -g 100001 rlm \
    && adduser -u 100001 -g 100001 -s /bin/bash rlm
USER rlm
WORKDIR /usr/borisfx/rlm
USER root
ADD genarts.set .
RUN curl https://reprisesoftware.com/wp-content/uploads/2024/v16-1/x64_l1.admin.tar.gz | tar --strip 1 --exclude demo.set -xzf -
USER rlm
CMD ["/usr/borisfx/rlm/rlm", "-c", "/licenses/", \
     "-dlog", "/logs/rlm-borisfx.log", \
     "-sslcert", "/certs/rlm-cert.pem", \
     "-sslpriv", "/certs/rlm-key.pem"]
EXPOSE 5053 5053/udp 5054 5153
VOLUME /licenses /certs /logs
