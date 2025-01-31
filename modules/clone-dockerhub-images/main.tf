locals {
  aws_account_id = data.aws_caller_identity.current.account_id
  aws_region     = data.aws_region.current.name
  images         = join(" ", var.images)
}

resource "null_resource" "clone_dockerhub_images" {
  provisioner "local-exec" {
    command = "${path.module}/clone-images.sh ${local.images}"

    environment = {
      AWS_ACCOUNT_ID = local.aws_account_id
      AWS_REGION     = local.aws_region
      PLATFORM       = var.platform
    }
  }
}
