#!/bin/bash

echo "Fixing permissions for WWW external /data volumes"
mkdir -vp /data/www-static-resources
chown -v plone:plone /data/www-static-resources

exec /kgs-entrypoint.sh "$@"
