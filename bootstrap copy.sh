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

# for line in "$(grep "^BUILDKITE_REPO=" "${BUILDKITE_ENV_FILE}")"
# do
#   repo="$(echo "${line}" | cut -d= -f2)"
#   if [ "${repo}" != "git@server:repo.git" ]
#   then
#     echo "Repository not allowed: ${repo}"
#     exit 1
#   fi
# done

# for line in "$(grep "^BUILDKITE_COMMAND=" "${BUILDKITE_ENV_FILE}")"
# do
#   command="$(echo "${line}" | cut -d= -f2)"
#   if [ "${command}" != "some-script.sh" ]
#   then
#     echo "Command not allowed: ${command}"
#     exit 1
#   fi
# done

echo "${HOOK_TYPE} hook executed successfully"
buildkite-agent annotate "${HOOK_TYPE} hook executed successfully 🚀"
EOF

echo "Changing permissions on pre-bootstrap hook"

sudo chmod +x /etc/buildkite-agent/hooks/pre-bootstrap

echo "bootstrap script executed successfully"
