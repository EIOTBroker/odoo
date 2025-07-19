FROM odoo:17.0

USER root
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
      wget gnupg python3-dev libssl-dev libpq-dev gcc build-essential \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

USER odoo

# Force Odoo to read the external database
CMD ["odoo", "--db-filter=.*"]
