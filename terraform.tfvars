ami-id = "ami-0a1b648e2cd533174"

type = "t2.micro"

vpc-cidr-block = "10.168.0.0/22"

subnet-1 = "10.168.2.0/23"

range = "0.0.0.0/0"

rules-sg = {
 ssh = {
    type        = "ingress"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

    HTTP = {
    type        = "ingress"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

    HTTPS = {
      type        = "ingress"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    CustomTCP = {
    type        = "ingress"
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

}

outbound = {
  "all_egress" = {
      type = "egress"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  

}



user = "ubuntu"

file-path = "D:/IT Videos/Practice/Terraform_Scripts/project_3/python.py"

destination-path = "/home/ubuntu/python.py"