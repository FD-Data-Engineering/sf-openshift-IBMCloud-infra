FROM hashicorp/terraform:1.2.9

ENV TF_HTTP_ADDRESS=xxx
ENV TF_HTTP_PASSWORD=xxx
ENV TF_HTTP_LOCK_ADDRESS=$TF_HTTP_ADDRESS
ENV TF_HTTP_UNLOCK_ADDRESS=$TF_HTTP_ADDRESS

RUN \
    apk add --no-cache \
        bash \
        jq \
        yq \
        make \
        python3 \
        py-pip \
        zip \
        curl \
    && curl -sL https://iascable.cloudnativetoolkit.dev/install.sh | sh
