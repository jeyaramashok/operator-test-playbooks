#!/usr/bin/env bash

# required input, set as env variables
quay_namespace=${QUAY_NAMESPACE:?}           # required
quay_token=${QUAY_TOKEN:?}                   # required
kube_config=${KUBECONFIG_MOUNT_DIR:?}        # required
operator_dir=${OPERATOR_MOUNT_DIR:?}         # required
image_pullsecret=${IMAGE_PULLSECRET_MOUNT_PATH:-}       # optional


ansible-playbook                              \
    -vv -i "localhost,"                       \
    --connection=local                        \
    -e run_catalog_init=true                  \
    -e image_pullsecret="${image_pullsecret}" \
    -e quay_token="${quay_token}"             \
    -e quay_namespace="${quay_namespace}"     \
    -e kubeconfig_path="${kube_config}/config"       \
    -e operator_dir="${operator_dir}"         \
    -e production_quay_namespace="certified-operators" \
    local-test-operator.yml
