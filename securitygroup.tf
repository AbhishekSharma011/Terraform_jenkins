data "aws_security_group" "jenkins-sg" {
  name = "jenkins-sg" # Name of the pre-existing security group
}

# Example usage of the existing security group ID
resource "aws_security_group_rule" "allow_ssh" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = var.my_ip


  security_group_id = data.aws_security_group.jenkins-sg.id
  
  lifecycle {
    ignore_changes = [cidr_blocks] # Ignore changes to CIDR block to avoid duplicates
  }
}

resource "aws_security_group_rule" "allow_http" {
  type        = "ingress"
  from_port   = 8080
  to_port     = 8080
  protocol    = "tcp"
  cidr_blocks = var.my_ip


  security_group_id = data.aws_security_group.jenkins-sg.id

  lifecycle {
    ignore_changes = [cidr_blocks] # Ignore changes to CIDR block to avoid duplicates
  }
}