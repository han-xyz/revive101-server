# Wraps the image `docker compose --profile mirror build aurorium` makes, for Fly.io. Deploy with --local-only so this FROM resolves locally.
FROM revive101-server-aurorium:latest
USER root
COPY entrypoint.sh /fly-entrypoint.sh
RUN chmod 755 /fly-entrypoint.sh
ENTRYPOINT ["/fly-entrypoint.sh"]
