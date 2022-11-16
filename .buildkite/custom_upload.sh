set -eo pipefail

# Create yq alias in bootstrap

echo "+++ :hammer: Running Custom Pipeline Upload"

echo "original pipeline.yml"
docker run --rm -v "${PWD}":/workdir mikefarah/yq -C "." .buildkite/pipeline.yml
echo "override priority"
OVERRIDE_PRIORITY=-1
docker run --rm -v "${PWD}":/workdir mikefarah/yq -C "(.steps[] | select(has(\"command\"))).priority = $OVERRIDE_PRIORITY" .buildkite/pipeline.yml
echo "buildkite-agent pipeline upload dry-run"
buildkite-agent pipeline upload --dry-run
echo "buildkite-agent pipeline upload dry-run output to file"
buildkite-agent pipeline upload --dry-run > tmp/pipeline_output.json
echo "yq pipeline json to yaml"
docker run --rm -v "${PWD}":/workdir mikefarah/yq -P "." tmp/pipeline_output.json
#  | docker run --rm -v "${PWD}":/workdir mikefarah/yq -C "(.steps[] | select(has(\"command\"))).priority = $OVERRIDE_PRIORITY"


# buildkite-agent pipeline upload --dry-run | docker run --rm -v "${PWD}":/workdir mikefarah/yq -C "(.steps[] | select(has(\"command\"))).priority = $OVERRIDE_PRIORITY" | buildkite-agent pipeline upload

# docker run --rm -v "${PWD}":/workdir mikefarah/yq \
# '.steps[] *=n load("defaults.yaml").steps' \
# pipeline.yaml


# yq '.layouts | map(select(.layout == "gb"))'

# This appears to select every command step
# docker run --rm -v "${PWD}":/workdir mikefarah/yq -C '.steps | map(select(.command))' pipeline2.yml
# yq -C '.steps | map(select(.command))' pipeline2.yml
# yq -C '.steps[].priority = 1' pipeline2.yml
# This seems to add/update every command step to include priority = 1

