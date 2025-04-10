resource "aws_db_subnet_group" "this" {
  name       = "main-db-subnet-group"
  subnet_ids = var.db_subnet_ids

  tags = {
    Name = "main-db-subnet-group"
  }
}

resource "aws_security_group" "rds" {
  name        = "rds-sg"
  description = "SG for RDS"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"] # Ajuste de acordo com sua VPC
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-sg"
  }
}

resource "aws_db_instance" "this" {
  identifier             = "localiza-db"
  allocated_storage      = 20
  engine                 = var.engine
  instance_class         = var.instance_class
  name                   = var.db_name
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  skip_final_snapshot    = true

  tags = {
    Name = "localiza-db"
  }
}
