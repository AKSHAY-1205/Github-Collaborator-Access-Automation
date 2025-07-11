# 🔧 GitHub Collaborator Access Automation

This project automates the process of accessing **collaborators and contributors** of a GitHub repository using a Shell script and the GitHub REST API. It removes the need to manually navigate through GitHub settings and provides a streamlined solution that runs from an **AWS EC2 Ubuntu instance**.

---

## 🚀 Project Overview

Manually retrieving collaborators from GitHub involves multiple steps through the web UI:

> GitHub → Organization → Settings → Collaborators

To streamline this process, I created a shell script that:
- Uses the **GitHub REST API**
- Authenticates via a **Personal Access Token (PAT)**
- Runs on a **Linux-based EC2 instance**
- Can be executed remotely via SSH (e.g., using **MobaXterm**)

---

## 📂 File Included

- `list-users.sh` – Shell script that takes a repository owner and name, then fetches collaborators and contributors via the GitHub API.

---

## ⚙️ Technologies Used

- Shell Scripting  
- GitHub REST API  
- AWS EC2 (Ubuntu 22.04)  
- MobaXterm (SSH Client for Windows)  
- curl, bash

---

## 🧰 Prerequisites

- A valid **GitHub account** with a **Personal Access Token (PAT)**  
  → Generate at: [https://github.com/settings/tokens](https://github.com/settings/tokens)
- A **running Ubuntu EC2 instance**
- An SSH client like **MobaXterm** or terminal
- `curl` installed (usually pre-installed on Ubuntu)

---

## 🛠️ Setup Instructions

### 1️⃣ Launch & Connect to EC2

- Launch an EC2 Ubuntu instance via [AWS Console](https://console.aws.amazon.com/ec2/)
- Connect using SSH:
```bash
ssh -i your-key.pem ubuntu@your-ec2-public-ip
```
### 2️⃣ Create a Script(list-users.sh) in the EC2 instance that is created 

- Transfer the script 

### 3️⃣ Make Script Executable
```bash
chmod +x list-users.sh
```
### 4️⃣ Export GitHub Credentials
```bash
export username='your-github-username'
export token='your-personal-access-token'
```
### 5️⃣ Run the Script
```bash
./list-users.sh <repo owner> <repo name>
```
### 📝 Example:
```bash
./list-users.sh facebook react
```
### 🔐 Security Note
->Do not hardcode your token into the script
->Always use export to inject credentials temporarily during the session
->Make sure your PAT has the correct scopes:
    -repo for private repositories
    -read:org for organization-level data
    
### 📄 License
This project is open-source and available under the MIT License

### 🙋‍♂️ Author
Akshay J
DevOps Enthusiast | Engineering Student | ML & DL Practitioner



