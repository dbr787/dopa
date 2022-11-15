resource "aws_cloudformation_stack" "buildkite_agent_stack" {
  name = "buildkite_agent_stack"

  parameters = {
    AgentsPerInstance     = "1"
    # BootstrapScriptUrl    = "s3://${aws_s3_bucket_object.agent_bootstrap.bucket}/${aws_s3_bucket_object.agent_bootstrap.key}"
    # BuildkiteAgentRelease = "edge"
    # BuildkiteAgentTags    = "isolated=true"

    # BuildkiteAgentTokenParameterStorePath = "/ops/terraform/BUILDKITE_TOKEN_DEPLOY_STACK"

    # BuildkiteQueue = "deploy"
    InstanceType   = "t3.small"

    # ManagedPolicyARN = join(",", [
    #   aws_iam_policy.read_secrets_production.arn,
    #   aws_iam_policy.deploy_to_ecs.arn,
    #   aws_iam_policy.manage_production_s3_buckets.arn,
    #   aws_iam_policy.manage_autoscaling_ec2s.arn,
    #   aws_iam_policy.agent_dependencies.arn,
    #   aws_iam_policy.manage_ecr_repositories.arn,
    # ])

    MinSize       = "0"
    MaxSize       = "1"
    # SecretsBucket = aws_s3_bucket.buildkite-production-agent-secrets.id

    # If deploy agent is idle for 48 hours, self-terminate it.
    # ScaleInIdlePeriod = 172800
  }
  capabilities = ["CAPABILITY_NAMED_IAM", "CAPABILITY_AUTO_EXPAND", "CAPABILITY_IAM"]
  template_url = "https://s3.amazonaws.com/buildkite-aws-stack/latest/aws-stack.yml"
#   tags = {
#     CostBucket = "ci-cd"
#   }
}

