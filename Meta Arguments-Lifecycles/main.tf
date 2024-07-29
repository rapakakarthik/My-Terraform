provider "aws" {
    region = "us-east-2"   #region is OHIO 
}

resource "aws_instance" "ohio" {
    ami = "ami-00db8dadb36c9815e"
    instance_type = "t2.micro"
    subnet_id = "subnet-03f0db8201c261c8d"
    key_name = "state"
    tags = {
      Name = "state_ec2"
    }

# lifecycle {
#   create_before_destroy = true  #if any changes or modifications are done in resources the after applying command Apply first the resources will create then only after old existing resources will be deleted buffer tie will be less
# }

# lifecycle {
#   prevent_destroy = true   # if we use this command if we run terraform destroy command the resources will not be destroy until you disible this prevent destroy lifecycle is false 
# }

# lifecycle {
#   ignore_changes = [ tags, ]  # if we have done any changes -changes or modifications done in console way manually in remote based upon terraform code it will ignore according to lifecycle ignore it may be tags,subnetids
# }
}


