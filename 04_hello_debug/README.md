# Documentation Terraform

## Source Utile
- [Article sur les Variables Input et Output dans Terraform](https://devopssec.fr/article/variables-input-output-terraform)

## Création de Variables Terraform

Les variables dans Terraform sont des éléments essentiels pour rendre votre configuration flexible et réutilisable. Voici comment créer des variables Terraform :

1. **Définition des Variables** : Dans votre fichier Terraform, vous pouvez définir des variables en utilisant le bloc `variable`. Par exemple :

   ```hcl
   variable "nom_variable" {
     description = "Description de la variable"
     type        = string
     default     = "Valeur_par_défaut"
   }


"nom_variable" : C'est le nom de la variable que vous souhaitez utiliser.
description : Une brève description de la variable.
type : Le type de données de la variable (par exemple, string, number, list, map, etc.).
default : Une valeur par défaut optionnelle pour la variable.

2. **Utilisation des Variables** 

Pour les utiliser il faut indiquer:
var.lenomdelavariable

