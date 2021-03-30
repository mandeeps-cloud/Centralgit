provider "aws" {                      # Cloud Provider::-> AWS
  region     = "ap-south-1"           # Region where resource will be deployed.
  access_key = "" # IAM Access Key of the User.
  secret_key = "" # IAM Secret Key of the User.
}

# Create an AMI that will start a machine whose root device is backed by
# an EBS volume populated from a snapshot. It is assumed that such a snapshot
# already exists with the id "snap-xxxxxxxx".
resource "aws_ami" "example" {
  name                = "terraform-example"
  virtualization_type = "hvm"
  root_device_name    = "/dev/xvda"

  ebs_block_device {
    device_name = "/dev/xvda"
    snapshot_id = "snap-055d4ae62f7361b53" # Copy Snapshot ID from snapshot tab.
    volume_size = 8
  }
}

#resource "aws_ami_copy" "example" {
#  name              = "terraform-example-copy"
#  description       = "A copy of ami-xxxxxxxx"
#  source_ami_id     = "ami-03244f314f4ce61ac"
#  source_ami_region = "ap-south-1a"

#  tags = {
#    Name = "HelloWorld"
#  }
#}
