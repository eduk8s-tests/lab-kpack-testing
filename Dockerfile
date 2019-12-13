FROM quay.io/eduk8s/workshop-dashboard:develop

COPY --chown=1001:0 workshop /opt/app-root/workshop

COPY --chown=1001:0 init.d/ /opt/app-root/etc/init.d/

COPY --chown=1001:0 exercises/ /opt/app-root/workshop/src/

RUN curl -sL -o /tmp/logs-linux.tgz https://github.com/pivotal/kpack/releases/download/v0.0.5/logs-v0.0.5-linux.tgz && \
    tar -C /opt/app-root/bin -xf /tmp/logs-linux.tgz && \
    rm -rf /tmp/logs-linux.tgz && \
    fix-permissions /opt/app-root
