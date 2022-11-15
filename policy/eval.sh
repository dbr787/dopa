set -eo pipefail

echo "--- :package: Cloning Policy Repository"
# git clone https://github.com/dbr787/dopa.git

echo "--- :package: Pulling OPA Image"

OPA_IMAGE_NAME=${BUILDKITE_OPA_IMAGE_NAME:-"openpolicyagent/opa"}
OPA_IMAGE_VERSION=${BUILDKITE_OPA_IMAGE_VERSION:-"latest"}
OPA_IMAGE="${OPA_IMAGE_NAME}:${OPA_IMAGE_VERSION}"

docker pull $OPA_IMAGE --quiet

echo "--- :package: Starting OPA Server"


echo "--- :package: Evaluating Policies"
