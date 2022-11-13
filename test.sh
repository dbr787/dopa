cat <<- YAML
steps:
    - block: "Approve"
    prompt: "Fill out the details for release"
    fields:
        - text: "Release Name"
        key: "release-name"
YAML