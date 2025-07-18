FROM odoo:17.0

USER root
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
      wget \
      gnupg && \
    echo "deb http://apt.postgresql.org/pub/repos/apt jammy-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    apt-get update && \
    apt-get install -y \
      libpq-dev=17.5-1.pgdg22.04+1 \
      libpq5=17.5-1.pgdg22.04+1 \
      python3-dev \
      libssl-dev \
      gcc \
      build-essential \
      && apt-get clean && rm -rf /var/lib/apt/lists/*

USER odoo
