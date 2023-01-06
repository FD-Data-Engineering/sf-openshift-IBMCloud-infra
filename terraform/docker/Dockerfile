FROM hashicorp/terraform:1.2.9

ENV TF_HTTP_ADDRESS=https://eu-de.functions.cloud.ibm.com/api/v1/web/157a9653-dc21-4028-a2f1-9d24102609c0/dev-sf-tf-backend-package/backend?env=dev&versioning=true
ENV TF_HTTP_PASSWORD=D4kq13GZo8gZjaiitV7vpiZg4yS5eB_7jqErX4AMEmsV
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
