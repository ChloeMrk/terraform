provider "github" {
    token = "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"
  
}

resource "github_repository" "mon_repo" {
    name = var.nom_repo
    description = "Crée via terraform"
    
}
