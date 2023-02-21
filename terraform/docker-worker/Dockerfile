FROM hashicorp/terraform:1.2.9

ENV TF_HTTP_ADDRESS=xxx
ENV TF_HTTP_PASSWORD=xxx
ENV TF_HTTP_LOCK_ADDRESS=$TF_HTTP_ADDRESS
ENV TF_HTTP_UNLOCK_ADDRESS=$TF_HTTP_ADDRESS

ENV OC_VERSION "v3.11.0"
ENV OC_RELEASE "openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit"

RUN \
    apk add --no-cache \
        bash \
        jq \
        yq \
        make \
        python3 \
        py-pip \
        zip \
        sed \
        gawk \
        gpg \
        curl \
    && curl -sL https://iascable.cloudnativetoolkit.dev/install.sh | sh

ADD https://github.com/openshift/origin/releases/download/$OC_VERSION/$OC_RELEASE.tar.gz /opt/oc/release.tar.gz
RUN apk add --no-cache ca-certificates
RUN tar --strip-components=1 -xzvf  /opt/oc/release.tar.gz -C /opt/oc/ && \
    mv /opt/oc/oc /usr/bin/ && \
    rm -rf /opt/oc
