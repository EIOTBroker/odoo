FROM odoo:17.0

USER root
ENV DEBIAN_FRONTEND=noninteractive

# Only install essentials for psycopg2 support and clean up caches
RUN apt-get update && \
    apt-get install -y \
      python3-dev \
      libssl-dev \
      libpq-dev \
      && apt-get clean && rm -rf /var/lib/apt/lists/*

USER odoo
