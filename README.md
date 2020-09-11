# ![AWS](aws-logo.png) ECS Service

Purpose: Blueprints for AWS ECS Service

![AWS ECS Cluster](aws\_ecs\_service.png)

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| apigateway\_enabled | Create an API Gateway endpoint for the cluster | `bool` | `false` | no |
| cluster | Cluster name | `any` | n/a | yes |
| code\_deploy\_enabled | Use CodeDeploy to manage service deployment | `bool` | `false` | no |
| name | Service name | `any` | n/a | yes |
| namespace\_id | Service Discovery namespace | `any` | `null` | no |
| security\_groups | A list of security group ids applied to the service | `list` | `[]` | no |
| servicediscovery\_enabled | Create service discovery private zone for the cluster | `bool` | `false` | no |
| target\_groups | A map of container name:port to publish to the specified target group | `map(any)` | `{}` | no |
| task\_definition | ARN of an ECS task definition | `any` | n/a | yes |
| vpc\_default | Use the default VPC for optional features (e.g. service discovery) | `bool` | `true` | no |
| vpc\_tags | Lookup tags to identify VPC for optional features (e.g. service discovery) | `map(any)` | `{}` | no |

## Outputs

No output.

