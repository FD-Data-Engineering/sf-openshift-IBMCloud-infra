FROM hashicorp/terraform:1.2.9

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
