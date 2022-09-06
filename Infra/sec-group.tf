resource "aws_security_group" "Jenkins_SG" {
  name        = "Myproject-Jenkins-SG"
  description = "Myproject-Jenkins-SG"
  vpc_id      = aws_vpc.myproject.id

  ingress {
    description = "Allow SSH from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.MYIP]
  }
  ingress {
    description = " Connect Jenkins Server Port 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.MYIP]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Jenkins-SG"
  }
}
resource "aws_security_group" "Kops_SG" {
  name        = "Myproject-Kops-SG"
  description = "Myproject-Kops-SG"
  vpc_id      = aws_vpc.myproject.id

  ingress {
    description = "Allow SSH from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.MYIP]
  }
  ingress {
    description     = "Allow Jenkins server SSH"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.Jenkins_SG.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Kops-SG"
  }
}
resource "aws_security_group" "Sonar_SG" {
  name        = "Myproject-Sonar-Server-SG"
  description = "Myproject-Sonar-Server-SG"
  vpc_id      = aws_vpc.myproject.id

  ingress {
    description = "Allow SSH from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.MYIP]
  }
  ingress {
    description     = "Allow Jenkins server connect"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.Jenkins_SG.id]
  }
  ingress {
    description     = "Allow MY IP conncer port 80"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks = [var.MYIP]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Sonarqube-SG"
  }
}