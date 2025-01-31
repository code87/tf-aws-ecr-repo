# Clone DockerHub Images

Current version: `v0.0.4`

This Terraform module pulls images from Docker Hub and pushes them to AWS ECR Registry
in order to avoid `429 Too Many Requests` error caused by Docker Hub rate limit.


## Usage

```terraform
module "ruby" {
  source = "github.com/code87/tf-aws-containers//modules/ecr-repo?ref=v0.0.4"

  name   = "ruby"
}

module "postgres" {
  source = "github.com/code87/tf-aws-containers//modules/ecr-repo?ref=v0.0.4"

  name   = "postgres"
}

module "clone_images" {
  source = "github.com/code87/tf-aws-containers//modules/clone-dockerhub-images?ref=v0.0.4"

  images = ["ruby:2.7.5-buster", "postgres:13.8"]

  depends_on = [
    module.ruby,
    module.postgres
  ]
}
```

_See also_: [examples/clone-dockerhub-images/](https://github.com/code87/tf-aws-containers/blob/master/examples/clone-dockerhub-images/)


## Requirements

| Name        | Version           |
|-------------|-------------------|
| `terraform` | >= 1.3.0, < 2.0.0 |
| `aws`       | ~> 5.0            |
| `null`      | ~> 3.0            |


## Resources

| Name                     | Type            |
|--------------------------|-----------------|
| `clone_dockerhub_images` | `null_resource` |


## Inputs

* `images` (required, `list(string)`) - list of Docker Hub images with versions specified.<br/>
  Example: `["ruby:2.7.5-buster", "postgresql:13.2"]`

* `platform` (optional, `string`) - Docker image platform. Default: `linux/amd64`.


## Outputs

_This module has no outputs._
