#!/bin/bash

. setenv.sh

helm uninstall runners-self-hosted --namespace arc-runners
helm uninstall runners-ghes-migration --namespace arc-runners

sleep 45

INSTALLATION_NAME="runners-self-hosted"
NAMESPACE="arc-runners"
helm install -f values-admin-ops.yaml \
    "${INSTALLATION_NAME}" \
    --namespace "${NAMESPACE}" \
    --create-namespace \
    oci://ghcr.io/actions/actions-runner-controller-charts/gha-runner-scale-set

sleep 10

INSTALLATION_NAME="runners-ghes-migration"
NAMESPACE="arc-runners"
helm install -f values-ghes-migration.yaml \
    "${INSTALLATION_NAME}" \
    --namespace "${NAMESPACE}" \
    --create-namespace \
    oci://ghcr.io/actions/actions-runner-controller-charts/gha-runner-scale-set