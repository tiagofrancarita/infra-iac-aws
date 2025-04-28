variable "project_name" {
  description = "Nome do projeto"
  type        = string
}

variable "environment" {
  description = "Ambiente do projeto (dev, homolog, produção)"
  type        = string
}

variable "repository_url" {
  description = "URL do repositório do projeto"
  type        = string
}