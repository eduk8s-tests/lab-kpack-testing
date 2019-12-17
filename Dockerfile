FROM quay.io/eduk8s/workshop-dashboard:develop

COPY --chown=1001:0 . /home/eduk8s/

RUN curl -sL -o /tmp/logs-linux.tgz https://github.com/pivotal/kpack/releases/download/v0.0.5/logs-v0.0.5-linux.tgz && \
    mkdir -p /home/eduk8s/bin && \
    tar -C /home/eduk8s/bin -xf /tmp/logs-linux.tgz && \
    rm -rf /tmp/logs-linux.tgz && \
    fix-permissions /home/eduk8s
