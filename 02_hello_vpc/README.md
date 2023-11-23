# Source
- [Ressource VPC Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc.html)
- [Ressource Subnet Terraform](https://registry.terraform.io/providers/hashicorp/aws/2.69.0/docs/resources/subnet)

# Récupérer id d'une ressources

Pour récupérer un id d'une ressource terraform il faut d'abord spécifier la ressource puis le nom de cette ressource.id. 
Exemple :
```
vpc_id = aws_vpc.vpc-test.id
```
