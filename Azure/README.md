## Contents

+ [Getting Started](#getting-started)
+ [Creating a notebook instance with R kernel in Azure](#creating-a-notebook-instance-with-r-kernel-in-azure)
+ [Creating Azure Blob Storage](#creating-azure-blob-storage)
+ [Azure Architecture](#azure-architecture)

## Getting Started
Each learning submodule will be organized in an R Jupyter notebook with step-by-step hands-on practice with R command line to install necessary tools, obtain data, perform analyses, visualize and interpret the results. The notebook will be executed in the Azure environment. Therefore, the first step is to set up a notebook instance in Machine Learning Studio.

<!-- #region -->
## Creating a notebook instance with R kernel in Azure

Follow the steps highlighted [here](https://github.com/NIGMS/NIGMS-Sandbox/blob/main/docs/HowToCreateAzureMLNotebooks.md) to create a new notebook instance in Azure Machine Learning Studio. Follow steps and be especially careful to enable idle shutdown as highlighted. For this module, in step 6 in the "Notebook instance type" tab, select 'Standard_DS3_v2' from the dropdown box.

The Machine Learning Studio Jupyter Notebooks already have an R kernel available which we will use and install our packages to.

Option 1 uses the 'Notebook' tab in the left-hand menu to view an Azure UI version of interacting with notebooks. If you are using option 1 after navigating to **Notebooks**, start your instance, and then you can run your notebooks.

Option 2 allows you to enter in a JupyterLab setting to interact with notebooks. If you are using option 2 after creating the instance to run the notebooks under 'Compute', you can click **Start**. Then under 'Applications' click **JUPYTERLAB**.

### Downloading and Running Tutorial Files

Now that you have successfully created your virtual machine, you can use either the Azure Notebook UI screen or Jupyterlab screen to interact with the tutorials. The next step is to import the notebooks and start the course. 

This can be done in either two ways:

**Azure Notebook UI Setting**
Open the terminal, type in `git clone https://github.com/NIGMS/Consensus-Pathway-Analysis-in-the-Cloud.git`, then hit enter.

![](./images/Intro/Azure_clone_repo.png)

**JupyterLab Setting**
Selecting the __Git__ from the top menu in Jupyterlab, and choosing the __Clone a Repository__ 
option. Next, you can copy and paste in the link of the repository: `https://github.com/NIGMS/Consensus-Pathway-Analysis-in-the-Cloud.git` and click __Clone__.

![](./images/Intro/clone.png)

This will download the repository to your JupyterLab folder. All tutorial files for the five submodules are in Jupyter format with a .ipynb extension. Double-click each file to view its content and select your kernel in the top left corner to run the notebook in a specific conda environment (e.g., R, Python, etc.). From here, you can run each section, or "cell", of the code, one by one, by pressing the "Play" button next to the cell for the Azure Notebook UI or above for the JupyterLab setting.

**Azure Notebook UI Setting**

![](./images/SettingGC/Azure_run_cell.png)

**JupyterLab Setting**

![](./images/SettingGC/Run_Cell.png)

Some 'cells' of code take longer for the computer to process than others. You will know a cell is running when a cell has an asterisk next to it \[\*\]. When the cell finishes running, that asterisk will be replaced with a number, which represents the order the cell was run. You can now explore the tutorials by running the code in each, from top to bottom. Look at the 'workflows' section below for a short description of each tutorial.

Jupyter is a powerful tool with many useful features. For more information on how to use Jupyter, we recommend searching for Jupyter tutorials and literature online.

### Stopping Your Instance/Virtual Machine

When you are finished running code, you should turn off your notebook by turning off the instance attached to your notebook to prevent unnecessary billing or resource use by navigating to **Compute** in the side menu, selecting your instance, then clicking the __STOP__ button.

![](./images/Intro/stop_instance.png)

## Creating Azure Blob Storage
In this section, we will describe the steps to create Azure Blob Storage to store data generated during analysis.  The storage can be created via GUI or using the command line.

Azure Storage is comprised of three parts: accounts, containers, and blobs, as seen in the image below. Accounts contain containers which act as folders. Containers hold files, aka blobs and folders or subfolders.

<img src="./images/Module1/azure_blob_diagram.png" alt="Alt Text" width="300" height="200">

When you create the Azure Machine Learning service, it will automatically create a storage account under the name of the workspace you created before. This allows you to either use the previously made storage account or create a new one. Instructions for both options are outlined below.

**Option 1:Using a Premade Storage Accounts**
1. On the webpage of your Azure account, find and select `Azure Storage Accounts`.
2. Find and click the storage account that is labeled the same as your Machine learning service.
![|](./images/Module1/Data_CloudStorageAccount.png)
4. Navigate to `Containers` on the left side menu.
5. The console will list all the containers and files created as shown in the figure below. Some of these containers and files are automatically created when we create our Machine Learning Service:
![](./images/Module1/Data_CloudStorageContainer.png)
6. Click `+ Container` to create and name a new container.
<img src="./images/Module1/Data_CloudContainerName.png" alt="Alt Text" width="300" height="200">

7. Click on the new container, then click `Upload` to upload files.
![](./images/Module1/Data_CloudBlobUpload.png)

**Option 2: Creating a New Storage Account**
1. On the webpage of your Azure account, find and select `Azure Storage Accounts`.
2. Select `CREATE` button to create a new storage account.
3. Enter the information such as Subscription, resource group, and storage account name. Make sure the storage name is unique.
4. For Primary Service, select 'Azure Blob Storage'.
5. For Performance, select 'Standard'.
6. For Redundancy, select 'Locally-redundant Storage (LRS)'. Note that users can define the access control in this step, and edit the access later once users want to share their data.
7. Click `CREATE`.
8. Navigate to your storage account, then click on 'Containers' on the left side menu.
9. Click `+ Container` to create and name a new container.
10. Click on the new container, then click `Upload` to upload files.

**Option 3: Using the Azure CLI**
1. Create or use a premade storage account
2. Run `system(az login, inter = TRUE)` in the terminal and follow the prompt to authenticate.
3. Run `system("az storage container create --account-name <STORAGE-ACCOUNT-NAME> --name <CONTAINER-NAME>", intern = TRUE)` in your Jupyter notebook or the terminal to create your container
4. Run `system("az storage blob upload --account-name <STORAGEACCOUNT-NAME> --container-name <CONTAINER-NAME> --name <FILE-NAME> --file <LOCAL-FILE-PATH>")` in your Jupyter notebook or the terminal to upload your files to your blob storage


Once the uploading is done, users if they haven't already must authenticate by running `az login` then load the data to their instance by running the following command syntax in an R code block: `system("az storage blob download --account-name <STORAGEACCOUNT-NAME> --container-name <CONTAINER-NAME> --name <FILE-NAME> --file <DESTINATION>", intern = TRUE)`. For example, we run the following command lines to load the dataset GSE5281 we store in the Azure Blob Storage:

```
# Download the files from Blob Storage to the "data" folder in the current directory
system("az storage blob download --account-name  --container-name data --name GSE5281.csv --file ./data/GSE5281.csv", intern = TRUE)
system("az storage blob download --account-name  --container-name data --name GSE5281_SampleInfo.csv  --file ./data/GSE5281_SampleInfo.csv", intern = TRUE)
```

You can learn more about `az storage` commands by reading the article [here](https://learn.microsoft.com/en-us/azure/storage/blobs/storage-quickstart-blobs-cli).

## Architecture Diagram

# ![](./images/Intro/architecture.png)
The figure above shows the architecture of the learning module with Azure infrastructure. First, we will create a Machine Learning Studio Jupyter Notebook with the premade R kernel. The code and instructions for each submodule are presented in a separate Jupyter Notebook.
The user can either upload the Notebooks to the Machine Learning Studio Notebooks or clone from the project repository. Then, users can execute 
the code directly in the Notebook. In our learning course, the submodule 01 will download data from the public repository (e.g., the GEO database)
for preprocessing and then save the processed data to a local file in the notebook and to the user's Azure Storage Container. The output
of the submodule 01 will be used as the input for all other submodules. The outputs of the submodules 02, 03, and 04 will be saved to the
local repository in Machine Learning Studio Notebooks, and the code to copy them to the user's cloud storage is also included.
<!-- #endregion -->
