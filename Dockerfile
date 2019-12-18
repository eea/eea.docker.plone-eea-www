FROM eeacms/kgs:19.12.18
ENV portal_url=https://www.eea.europa.eu \
    AOA_MAP_TILES=http://aoa.ew.eea.europa.eu/maptiles/ \
    AOA_PORTAL_URL=http://aoa.ew.eea.europa.eu/ \
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
    EDW_LOGGER_ERRORS=false \
    RELSTORAGE_KEEP_HISTORY=false

COPY src/plone/* /plone/instance/
COPY src/docker/* /
RUN /docker-setup.sh
