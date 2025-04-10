module "rds" {
  source = "./modules/rds"

  private_subnet_ids = [aws_subnet.db_subnet1.id, aws_subnet.db_subnet2.id]
  sg_id              = aws_security_group.db_sg.id
  db_password        = var.db_password
}
