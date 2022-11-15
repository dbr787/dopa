#!/bin/sh

set -eo pipefail

echo "Executing bootstrap script"

cat <<EOF >>/etc/buildkite-agent/hooks/pre-bootstrap
#!/bin/sh
set -eo pipefail
# Created on $(date)
echo "This is a pre-bootstrap hook"
EOF
