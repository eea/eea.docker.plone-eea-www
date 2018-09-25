#!/bin/bash

set -e

buildDeps="
  build-essential
  libldap2-dev
  libsasl2-dev
"

echo "========================================================================="
echo "Installing $buildDeps"
echo "========================================================================="

apt-get update
apt-get install -y --no-install-recommends $buildDeps

echo "========================================================================="
echo "Running buildout -c buildout.cfg"
echo "========================================================================="

buildout -c buildout.cfg

echo "========================================================================="
echo "Unininstalling $buildDeps"
echo "========================================================================="

apt-get purge -y --auto-remove $buildDeps

echo "========================================================================="
echo "Cleaning up Plone cache..."
echo "========================================================================="

rm -vrf /plone/buildout-cache/downloads/*

echo "========================================================================="
echo "Fixing permissions..."
echo "========================================================================="

mkdir -p /data/www-static-resources
chown -R plone:plone /plone /data
