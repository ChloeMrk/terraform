provider "github" {
    token = "*"
  
}

resource "github_repository" "mon_repo" {
    name = var.nom_repo
    description = "Crée via terraform"
    
}
