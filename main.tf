# Instância EC2
resource "aws_instance" "instance_Ec2" {
  ami           = "ami-084568db4383264d4"  # Substitua pela AMI para sua região (Ubuntu 24.04 LTS)
  instance_type = "t2.micro"  # Tipo de instância elegível para Free Tier
  key_name      = null  # Se não precisar de acesso SSH, pode remover ou deixar como null

  tags = {
    Name        = "${var.project_name}-instance"  # Nome dinâmico com base na variável `project_name`
    Environment = var.environment
    Repository  = var.repository_url
  }

  lifecycle {
    ignore_changes = [ami]
  }
}

# Banco de Dados RDS
resource "aws_db_instance" "instance_rds" {
  identifier        = "${var.project_name}-${var.environment}-db"
  engine            = "mysql"
  instance_class    = "db.t2.micro"  # Tipo de instância no Free Tier
  allocated_storage = 20  # 20 GB de armazenamento (limite do Free Tier)
  username          = "admin"
  password          = "password123"  # Substitua por uma senha mais segura
  db_name           = "${var.project_name}_${var.environment}"

  tags = {
    Name        = "${var.project_name}-db"  # Nome dinâmico com base na variável `project_name`
    Environment = var.environment
    Repository  = var.repository_url
  }

  lifecycle {
    ignore_changes = [engine_version]
  }
}