FROM quay.io/eduk8s/workshop-dashboard:develop

COPY --chown=1001:0 . /opt/app-root/src/

RUN /opt/app-root/src/.workshop/build && \
    fix-permissions /opt/app-root
