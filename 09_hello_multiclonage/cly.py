import subprocess
import sys

def run_create_instance(instance_count):
    subprocess.run(["terraform", "apply", f"-var=instance_count={instance_count}", "-auto-approve"], check=True)
    print("Terraform apply terminé avec succès.")

def main():
    if len(sys.argv) != 2:
        print("Usage: python cly.py <instance_count>")
        sys.exit(1)

    instance_count = int(sys.argv[1])
    

    with open("terraform.tfvars", "w") as f:
        f.write(f"instance_count = \"{instance_count}\"")

    print(f"Le fichier terraform.tfvars a été mis à jour avec {instance_count} instances.")
    run_create_instance(instance_count)

if __name__ == "__main__":
    main()
