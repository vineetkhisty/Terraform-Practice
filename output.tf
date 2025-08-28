output "ec2_public_ip" {
  value = aws_instance.my_ec2.public_ip
}
output "ec2_instance_id" {
  value = aws_instance.my_ec2.id
}
output "ec2_instance_arn" {
  value = aws_instance.my_ec2.arn
}
output "ec2_instance_state" {
  value = aws_instance.my_ec2.instance_state
}

output "ec2_instance_public_dns" {
  value = aws_instance.my_ec2.public_dns
}
