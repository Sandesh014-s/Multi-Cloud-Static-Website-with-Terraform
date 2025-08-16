# 🌐 Multi-Cloud Static Website with Terraform

This project demonstrates how to deploy a **static website** across **AWS S3** and **Azure Storage** using **Terraform**.  
It highlights **Infrastructure as Code (IaC)** and shows how the same code approach can be applied across multiple cloud providers.

---

## 🚀 Features
- Deploy a static website (`index.html`) to **AWS S3** and **Azure Storage**
- Terraform used for Infrastructure as Code
- Outputs the public URL of the website after deployment
- Easy to extend with load balancers, auto-scaling, or custom domains

---

## 🛠️ Tech Stack
- **Terraform**
- **AWS S3**
- **Azure Storage Static Website**
- **HTML (basic index page)**

---

## 📂 Project Structure
multi-cloud-static-site/
│── aws/ # Terraform configs for AWS
│ ├── main.tf
│ ├── variables.tf
│ ├── providers.tf
│ └── index.html
│
│── azure/ # Terraform configs for Azure
│ ├── main.tf
│ ├── variables.tf
│ ├── providers.tf
│ └── index.html


---

## ⚡ How to Run

### 1️⃣ Deploy on AWS
Make sure you have AWS CLI configured:
```bash
aws configure

## Then run
cd aws
terraform init
terraform apply -var="bucket_name=<your-unique-bucket-name>"

✅ After successful deployment, Terraform will output the website URL.

#Deploy on Azure
Login to Azure CLI first:

az login

## Then run:

cd azure
terraform init
terraform apply -var="storage_account_name=<yourstorage123>"
