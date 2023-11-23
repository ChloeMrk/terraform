# Introduction à Terraform

Je connaissais déjà Terraform de nom car quand j'ai commencé dans mon entreprise on voulait commencer à automatiser la création sur AWS et on hésitait entre Terraform et Cloudformation.

## Sources Utiles
- [Installer Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- [Installer AWS CLI](https://docs.aws.amazon.com/fr_fr/cli/latest/userguide/getting-started-install.html)
- [Guide Terraform pour la première infrastructure AWS](https://devopssec.fr/article/premiere-infrastructure-aws-terraform)

## Installation de Terraform
Vous pouvez installer Terraform en utilisant Chocolatey avec la commande suivante :
```shell
choco install terraform

```

### Installation AWS CLI

msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi

### Création d'un utilisateur IAM

Sur votre compte AWS, créez un utilisateur IAM et attribuez-lui un groupe avec des droits d'administrateur sur tous les services AWS.

J'ai rencontré une difficulté lors de la création de l'access key. Voici comment vous pouvez le faire : après avoir créé l'utilisateur, cliquez sur son nom, puis accédez à "Security Credentials" et créez une access key.

### Utilisation de Terraform
Pour la connexion avec AWS bien renseigner dans provider l'access key que vous avez crée auparavant et la région.
Faites attention à spécifier la région AWS appropriée lorsque vous récupérez le code AMI.

Pour créer une ressource il faut:

- désigner le type de ressource
- le nom de la ressource que vous voulez crée

### Commandes Terraform


- terraform init: Initialise le répertoire de travail Terraform.
- terraform plan: Affiche un plan des actions que Terraform exécutera.
- terraform apply: Applique les modifications spécifiées dans votre configuration Terraform.
- terraform destroy: Détruit les ressources créées avec Terraform.