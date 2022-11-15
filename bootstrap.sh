#!/bin/bash

set -eox pipefail

# HOOK_TYPE="pre-bootstrap"
HOOK_TYPE="pre-checkout"

echo "Executing bootstrap script"

echo "Creating ${HOOK_TYPE} hook"
cat <<EOF >>/etc/buildkite-agent/hooks/${HOOK_TYPE}
#!/bin/bash
set -euxo pipefail
# Created on $(date)
echo "${HOOK_TYPE} hook executed successfully"
buildkite-agent annotate "${HOOK_TYPE} hook executed successfully 🚀"
EOF

echo "Changing permissions on ${HOOK_TYPE} hook"
sudo chmod +x /etc/buildkite-agent/hooks/pre-bootstrap

echo "bootstrap script executed successfully"
