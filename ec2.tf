#Create a key pair
resource "aws_key_pair" "ec2_key" {
  key_name   = "ec2_key"
  public_key = file("C:/Users/vineet.k/.ssh/id_rsa.pub")
}