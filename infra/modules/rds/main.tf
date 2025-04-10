resource "aws_db_subnet_group" "this" {
  name       = "rds-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "rds-subnet-group"
  }
}

resource "aws_db_instance" "this" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  name                 = var.db_name
  username             = var.db_user
  password             = var.db_password
  port                 = 3306

  db_subnet_group_name    = aws_db_subnet_group.this.name
  vpc_security_group_ids  = [var.sg_id]
  skip_final_snapshot     = true
  publicly_accessible     = false
  multi_az                = false
  deletion_protection     = false
}
