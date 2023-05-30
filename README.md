# arc
## Install ARC
```
NAMESPACE="arc-systems"
helm install -f values-arc.yaml \
    arc \
    --namespace "${NAMESPACE}" \
    --create-namespace \
    oci://ghcr.io/actions/actions-runner-controller-charts/gha-runner-scale-set-controller
```

## Install runner sets
```
INSTALLATION_NAME="arc-runner-set"
NAMESPACE="arc-runners"
helm install -f values-admin-ops.yaml \
    "${INSTALLATION_NAME}" \
    --namespace "${NAMESPACE}" \
    --create-namespace \
    oci://ghcr.io/actions/actions-runner-controller-charts/gha-runner-scale-set
```

## Uninstall runner sets
```
helm uninstall arc-runner-set --namespace arc-runners
```

## Uninstall ARC
```
helm uninstall arc --namespace arc-systems
```
