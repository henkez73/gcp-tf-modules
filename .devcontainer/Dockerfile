FROM eu.gcr.io/cts-public-images-1/cts-base

# Software versions
ENV TERRAFORM_VERSION=1.0.4
# ENV TERRAGRUNT_VERSION=0.36.1
ENV TERRAFORM_DOCS_VERSION=0.16.0
ENV SHELLCHECK_VERSION=0.8.0
# ENV MUKLUK_VERSION=3.0.8
# ENV CREATE_TOKEN_VERSION=0.1.2

# Install additional OS packages
RUN apt update && export DEBIAN_FRONTEND=noninteractive && \
  apt upgrade -y && \
  apt -y install --no-install-recommends \
  build-essential \
  jq \
  vim \
  xz-utils \
  && apt clean -y && rm -rf /var/lib/apt/lists/*

# Install terraform
RUN curl -SOL https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_$(dpkg --print-architecture).zip && \
  unzip terraform_${TERRAFORM_VERSION}_linux_$(dpkg --print-architecture).zip -d /bin && \
  rm -f terraform_${TERRAFORM_VERSION}_linux_$(dpkg --print-architecture).zip

# Install terragrunt
#ENV TERRAGRUNT_TFPATH=/bin/terraform
#RUN curl -SL https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_$(dpkg --print-architecture) \
#  -o /bin/terragrunt && chmod +x /bin/terragrunt

# Install create-token
#RUN gsutil cp gs://cts-public-images-1-artifacts/create-token/create-token-linux-v${CREATE_TOKEN_VERSION}-$(dpkg --print-architecture).zip . && \
#  unzip create-token-linux-v${CREATE_TOKEN_VERSION}-$(dpkg --print-architecture).zip -d /bin && \
#  chmod +x /bin/create-token && \
#  rm -f create-token-linux-v${CREATE_TOKEN_VERSION}-$(dpkg --print-architecture).zip

# Install mukluk
#RUN gsutil cp gs://cts-public-images-1-artifacts/mukluk/mukluk-linux-v${MUKLUK_VERSION}-$(dpkg --print-architecture).zip . && \
#  unzip mukluk-linux-v${MUKLUK_VERSION}-$(dpkg --print-architecture).zip -d /bin && \
#  chmod +x /bin/mukluk && \
#  rm -f mukluk-linux-v${MUKLUK_VERSION}-$(dpkg --print-architecture).zip

# Install terraform-docs
RUN curl -SOL https://github.com/terraform-docs/terraform-docs/releases/download/v${TERRAFORM_DOCS_VERSION}/terraform-docs-v${TERRAFORM_DOCS_VERSION}-$(uname)-$(dpkg --print-architecture).tar.gz && \
  tar xzf terraform-docs-v${TERRAFORM_DOCS_VERSION}-$(uname)-$(dpkg --print-architecture).tar.gz -C /bin && \
  rm -f terraform-docs-v${TERRAFORM_DOCS_VERSION}-$(uname)-$(dpkg --print-architecture).tar.gz

# Install shellcheck
RUN curl -SOL https://github.com/koalaman/shellcheck/releases/download/v${SHELLCHECK_VERSION}/shellcheck-v${SHELLCHECK_VERSION}.linux.$(uname -m).tar.xz && \
  tar xJf shellcheck-v${SHELLCHECK_VERSION}.linux.$(uname -m).tar.xz && \
  mv shellcheck-v${SHELLCHECK_VERSION}/shellcheck /bin && \
  rm -rf shellcheck-v${SHELLCHECK_VERSION}.linux.$(uname -m)*
