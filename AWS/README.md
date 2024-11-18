## Contents

+ [Getting Started](#getting-started)
+ [Creating a notebook instance with R kernel in Google cloud](#notebook-instance)
+ [Creating Google Cloud Storage Buckets](#google-cloud-bucket)
+ [Google Cloud Architecture](#google-cloud-architecture)

## Getting Started
Each learning submodules will be organized in a R Jupyter notebook with step-by-step hands-on practice with R command 
line to install necessary tools, obtain data, perform analyses, visualize and interpret the results. The notebook will 
be executed in the AWS environment. Therefore, the first step is to set up a notebook instance in AWS SageMaker.


## Creating a notebook instance 

Follow the steps highlighted [here](https://github.com/NIGMS/NIGMS-Sandbox/blob/main/docs/HowToCreateAWSSagemakerNotebooks.md) to create a new notebook instance in Amazon SageMaker. 

+ In step 4, select ml.m5.xlarge from the dropdown box as the notebook instance type and be especially careful to **enable idle shutdown**.

+ In step 7, after creating a notebook instance and being in JupyterLab screen you will need to download the module content. The easiest way to do this is to clone the repository directly for the NIGMS Github. This can be done by clicking on git symbol in your JupyterLab environment and pasting the following URL `https://github.com/NIGMS/Consensus-Pathway-Analysis-in-the-Cloud.git`. This should download our repo, and the tutorial files inside, into a folder called 'Analysis-of-Biomedical-Data-for-Biomarker-Discovery'. Double click this folder now. Inside you will find all of the tutorial files, which you can double click and run. You should also see a data file that contains the biomarker and proteomic data to be analyzed.

+ In step 8, you select a Kernel for the notebook. Please select R for this module. 

+ When you are finished running code, stop your notebook to prevent unneeded billing as illustrated in step 9.

## Creating Amazon S3 Buckets
In this section, we will describe the steps to create AWS S3 Buckets to store data generated during 
analysis.  The bucket can be created via *GUI* or using the *command line*.
To use the GUI, the user has to first visit https://console.aws.amazon.com/s3, sign in, click on __Create bucket__ 
on the right.

# ![](./images/Bucket/bucket1.png)

This will then open a page where the user will provide the unique name of the bucket, the
location, access control and other information about the bucket. Here, we named our bucket as _your-unique-name_ (please remember to create your own since all buckets are meant to have unique names). 

# ![](./images/Bucket/bucket2.png)

After this the user will click on the __Create bucket__ button to complete the process.
# ![](./images/Bucket/bucket3.png)

To create an S3 bucket using the command line, the user can use the AWS CLI command `aws s3 mb`.

```bash
aws s3 mb s3://BUCKET_NAME
```

where `BUCKET_NAME` is the user-defined name. If the request succeeds, the command returns a success message. The user can also add optional parameters to have greater control over the creation of the bucket.  These parameters are typically specified using options like `--<parameter_name> <value>`.

Some common options include:

* **`--region REGION`:** Specifies the AWS Region where the bucket will be created (e.g., `--region us-west-2`).  This is **required** unless a default region is configured in your AWS CLI.  Note that S3 bucket names are globally unique, so choosing a region effectively reserves that bucket name worldwide.
* **`--storage-class STORAGE_CLASS`:** Specifies the storage class for the bucket (e.g., `--storage-class STANDARD`).  If not specified, the default storage class is used.
* **`--block-public-access`:**  Controls block public access settings for the bucket. You can use this with sub-options like `--block-public-access-block-all` to block all public access.  This is generally recommended for new buckets unless public access is specifically required.
* **`--create-bucket-configuration LocationConstraint=REGION`:**  While `--region` is the preferred way to specify region, older versions of the AWS CLI may require this parameter.  Replace `REGION` with the desired AWS region (e.g., `LocationConstraint=us-west-2`).


For example, to create a bucket in the `us-west-2` region with standard storage class and block all public access, you would use:

```bash
aws s3 mb s3://BUCKET_NAME --region us-west-2 --storage-class STANDARD --block-public-access block-all
```

## Google Cloud Architecture

# ![](./images/Intro/architecture.png)
The figure above shows the architecture of the learning module with AWS infrastructure. First, we will create
a SageMaker notebook instance. The code and instruction for each submodule is presented in a separate Jupyter Notebook.
User can either upload the Notebooks or clone from the project repository. Then, users can execute 
the code directly in the Notebook. In this SageMaker notebook instance, Submodule 01 downloads data from public repositories like the GEO database for preprocessing. The preprocessed data is then saved both to the notebook instance's local storage and the user's designated Amazon S3 bucket. This output serves as input for all subsequent submodules. Submodules 02, 03, and 04 save their outputs to the notebook instance's local storage. Code is provided to copy these outputs to the user's S3 bucket for persistent storage.