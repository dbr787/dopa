# DOPA Pipeline

## Summary
- Create an Elastic CI Stack with a 'policy' agent queue.
  - The bootstrap script should include pulling the OPA docker image (and running an OPA server?).
- All pipelines should include an initial step similar to below...
```sh
steps:
  - label: ":mag: policy evaluation"
    key: "policy-eval"
    command: "policy/eval.sh"
    agents:
      queue: "policy"
  - wait
  - label: ":large_green_circle:"
    key: "user-defined"
    command: "buildkite-agent pipeline upload"
```

## License

See [License.md](License.md) (MIT)

