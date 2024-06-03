#!/bin/bash

if ! helm repo list | grep grafana; then
    helm repo add grafana https://grafana.github.io/helm-charts
fi
helm repo update
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
helm upgrade \
    -n observability \
    --install \
    -f "${SCRIPT_DIR}/loki-values.yaml" \
    loki \
    grafana/loki
