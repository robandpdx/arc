# arc
Below are some TLDR notes about installing Actions Runner Controller (ARC) in a k8s cluster. These commands all came from the [Quickstart for Actions Runner Controller](https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners-with-actions-runner-controller/quickstart-for-actions-runner-controller)  
## Install ARC
```
NAMESPACE="arc-systems"
helm install arc \
    --namespace "${NAMESPACE}" \
    --create-namespace \
    oci://ghcr.io/actions/actions-runner-controller-charts/gha-runner-scale-set-controller
```

## Install runner sets
```
INSTALLATION_NAME="runners-self-hosted"
NAMESPACE="arc-runners"
helm install -f values-admin-ops.yaml \
    "${INSTALLATION_NAME}" \
    --namespace "${NAMESPACE}" \
    --create-namespace \
    oci://ghcr.io/actions/actions-runner-controller-charts/gha-runner-scale-set
```

ghes-migration runners
```
INSTALLATION_NAME="runners-ghes-migration"
NAMESPACE="arc-runners"
helm install -f values-ghes-migration.yaml \
    "${INSTALLATION_NAME}" \
    --namespace "${NAMESPACE}" \
    --create-namespace \
    oci://ghcr.io/actions/actions-runner-controller-charts/gha-runner-scale-set
```

## Check it out
Use these commands the check the status of the installation.  
```
helm list -A
kubectl get pods -n arc-systems
kubectl get pods -n arc-runners
kubectl logs -n arc-systems arc-gha-runner-scale-set-controller-dfb85c57d-tc22x
```

## Uninstall runner sets
```
helm uninstall runners-self-hosted --namespace arc-runners
helm uninstall runners-ghes-migration --namespace arc-runners
```

## Uninstall ARC
```
helm uninstall arc --namespace arc-systems
```
