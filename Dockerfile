FROM odoo:17.0

USER root

# Avoids interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install build tools and libraries required for python-ldap, psycopg2, etc.
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    libldap2-dev \
    libsasl2-dev \
    libssl-dev \
    libpq-dev \
    build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Switch back to odoo user (Render builds as root by default)
USER odoo
