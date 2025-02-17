# 🚀 Why Write Code for Deployment Instead of Using Azure's UI?

Azure provides a beautiful UI for creating and managing resources, so why should we write code for deployment? Let's explore the reasons. 👇

## 🔹 When Should We Use Deployment Code?

1. **Scaling Up Deployments Efficiently**
   - When deploying **10-50 virtual machines or storage accounts** at once, using the UI is **time-consuming, error-prone, and tedious**.

2. **Avoiding Misconfigurations & Debugging Hassles**
   - Deploying multiple resources manually increases the risk of misconfigurations.
   - Fixing issues later can be **confusing and time-consuming**, especially when debugging under tight deadlines.

3. **Ensuring Idempotent Deployments**
   - Code-based deployments ensure that resources are deployed in an **idempotent manner** (i.e., running the script multiple times results in the same state).

4. **Efficiently Spinning Up & Tearing Down Resources**
   - You may need to **create and destroy resources dynamically** based on demand.
   - Example:
     
     🏡 **Imagine you're a realtor** who worked with a freelancer to build an AI assistant. This assistant analyzes your **bills (images), bank statements (PDFs), and other documents** and generates a PowerPoint presentation summarizing your **annual expenses, savings, EMIs, tax benefits, and estimated taxes**.
     
     - The AI assistant is a **web application**.
     - You only need it **once a year** before the fiscal year starts.
     - If the application **runs year-round, you'll be paying for it unnecessarily**.
     
     ✅ **Solution:** Use deployment scripts (like ARM templates) to **spin up the AI-powered web app only when needed** and **tear it down after use**—saving costs without needing software engineering skills.
     
     **Cool, right? 😎**

## 🎯 Perks of Using Deployment Code

1. **No Need to Worry About Resource Deployment Order** 🏗️
2. **Reusability** 🔁
   - Deployment scripts can be designed as **modules or functions** for reuse in other deployments.
3. **Run Shell Scripts in Deployment** 🖥️
   - Azure enables running shell scripts within deployment scripts using **Azure Storage Accounts and Azure Container Instances (ACI)**.
4. **Preview Changes Before Deployment** 🔍
5. **Track Changes with CI/CD Pipelines** 🚦
6. **Better Developer Experience** 👨‍💻
   - ARM templates (or better alternatives) contain a lot of syntax that is hard to remember.
   - Thankfully, **Azure provides VS Code extensions** to simplify the process! 🎉
7. **Can Store deployment files for later use**
   - ARM templates support template specs, which can be used to store the templates in azure **resource group**.
   - From here, we can deploy the template with the resource group name where template spec is created and it's id.
   - Template specs can be done through **Azure portal** too

---
### 📌 Conclusion
Using deployment code over Azure's UI offers automation, efficiency, and cost savings. While Azure UI is user-friendly, **writing deployment scripts scales better, ensures consistency, and reduces manual effort**. 🚀

---

# Comparing Deployment Tools: ARM Templates, Bicep, and Terraform

## 🚀 From Modules, You Will Learn:
- How to create deployment files for **ARM**, **Bicep**, and **Terraform**.

---

## 🔄 ARM Templates vs Bicep
1. **Clear Winner:** Bicep is the recommended choice by Microsoft due to its **shorter and simpler syntax**.
2. **Conversion:** You can convert an ARM template to Bicep (with some manual adjustments) using the **Azure CLI (`az` tool)**.

---

## ⚖️ Bicep vs Terraform
1. **Latest Services:** New Azure services become available for deployment **faster in Bicep** than in Terraform.
2. **Cloud Support:** Bicep is **Azure-specific**, while Terraform supports **multi-cloud** deployments.
3. **State Management:**
   - Terraform maintains a **state file** for tracking deployments.
   - Sensitive data (e.g., keys, passwords) can be securely stored in **remote state**.
   - Bicep lacks **built-in state management**, though some workarounds exist.

---

## 🏆 Final Verdict
1. **Bicep vs ARM Templates:** Bicep is the **clear winner**.
2. **Bicep vs Terraform:**
   - It depends on the use case.
   - Terraform provides **advanced features** like **multi-environment management** with minimal code changes.

---

## 🔄 Managing the Lifecycle of ARM & Bicep Templates

### 📌 **Template Specs (Latest Feature)**
1. Enables **version control** for ARM and Bicep templates.
2. **Role-based access** can be assigned for managing deployments.
3. Allows linking a **main template** to a template stored in **Template Spec**.
4. Deployment can be done using **Azure Portal, SDK, CLI, or REST API**.
5. When creating a **Template Spec**, it automatically includes **linked templates**.
6. **Best Practice:** Use **modular Template Specs** since there is a **2MB size limit**.

---

### ❌ **Azure Blueprints (Being Deprecated in 2026)**
1. Requires **ARM templates in JSON format** (either local or from GitHub).
2. Supports lifecycle management via **Azure Portal, SDK, REST API**, etc.
3. Key components:
   - **Role:** Defines who manages the blueprint.
   - **Policy:** Determines rules applied at different scopes.
   - **Resources:** Defined in ARM templates.
4. **Blueprint Lifecycle:**
   - Created in **Draft mode** with a version.
   - After deployment, it moves to **Published mode**.
   - Editing creates a **new draft version**, which must be **deployed** to take effect.
5. **Locking:**
   - Blueprints can be locked.
   - Locks apply to all policies and resources.
6. **Deletion:**
   - Deleting a Blueprint **does not delete** resources but **removes all locks**.

---

### 🔄 **Azure Deployment Stacks (Replacement for Blueprints)**
1. Supports **Bicep, ARM Templates, or Template Specs** for resource deployment.
2. **Scope Rules:**
   - If deploying **resources** → Deployment Stack **scope = Resource Group**.
   - If deploying **Resource Groups** → Deployment Stack **scope = Subscription**.
   - If deploying **Resource Groups across subscriptions** → Deployment Stack **scope = Management Group**.
3. **Role-Based Access Control (RBAC):**
   - Assign roles to control **who can manage** the deployment stack.
4. **Resource Management When Deleting Deployment Stack:**
   - `deleteAll` → Deletes **resources** and **resource groups**.
   - `deleteResources` → Deletes **only resources**, keeping resource groups.
   - `detachAll` → Detaches resources but keeps them in Azure (unmanaged).
5. **Resource Locking Options:**
   - `none` → No restrictions (can modify/delete resources).
   - `denyDelete` → Prevents deletion (control-plane level only).
   - `denyWriteAndDelete` → Prevents both modifications and deletion.
   - **Additional options** for **data-level locks** are available.

---

### 🏁 **Conclusion**
- **Bicep is superior to ARM Templates** and is **Microsoft's recommended tool**.
- **Terraform is more flexible** for multi-cloud deployments and **offers advanced state management**.
- **Azure Blueprints are being retired in 2026**; use **Deployment Stacks** instead for **modern IaC management**.

🚀 **Stay updated and choose the right tool for your cloud deployment needs!**


