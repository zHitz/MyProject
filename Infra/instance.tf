resource "aws_key_pair" "myproject-key" {
  key_name   = "myproject-key"
  public_key = file(var.PUB_KEY)

}
resource "aws_instance" "Jenkins" {
  instance_type          = "t2.small"
  ami                    = var.UBUNTU20
  key_name               = aws_key_pair.myproject-key.key_name
  vpc_security_group_ids = [aws_security_group.Jenkins_SG.id]
  subnet_id = aws_subnet.myproject-pub-1.id
  tags = {
    "Name" = "Jenkins-Server"
  }
  provisioner "file" {
    source      = "jenkins-setup.sh"
    destination = "/tmp/jenkins-setup.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/jenkins-setup.sh",
      "sudo /tmp/jenkins-setup.sh"
    ]

  }
  connection {
    user        = var.USER
    private_key = file("myproject-key")
    host        = self.public_ip
  }  
}
resource "aws_instance" "Kops" {
  instance_type          = "t2.micro"
  ami                    = var.UBUNTU20
  key_name               = aws_key_pair.myproject-key.key_name
  vpc_security_group_ids = [aws_security_group.Kops_SG.id]
  subnet_id = aws_subnet.myproject-pub-1.id
  tags = {
    "Name" = "KOPS"
  }
}
resource "aws_instance" "Sonar" {
  instance_type          = "t2.medium"
  ami                    = var.UBUNTU20
  key_name               = aws_key_pair.myproject-key.key_name
  vpc_security_group_ids = [aws_security_group.Sonar_SG.id]
  subnet_id = aws_subnet.myproject-pub-1.id
  tags = {
    "Name" = "SonarQube-Server"
  }
  provisioner "file" {
    source      = "sonarqube-setup.sh"
    destination = "/tmp/sonarqube-setup.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/sonarqube-setup.sh",
      "sudo /tmp/sonarqube-setup.sh"
    ]

  }
  connection {
    user        = var.USER
    private_key = file("myproject-key")
    host        = self.public_ip
  }    
}


output "PublicIP-Jenkins-Server" {
  value = aws_instance.Jenkins.public_ip
}
output "PublicIP-Kops" {
  value = aws_instance.Kops.public_ip
}
output "PublicIP-SonarQube-Server" {
  value = aws_instance.Sonar.public_ip
}