#!/usr/bin/env bash

echo "Wait for env config"
while [[ ! -f ${PROJECTS_ROOT}/env-tmp/set-env.sh ]]
do
  printf '.'
  sleep 2
done
. ${PROJECTS_ROOT}/env-tmp/set-env.sh

echo "Waiting for KeyCloak to start"
while ! ${KCADM} config credentials --server http://localhost:8081 --realm master --user admin --password admin --config ${KCADM_CONFIG}
do
  printf '.'
  sleep 2
done

${KCADM} create realms -s realm=pelorus -s enabled=true -o --config ${KCADM_CONFIG} 
${KCADM} create users -r pelorus -s username=pelorus -s enabled=true --config ${KCADM_CONFIG} 
${KCADM} set-password -r pelorus --username pelorus --new-password pelorus --config ${KCADM_CONFIG} 
${KCADM} create clients -r pelorus -s clientId=pelorus-client -s publicClient="true"  -s "redirectUris=[\"${APP_ROOT}/*\"]" -s enabled=true -s "rootUrl=${APP_ROOT}" -s "webOrigins=[\"+\"]" --config ${KCADM_CONFIG} 
${KCADM} create roles -r pelorus -s name=pelorus-metrics --config ${KCADM_CONFIG} 
${KCADM} add-roles --uusername pelorus --rolename pelorus-metrics -r pelorus --config ${KCADM_CONFIG} 
