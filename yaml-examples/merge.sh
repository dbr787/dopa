


OVERRIDE_PRIORITY=-1
yq -C "(.steps[] | select(has(\"command\"))).priority = $OVERRIDE_PRIORITY" pipeline2.yml
# buildkite-agent pipeline upload --dry-run | yq -C "(.steps[] | select(has(\"command\"))).priority = $OVERRIDE_PRIORITY" pipeline2.yml | buildkite-agent pipeline upload


# docker run --rm -v "${PWD}":/workdir mikefarah/yq \
# '.steps[] *=n load("defaults.yaml").steps' \
# pipeline.yaml


# yq '.layouts | map(select(.layout == "gb"))'

# This appears to select every command step
# docker run --rm -v "${PWD}":/workdir mikefarah/yq -C '.steps | map(select(.command))' pipeline2.yml
# yq -C '.steps | map(select(.command))' pipeline2.yml
# yq -C '.steps[].priority = 1' pipeline2.yml
# This seems to add/update every command step to include priority = 1

