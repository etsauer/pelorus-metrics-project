#!/usr/bin/env bash

set -x

OC=/projects/bin/oc

while [[ ! -f /home/user/.kube/config ]]
do
  printf '.'
  sleep 2
done

if [[ -f ${PROJECTS_ROOT}/env-tmp/set-env.sh ]]
then
  rm ${PROJECTS_ROOT}/env-tmp/set-env.sh
  touch ${PROJECTS_ROOT}/env-tmp/set-env.sh
else
  if [[ ! -d ${PROJECTS_ROOT}/env-tmp ]]
  then
    mkdir -p ${PROJECTS_ROOT}/env-tmp
  fi
  touch ${PROJECTS_ROOT}/env-tmp/set-env.sh
fi

APP_URL=https://$(${OC} --kubeconfig=/home/user/.kube/config get route ${DEVWORKSPACE_ID}-dev-tools-3000-pelorus-metrics -o jsonpath={.spec.host})
KEYCLOAK_URL=https://$(${OC} --kubeconfig=/home/user/.kube/config get route ${DEVWORKSPACE_ID}-keycloak-8081-keycloak -o jsonpath={.spec.host})

echo "export NEXTAUTH_URL=${APP_URL}" >> ${PROJECTS_ROOT}/env-tmp/set-env.sh
echo "export APP_ROOT=${APP_URL}" >> ${PROJECTS_ROOT}/env-tmp/set-env.sh
echo "export NEXTAUTH_SECRET=\"+03/pWr4sFvxrcm29hwnXLREWjFfmW2toTCUyNcLytc=\"" >> ${PROJECTS_ROOT}/env-tmp/set-env.sh
echo "export KEYCLOAK_ISSUER=${KEYCLOAK_URL}/realms/pelorus" >> ${PROJECTS_ROOT}/env-tmp/set-env.sh
echo "export KEYCLOAK_ID=pelorus-client" >> ${PROJECTS_ROOT}/env-tmp/set-env.sh
echo "export KEYCLOAK_SECRET=null" >> ${PROJECTS_ROOT}/env-tmp/set-env.sh
echo "export KCADM=/opt/keycloak/bin/kcadm.sh" >> ${PROJECTS_ROOT}/env-tmp/set-env.sh
echo "export KCADM_CONFIG=/tmp/kcadm.config" >> ${PROJECTS_ROOT}/env-tmp/set-env.sh
