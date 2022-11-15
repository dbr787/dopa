#!/bin/sh

set -eo pipefail

echo "Executing bootstrap script"

echo "Creating pre-bootstrap hook"

cat <<EOF >>/etc/buildkite-agent/hooks/pre-bootstrap
#!/bin/sh
set -eo pipefail
# Created on $(date)
echo "pre-bootstrap hook executed successfully"
buildkite-agent annotate "pre-bootstrap hook executed successfully 🚀"
EOF

echo "Changing permissions on pre-bootstrap hook"

sudo chmod +x /etc/buildkite-agent/hooks/pre-bootstrap

echo "bootstrap script executed successfully"
