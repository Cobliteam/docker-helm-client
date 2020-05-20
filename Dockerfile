FROM alpine:3.9.6

ARG HELM_VERSION

ENV HELM_TGZ=helm-v${HELM_VERSION}-linux-amd64.tar.gz
ENV BASE_URL=https://get.helm.sh/

RUN wget ${BASE_URL}${HELM_TGZ} \
    && wget ${BASE_URL}${HELM_TGZ}.sha256sum \
    && sha256sum -c ./*.sha256sum \
    && tar -xzvf ${HELM_TGZ} \
    && mv linux-amd64/helm /usr/bin/helm \
    && chmod +x /usr/bin/helm \
    && rm -rf linux-amd64 \
    && rm ${HELM_TGZ} ${HELM_TGZ}.sha256sum

ENTRYPOINT ["helm"]
