#!/bin/sh

set -eo pipefail

cat <<EOF >>/etc/buildkite-agent/hooks/pre-bootstrap
#!/bin/sh
set -eo pipefail
# Created on $(date # : <<-- this will be evaluated before cat;)
echo "\$HOME will not be evaluated because it is backslash-escaped"
echo "This is a pre-bootstrap hook"
EOF
