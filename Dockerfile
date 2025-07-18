FROM odoo:17.0

# Install system dependencies needed for python-ldap
USER root
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    libldap2-dev \
    libsasl2-dev \
    libssl-dev \
    libpq-dev \
    && apt-get clean

USER odoo
