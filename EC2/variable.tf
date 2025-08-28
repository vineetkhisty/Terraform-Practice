variable "ec2_instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
  
}

variable "ec2_ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0c02fb55956c7d316" #Amazon Linux 2 AMI (HVM), SSD Volume Type - us-east-1
  
}

variable "ec2_storage_size" {
  description = "Size of the EBS volume in GB"
  type        = number
  default     = 8
  
}

variable "ec2_volume_type" {
  description = "Type of EBS volume"
  type        = string
  default     = "gp2"
  
}