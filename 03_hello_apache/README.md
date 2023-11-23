# Documentation Terraform

## Source Utile
- [Documentation de la ressource Security Group dans Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)

## Debug

Lors de la création de ma machine avec Terraform, je rencontrais un problème : rien ne s'affichait. Voici comment j'ai résolu ce problème :

1. **Ajout du Port SSH** : J'ai ajouté une règle pour le port SSH (port 22) dans le groupe de sécurité AWS. Cela m'a permis de me connecter en SSH à l'instance pour déboguer davantage.

2. **Vérification du Script** : En me connectant à l'instance, j'ai vérifié le script `user_data` que j'avais spécifié. J'ai réalisé que j'avais oublié un tiret dans le script, ce qui empêchait son exécution correcte.

Après avoir corrigé ces problèmes, tout s'est déroulé comme prévu.

![Alt text](image.png)


