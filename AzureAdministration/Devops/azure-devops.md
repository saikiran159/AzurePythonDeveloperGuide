# 🚀 Let's Learn Azure DevOps

As we all have come to a conclusion that **Agile** is the way of managing software projects these days, we now need to focus on the tools required to implement it.

**Azure DevOps** is a platform that hosts all the capabilities required to manage a project from **planning to deployment**.

## 🔹 What Capabilities Do We Need?
1. **Work Management**: We need a tool to define who has to work on what and when it should be completed. For this, Azure provides **Azure Boards**.
2. **Version Control**: We need a tool to store code, with senior developers reviewing it before finalizing. For this, Azure provides **Azure Repos**.
3. **Package Management**: We need a tool to manage custom packages across projects securely. For this, Azure provides **Azure Artifacts**.
4. **Testing**: We need a tool for functional, integration, and other testing before proceeding to the next step. For this, Azure provides **Azure Test Plans**.
5. **CI/CD & Automation**: We need a tool to automate testing, release, and deployment to improve time-to-market. For this, Azure provides **Azure Pipelines**.

All of the above tools are part of a single platform called **Azure DevOps**. Since all these tools are developed by Microsoft, they integrate seamlessly, offering flexibility and control over the DevOps process.

---

## 📌 Azure Boards

The first step is to **create a project** in Azure DevOps. While creating a project, we need to choose:
- **Workflow type** (Agile methodology)
- **Version control system** (Git or TFVC)

Agile is just a concept—different teams execute it in different ways based on project complexity and preferences. So, Azure provides different **workflow types**:

1. **Basic**: Simplest workflow with three task states: `To Do`, `Doing`, `Done`.
2. **Agile**: More structured with five task states: `New`, `Active`, `Resolved`, `Closed`, and `Removed`.
3. **Scrum**: Standard Agile framework for large-scale projects.
4. **CMMI**: Used primarily by enterprises for structured project management.

### 🎯 Example Use Cases
1. **Simple Side Project**: A web scraper for hot topics.
   - Work Items: `Epic` → `Issue` → `Task`
   - Stages: `To Do`, `Doing`, `Done`

2. **Large-scale Online Delivery App**:
   - Work Items: `Epic` → `Feature` → `User Story` → `Task`
   - Stages: `New`, `Active`, `Committed`, `Done`, `Removed`

### ⚡ Features of Azure Boards
- Create **custom work items** and stages.
- Link work items in a **hierarchical structure** and assign them to individuals.
- Link a **Git branch** to a specific user story, feature, or task.
- Create and manage **test cases**.
- Maintain **documentation** (e.g., release notes, API docs).

---

## 🏗️ Azure Repos

We can host Git repositories in Azure DevOps or import third-party repositories (e.g., GitHub, GitLab) using **Service Connections**.

### 🔄 Git Branching Strategies
1. **Git Flow**: Create a separate branch per feature and merge into the main branch after completion.
2. **Trunk-Based Development**: The main branch is CI/CD integrated, with short-lived feature branches merged frequently.
3. **GitHub Flow**: Similar to trunk-based development, but feature branches are not deleted.

### 🔑 Features of Azure Repos
- Define **who has access** and their permission levels.
- Require **code reviews** before merging a Pull Request.
- Enforce **branch policies**, such as naming conventions, reserved file names, commit message formats, and file size limits.

---

## 📦 Azure Artifacts

Azure Artifacts is useful in two scenarios:
1. **Private Package Management**: Securely manage software package lifecycles instead of using public package managers (e.g., `pip`, `npm`, `NuGet`).
2. **Compiled Language Support**: Store and manage build outputs (e.g., `.dll` files for C#, minified and bundled JS files) for deployment.

### 🔑 Key Takeaway
- Use **Azure Artifacts** for **managing and distributing private dependencies**.
- Use **Publish Artifact Task** to **store and transfer build outputs** between pipeline stages.

For containerized applications, **Azure Container Registry** (ACR) is preferred over Azure Artifacts.

---

## 🔄 Azure Pipelines

Azure Pipelines implement **CI/CD** to automate software builds, tests, and deployments.

- **Azure Pipelines** consists of two features: **Pipelines** and **Releases**.  
- The **Pipeline** is the first to be triggered.  
- **Pipelines (Continuous Integration - CI)** are used to build and run unit tests for the project.  
- Only after the **Pipeline** successfully completes, the **Release (Continuous Deployment - CD)** process is triggered.
- The **Release** can be triggered **automatically or manually**, depending on the configuration.

### 🎯 Release Triggers
Releases can be triggered by:
1. **Branch Commits**
2. **Pull Requests**
3. **Scheduled Jobs**
4. **External Endpoints**
5. **Manual Triggers**

### 🏗️ Releases pipeline Structure
1. Pipelines can be **designed via UI** or **YAML files**.
2. Pipelines consist of **stages** (e.g., `Dev`, `Test`, `Production`).
3. Each stage contains **jobs**, which execute **tasks** sequentially.
4. **Stages and jobs can run in parallel** on different agents.
5. Tasks include unit tests, security scans, and infrastructure provisioning.
6. **Pre and post-deployment approvals** ensure quality before proceeding.
7. **Custom validation gates** can be added from the marketplace or built manually.
8. **Variable groups** store environment-specific configurations, alongside pre-built Azure DevOps variables.

---
## Azure Test Plans 🚀

### Why Testing is Important?
Before deploying our application to production, we need to test it thoroughly. Some testing can be automated, while others need to be done manually.

### ✅ Automated Testing
We can automate the following types of tests:
1. **Component-Level Testing**
2. **Functional Testing**
3. **Integration Testing**

### 📝 Manual Testing
Certain tests require manual execution:
1. **User Acceptance Testing (UAT)**
2. **Usability Testing**

### 🛠️ Testing with Tools
Some tests require specialized tools:
1. **Performance Testing**
2. **Security Testing**

### 🔗 Storing Test Code in GitHub
- Test scripts are usually stored in **GitHub** to be used by test automation tools.
- Whenever a **commit** is made or a **pull request (PR)** is created, automated test scripts are executed.
- If any test case **fails**, the pipeline can be configured to **stop** or follow a different behavior.

### ⚙️ Running Tests in Azure DevOps
- Tests run in **agents** that are configured for the task.
- Unit testing tools may allow some test cases to be ignored.
- **Azure Test Plans** provides a feature called **Code Coverage**, which shows:
  - Test files that were **executed** ✅
  - Test files that were **skipped** ❌
- Code coverage is implemented using third-party libraries available in different programming languages, and Azure Test Plans presents the results in a **user-friendly UI**.

### 🔄 Distributing Tests Across Agents
When companies define a large number of test cases, running them all sequentially can be time-consuming. To optimize execution, test cases can be run in parallel. There are multiple **strategies** for distributing test cases:
1. **Split test cases equally across agents**
2. **Split test cases based on their execution time**
3. **Split test cases based on their type**

### 🐞 Handling Test Failures
- If a test case **fails**, we can determine whether:
  - It is a **new error** 🆕
  - It is an **existing issue** ⚠️
- We can directly **create a bug workitem** from Azure Test Plans and assign it for resolution.
- If it is a new error, we can identify:
  - The **commit** that introduced the error.
  - The **exact line** of code that caused the failure.

### 📄 Test Result Formats
Azure Test Plans allows choosing different output formats for test results, including:
- **JUnit**
- **NUnit**
- **XUnit**
- **CTest** e.t.c