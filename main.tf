data "aws_key_pair" "jenkins-key" {
  key_name = "jenkins-key" # Replace with your key pair name
}
resource "aws_instance" "Jenkins" {
  ami                    = "ami-04b4f1a9cf54c11d0"
  instance_type          = "t2.micro"
  key_name               = data.aws_key_pair.jenkins-key.key_name # Reference the existing key pair
  vpc_security_group_ids = ["sg-009e7db7aaed1f565"]
  tags = {
    Name = "jenkins"
  }
  provisioner "file" {
    source      = "setup_jenkins.sh"
    destination = "/tmp/setup-jenkins.sh"

  }
  connection {
    type        = "ssh"
    user        = var.webuser
    private_key = file("jenkins-key.pem")
    host        = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/setup-jenkins.sh",
      "sudo /tmp/setup-jenkins.sh",
    ]
  }
}

output "jenkins_public_ip" {
  value = aws_instance.Jenkins.public_ip
}