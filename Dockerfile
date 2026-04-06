FROM debian:bookworm-slim

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    gnupg2 \
    ca-certificates

# Import GPG key for volkszaehler repository
COPY gpg.21DBDAC56DF44DA1.key /tmp/volkszaehler.asc
RUN gpg --dearmor < /tmp/volkszaehler.asc > /usr/share/keyrings/volkszaehler-archive-keyring.gpg && \
    rm /tmp/volkszaehler.asc

COPY volkszaehler.list /etc/apt/sources.list.d/volkszaehler.list

RUN apt-get update && apt-get install -y --no-install-recommends \
    vzlogger=0.8.9 \
    && rm -rf /var/lib/apt/lists/*

# Create non-root user
RUN useradd -m -s /sbin/nologin vzlogger


# Run as non-root user
USER vzlogger

# Entrypoint
ENTRYPOINT ["vzlogger", "-c", "/etc/vzlogger.conf"]
