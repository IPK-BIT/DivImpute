# DivImpute 

Scripts to start imputation jobs on the virtual machines of a project running on the de.NBI Cloud. 
Three virtual machines are used in this particular setup. One Head Node to start the jobs by running the scripts and two Computational Nodes. All nodes run with Ubuntu and the later specified software was installed. The nodes store the data in a Cinder Volume mounted as /volumes/volume001. 

## Required Tools

- [Beagle4.1](https://faculty.washington.edu/browning/beagle/b4_1.html) and bref
- [bcftools 1.10](http://www.htslib.org/download/)

## Usage

1. Install required tools
3. The enumerated scripts are run from a header node, that can access some computational nodes by running the scripts *batch_impute.sh* or *imputeOnReferencePanel.sh*
4. the single node example can be accessed through the script *03_singleFileImputation.sh*

## Parameters

### 01_split.sh
Parameter | Description | Example
---       | ---         | ---
$1        | Input VCF   | input.vcf.gz
$2        | Output Name | output

### 02_send_data.sh
Parameter | Description                   | Example
---       | ---                           | ---
$1        | List of Chromosome Names      | chr_names.txt
$2        | IP Address Computational Node | 192.168.0.80 
$3        | Private Key                   | .ssh/my-private-key

### 03_singleFileImputation.sh
Parameter | Description                   | Example
---       | ---                           | ---
$1        | IP Address Computational Node | 192.168.0.80
$2        | Private Key                   | .ssh/my-private-key

### 03_start_job_gt.sh
Parameter | Description                   | Example
---       | ---                           | ---
$1        | IP Address Computational Node | 192.168.0.80
$2        | Private Key                   | .ssh/my-private-key

### 03_start_job.sh
Parameter | Description                   | Example
---       | ---                           | ---
$1        | IP Address Computational Node | 192.168.0.80
$2        | Private Key                   | .ssh/my-private-key

### 04_receive_data.sh
Parameter | Description                   | Example
---       | ---                           | ---
$1        | IP Address Computational Node | 192.168.0.80
$2        | Private Key                   | .ssh/my-private-key

### 05_get_logs.sh
Parameter | Description                   | Example
---       | ---                           | ---
$1        | IP Address Computational Node | 192.168.0.80
$2        | Private Key                   | .ssh/my-private-key

### 06_cleanup.sh
Parameter | Description                   | Example
---       | ---                           | ---
$1        | IP Address Computational Node | 192.168.0.80
$2        | Private Key                   | .ssh/my-private-key
