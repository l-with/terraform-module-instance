#!/bin/sh

set -e
eval "$(jq -r '@sh "
        CONTABO_REALM_URL=\(.contabo_realm_url)
        CONTABO_CLIENT_ID=\(.contabo_client_id)
        CONTABO_CLIENT_SECRET=\(.contabo_client_secret)
        CONTABO_USER=\(.contabo_user)
        CONTABO_PASS=\(.contabo_pass)
    "')"

CONTABO_TOKEN=$(curl --data "client_id=${CONTABO_CLIENT_ID}" --data "client_secret=${CONTABO_CLIENT_SECRET}" --data-urlencode "username=${CONTABO_USER}" --data-urlencode "password=${CONTABO_PASS}" --data 'grant_type=password' ${CONTABO_REALM_URL}/protocol/openid-connect/token | jq -r '.access_token')

jq --null-input --arg contabo_token "$CONTABO_TOKEN" '{"contabo_token":$contabo_token}'