## Contents

+ [Getting Started](#getting-started)
+ [Creating a notebook instance with R kernel in Google Cloud](#creating-a-notebook-instance-with-r-kernel-in-google-cloud)
+ [Creating Google Cloud Storage Buckets](#creating-google-cloud-storage-buckets)
+ [Google Cloud Architecture](#google-cloud-architecture)

## Getting Started
Each learning submodule will be organized in an R Jupyter notebook with step-by-step hands-on practice with the R command line to install necessary tools, obtain data, perform analyses, visualize, and interpret the results. The notebook will be executed in the Google Cloud environment. Therefore, the first step is to set up a notebook instance in Vertex AI.


## Creating a notebook instance with R kernel in Google Cloud

Follow the steps highlighted in part two (2. Spin up Instance from a Container) of [here](https://github.com/NIGMS/NIGMS-Sandbox/blob/main/docs/HowToCreateVertexAINotebooks.md) to create a new notebook instance in Vertex AI. Follow steps 1-8, in step 5 select region us-east4 (Northern Virginia) and be especially careful to use custom container `us-east4-docker.pkg.dev/nih-cl-shared-resources/nigms-sandbox/nigms-vertex-r` in step 6 under the Docker container image prompt. In step 7 under the Machine type tab, select **n1-standard-4** from the dropdown box. In step 8, be careful to **Enable Idle Shutdown**. After creating the notebook, you can click on **OPEN JUPYTERLAB**.

### Downloading and Running Tutorial Files

Now that you have successfully created your virtual machine, you will be directed to the JupyterLab screen. 
The next step is to import the notebooks and start the course. 
This can be done by selecting the __Git__ from the top menu in Jupyterlab, and choosing the __Clone a Repository__ 
option. 
Next, you can copy and paste the link of the repository: `https://github.com/NIGMS/Consensus-Pathway-Analysis-in-the-Cloud.git` and click __Clone__. 

![](./images/SettingGC/Clone_Git.png)

This will download the repository to your JupyterLab folder. Navigate to the 'GoogleCloud' directory to view/run the notebook files tailored for Google Cloud. All tutorial files for the five submodules are in Jupyter format with a .ipynb extension. Double-click each file to view the lab content and run the code. This will open the Jupyter file in a Jupyter notebook. From here, you can run each section, or "cell", of the code, one by one, by pressing the "Play" button in the menu above.

![](./images/SettingGC/Run_Cell.png)

Some 'cells' of code take longer for the computer to process than others. You will know a cell is running when a cell has an asterisk next to it \[\*\]. When the cell finishes running, that asterisk will be replaced with a number that represents the order the cell was run. You can now explore the tutorials by running the code in each, from top to bottom. Look at the 'workflows' section below for a short description of each tutorial.

Jupyter is a powerful tool with many useful features. For more information on how to use Jupyter, we recommend 
searching for Jupyter tutorials and literature online.

### Stopping Your Virtual Machine

When you are finished running code, you should turn off your notebook to prevent unnecessary billing or resource use by checking your notebook and pushing the __STOP__ button.

## Creating Google Cloud Storage Buckets
In this section, we will describe the steps to create Google Cloud Storage Buckets to store data generated during 
analysis.  The bucket can be created via the GUI or using the command line.
To use the GUI, the user has to first visit https://console.cloud.google.com/storage/, sign in, and click on __Buckets__ 
on the left menu.

# ![](./images/Bucket/Step0.png)
Next, click on the __CREATE__ button below the search bar to start creating a new bucket.

# ![](./images/Bucket/Step1.png)

This will then open a page where the user will provide the unique name of the bucket, the
location, access control and other information about the bucket. Here, we named our bucket as _cpa-output_ (please remember to create your own since all buckets are meant to have unique names). After this, the user will click on the __CREATE__ button to complete the process.

# ![](./images/Bucket/Step2.png)

To create a Bucket using the command line, the user can use the gcloud storage buckets `create` command
`gcloud storage buckets create gs://BUCKET_NAME` where `BUCKET_NAME` is the user-defined name. 
If the request succeeds, the user gets a success message. The user can also add optional flags
while running the `create` command to have greater control over the creation of the bucket.
Such flags include `--project: PROJECT_NAME`, `--default-storage-class: STORAGE_CLASS`, `--location: LOCATION`
and `--uniform-bucket-level-access` with `PROJECT_NAME` and `STORAGE_CLASS` supplied by the user.

Storage Buckets can also be created on the command line using the `gsutils mb` command.
The command to do so is `gsutil mb gs://BUCKET_NAME`, with `BUCKET_NAME` the desired bucket name.
This command also returns a success message upon completion and can also take optional flags 
`-p`, `-c`, `-l`, `-b` and their user-supplied values, corresponding to project ID or number, default storage class, 
location of the bucket, and uniform bucket-level access, respectively, just like the `create` command.

## Google Cloud Architecture

# ![](./images/Intro/architecture.png)
The figure above shows the architecture of the learning module with Google Cloud infrastructure. First, we will create
a Vertex AI workbench with R kernel. The code and instructions for each submodule are presented in a separate Jupyter Notebook.
The user can either upload the Notebooks to the VertexAI workbench or clone from the project repository. Then, users can execute 
the code directly in the Notebook. In our learning course, the submodule 01 will download data from the public repository (e.g., the GEO database)
for preprocessing and saving the processed data to a local file in Vertex AI workbench and to the user's Google Cloud Storage Bucket. The output
of the submodule 01 will be used as input for all other submodules. The outputs of the submodules 02, 03, and 04 will be saved to the 
local repository in the VertexAI workbench, and the code to copy them to the user's cloud bucket is also included.
