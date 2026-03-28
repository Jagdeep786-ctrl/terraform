# 🚀 Terraform Multi-Environment Infrastructure (Dev & Prod)

This repository contains Terraform code to manage infrastructure across multiple environments using:

* ✅ Terraform Workspaces
* ✅ Git Branching Strategy
* ✅ `for_each` and `tomap()`
* ✅ Reusable Infrastructure Code (EC2 instances)

---

# 📂 Repository Structure

## 🔹 Git Branches

* `main` → Default branch (GitHub)
* `prod` → Production environment
* `dev` → Development environment

## 🔹 Terraform Workspaces

* `default` → Production (IMPORTANT: Terraform default workspace = prod)
* `dev` → Development workspace

---

# 🔗 Branch ↔ Workspace Mapping

| Git Branch | Terraform Workspace |
| ---------- | ------------------- |
| prod       | default             |
| dev        | dev                 |

---

# 📁 Terraform Files

```
.gitignore
ec2.tf
output.tf
providers.tf
terraform.tf
variables.tf
terra-key-ec2.pub
```

---

# ⚙️ Terraform Workspace Commands

## List Workspaces

```bash
terraform workspace list
```

## Create Dev Workspace

```bash
terraform workspace new dev
```

## Select Dev Workspace

```bash
terraform workspace select dev
```

## Select Production Workspace

```bash
terraform workspace select default
```

## Show Current Workspace

```bash
terraform workspace show
```

# 🧪 Full Terraform Workflow

```bash
terraform init
terraform workspace list
terraform workspace new dev
terraform workspace select dev
terraform validate
terraform plan
terraform apply
```

---

# 🔧 Git Commands (Full Setup)

## Initialize Repo

```bash
git init
```

## Add Files

```bash
git add .
```

## Check Status

```bash
git status
```

## Commit

```bash
git commit -m "Initial Terraform setup"
```

## Add Remote

```bash
git remote add origin https://github.com/Jagdeep786-ctrl/terraform.git
```

## Push Main Branch

```bash
git branch -M main
git push -u origin main
```

---

# 🌱 Dev Environment Setup

```bash
git checkout -b dev
terraform init
terraform workspace new dev
terraform workspace select dev
terraform plan
terraform apply
git add .
git status
git commit -m "Dev environment setup"
git push -u origin dev
```

---

# 🚀 Production Environment Setup

```bash
git checkout prod
terraform init
terraform workspace select default
terraform plan
terraform apply
git add .
git status
git commit -m "Production update"
git push -u origin prod
```

---

# 🔄 Switching Environments

## Switch to Dev

```bash
git checkout dev
terraform workspace select dev
```

## Switch to Prod

```bash
git checkout prod
terraform workspace select default
```

---

# ⚠️ Important Notes

* Terraform default workspace = **production**
* Always confirm workspace before `apply`
* Keep dev and prod isolated using both:

  * Git branches
  * Terraform workspaces
* `for_each` avoids duplicate code
* `tomap()` ensures proper iteration

---

# 📦 Combined Git + Terraform Flow

## DEV

```bash
git checkout dev
terraform workspace select dev
terraform apply
```

## PROD

```bash
git checkout prod
terraform workspace select default
terraform apply
```



# 👤 Author

**Jagdeep786-ctrl**

DevOps | Terraform | AWS | Infrastructure as Code
