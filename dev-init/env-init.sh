#!/usr/bin/env bash

if [[ ! -d ${PROJECTS_ROOT}/env-tmp]]
then
  mkdir -p ${PROJECTS_ROOT}/env-tmp
fi

API_ROUTE=https://$(oc get route ${DEVWORKSPACE_ID}-${CONTAINER_NAME}-${TARGET_PORT}-${ENDPOINT_NAME} -o jsonpath={.spec.host})