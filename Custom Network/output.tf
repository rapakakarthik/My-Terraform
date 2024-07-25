output "instance_ip_addr" {
  value = aws_instance.main.public_ip
  #sensitive = true
}

output "instance_id" {
  value = aws_instance.dev.id
}
output "instance_public_dns" {
  value = aws_instance.dev.public_dns

}
output "instance_arn" {
  value = aws_instance.dev.arn

}

*************************************************************************************************************************

### Using `terraform output` Commands

**Show All Outputs:**

- To display all defined output variables after applying the configuration, use:

`terraform output`

**Show a Specific Output:**

- To display the value of a specific output variable, use:

`terraform output <output_name>`

For example, to display the instance_public_ip:

`terraform output instance_public_ip`
