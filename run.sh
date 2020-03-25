ansible-playbook            \
    -vv -i "localhost,"     \
    --connection=local      \
    -e run_catalog_init=true     \
    -e image_pull_secret="/home/jey/workspace/src/github.com/redhat-operator-ecosystem/operator-test-playbooks/pullsecret.yaml" \
    -e quay_token=${QUAY_TOKEN}     \
    -e quay_namespace=${QUAY_NAMESPACE}            \
    -e kubeconfig_path=~/.kube/config         \
    -e operator_dir="~/pingpong-operator"     \
    -e production_quay_namespace="certified-operators" \
    -e ansible_python_interpreter="/home/jey/workspace/src/github.com/redhat-operator-ecosystem/operator-test-playbooks/venv/bin/python" \
    local-test-operator.yml  \
    | tee run-$(date "+%Y-%m-%d_%H%M%S").log
