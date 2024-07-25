### To configure Terraform in the environmental variables on a Windows laptop, follow these steps:


### Step 1: Download Terraform

**Visit the Terraform Downloads Page:**

- Go to the Terraform Downloads [Page.](https://developer.hashicorp.com/terraform/install)

**Download the appropriate version:**

- Choose the version of Terraform that matches your operating system (Windows).

**Extract the ZIP file:**

- Extract the contents of the downloaded ZIP file to a desired location on your system. For example, you might extract it to C:\terraform.

### Step 2: Add Terraform to the PATH Environment Variable

**Open the System Properties:**

- Press Windows + R to open the Run dialog.

- Type sysdm.cpl and press Enter to open System Properties.

**Open Environment Variables:**

- In the System Properties window, go to the Advanced tab.

- Click on the Environment Variables button.

**Edit the PATH Variable:**

- In the Environment Variables window, find the Path variable in the System variables section and select it.
- Click Edit.

**Add Terraform Path:**

- In the Edit Environment Variable window, click New and add the path to the directory where you extracted Terraform (e.g., C:\terraform).

**Save Changes:**

- Click OK to close each window and save your changes.

### Step 3: Verify the Installation

**Open Command Prompt or PowerShell:**

- Press Windows + R, type cmd, and press Enter to open Command Prompt.

- Alternatively, you can open PowerShell.

**Check Terraform Version:**

- In the Command Prompt or PowerShell window, type the following command and press Enter:

`_terraform --version_`

- You should see output that displays the installed version of Terraform, confirming that it is correctly set up.
