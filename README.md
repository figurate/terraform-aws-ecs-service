# ![AWS](aws-logo.png) ECS Service

[![CI](https://github.com/figurate/terraform-aws-ecs-service/actions/workflows/main.yml/badge.svg)](https://github.com/figurate/terraform-aws-ecs-service/actions/workflows/main.yml)

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
| hosts | A list of request host headers used to route traffic to the service (required if load balancer is specified) | `list(string)` | `[]` | no |
| load\_balancer | Name of a load balancer used to route traffic to the service | `any` | `null` | no |
| load\_balancer\_arn | ARN of load balancer used to route traffic to the service | `any` | `null` | no |
| load\_balancer\_port | Port of load balancer used to route traffic to the service | `number` | `443` | no |
| name | Service name | `any` | n/a | yes |
| namespace\_id | Service Discovery namespace | `any` | `null` | no |
| paths | A list of request paths used to route traffic to the service | `list(string)` | `[]` | no |
| security\_groups | A list of security group ids applied to the service | `list` | `[]` | no |
| servicediscovery\_enabled | Create service discovery private zone for the cluster | `bool` | `false` | no |
| target\_container | Name of the target container for traffic from the specified load balancer | `any` | `null` | no |
| target\_port | Port of the target container for traffic from the specified load balancer | `number` | `80` | no |
| task\_definition | The family, family:revision or ARN of an ECS task definition | `any` | n/a | yes |
| vpc\_default | Use the default VPC for optional features (e.g. service discovery) | `bool` | `true` | no |
| vpc\_tags | Lookup tags to identify VPC for optional features (e.g. service discovery) | `map(any)` | `{}` | no |

## Outputs

No output.

