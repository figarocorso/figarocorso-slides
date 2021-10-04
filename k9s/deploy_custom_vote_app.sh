#!/bin/bash

APP_MANIFESTS_TEMPLATE=example-voting-app.yaml.tpl
APP_MANIFESTS=example-voting-app.yaml

RANDOM_NUMBER=$(( 30000 + $RANDOM % 2766 ))

NAMESPACE=vote${RANDOM_NUMBER}
echo "Namespace: ${NAMESPACE}"
RESULT_SERVICE_PORT=${RANDOM_NUMBER}
echo "Results URL http://<IP>:${RESULT_SERVICE_PORT}"
VOTE_SERVICE_PORT=$(( $RANDOM_NUMBER + 1 ))
echo "Results URL http://<IP>:${VOTE_SERVICE_PORT}"
echo ""

export NAMESPACE
export RESULT_SERVICE_PORT
export VOTE_SERVICE_PORT
envsubst < ${APP_MANIFESTS_TEMPLATE} > ${APP_MANIFESTS}
kubectl apply -f ${APP_MANIFESTS}
