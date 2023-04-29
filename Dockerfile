FROM ruby:3.0.4 as base

USER root

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    # Required by the "image_processing" gem to work:
    libvips \
    libpq5 \
    openssl \
    git \
    tzdata \
 && rm -rf /var/lib/apt/lists/*

FROM base as development

USER root

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    # Required by the "image_processing" gem to work:
    libvips \
    libpq5

WORKDIR /workspaces/delete-app

COPY Gemfile .
COPY Gemfile.lock .

RUN bundle install

FROM development as release

USER root

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    # Required by the "image_processing" gem to work:
    libvips \
    libpq5

WORKDIR /workspaces/delete-app

COPY . .

RUN bundle install

EXPOSE 3000

CMD ['puma']
