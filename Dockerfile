FROM eeacms/kgs:18.6.7
ENV portal_url=https://www.eea.europa.eu \
    AOA_MAP_TILES=http://aoa.ew.eea.europa.eu/maptiles/ \
    AOA_PORTAL_URL=http://aoa.ew.eea.europa.eu/ \
    PROD_SENTRY_DSN=https://3b9ff0f1b40b474495d7831c70589851@sentry.eea.europa.eu/2 \
    STAGING_SENTRY_DSN=https://ac369e68da1340039381c1746bf749fc@sentry.eea.europa.eu/3 \
    DEVEL_SENTRY_DSN=https://cad825e4b10341b6a6b76a6dd851a750@sentry.eea.europa.eu/4 \
    EEALOGINAGENT_LOG=/data/eea.controlpanel \
    EEACPBINSTANCESAGENT_LOG=/data/eea.controlpanel \
    RABBITMQ_HOST=rabbitmq \
    RABBITMQ_PORT=5672 \
    RABBITMQ_USER=guest \
    RABBITMQ_PASS=guest \
    saved_resources=/data/www-static-resources \
    zope_i18n_compile_mo_files=true \
    WARMUP_BIN=/plone/instance/bin/warmup \
    WARMUP_INI=/plone/instance/warmup.ini \
    WARMUP_HEALTH_THRESHOLD=50000 \
    EDW_LOGGER_PUBLISHER=false \
    RELSTORAGE_KEEP_HISTORY=false

COPY src/plone/* /plone/instance/
COPY src/docker/* /
RUN /docker-setup.sh
