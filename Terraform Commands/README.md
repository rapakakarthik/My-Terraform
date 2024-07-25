
### ***************************************************************************************************************
**Terraform Commands**

	• aws configure
	• aws configure list
	• terraform version
	
### Initialization
	• terraform init===>Initializes a new or existing Terraform configuration by downloading necessary providers and setting up the backend.
	
### Planning and Applying Changes
	• terraform plan  ===>Creates an execution plan, showing what actions Terraform will take to achieve the desired state. It doesn't make any changes.
	• terraform apply===>Applies the changes required to reach the desired state of the configuration. It asks for confirmation before making changes unless -auto-approve is used.
	• terraform apply -auto-approve
	
### Destroying Infrastructure
	• terraform destroy    ===>Destroys all the infrastructure managed by the Terraform configuration. It asks for confirmation before making changes unless -auto-approve is used.
	• terraform destroy -auto-approve
	
### Validation and Formatting
	• terraform fmt        ===>Formats the configuration files according to the Terraform style conventions.
	• terraform validate===>Validates the configuration files for syntax and internal consistency.
	
### Output
	• terraform output:           ===>Displays the outputs defined in the configuration.
	• terraform output -json: ===>Displays the outputs in JSON format.
	• terraform output <name of out ip name>
	
### Resource Management
	• terraform import <ADDRESS> <ID>:===>Imports an existing resource into Terraform management.
	• ex:==> terraform import aws_instance.example   i-1234567890abcdef0

### **************************************************************************************************************
