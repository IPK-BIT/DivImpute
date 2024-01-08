# Usage Guide for the Workflow
This workflow is implemented to perform a genotype imputation using the Beagle Imputation Software. It splits the VCF into overlapping windows that are imputed independant from another and merged into one VCF afterwards.

> :memo: **NOTE**: This documentation uses text from the [Nextflow Documentation](https://nextflow.io/docs/latest). It may therefore be outdated when you read it. Please refer for Nextflow specific questions to the offical documentation.

## Workflow Overview
The workflow is composed of several processes, each performing a specific task in the pipeline. These processes include:

- `indexVCF`: Computes an index file for the input VCF file
- `listVariants`: Lists all variants available with the VCF File to cut the respective windows based on number of variants
- `writeWindows`: Computes the window ranges containing n variants with m variants overlapping between two consecutive windows
- `splitVCFByWindow`: Splits the input VCF for the computed windows
- `imputeWindows`: Runs Beagle5.4 on each window VCF
- `indexImputedWindow`: Indexes each of the imputed window VCFs
- `mergeImputedWindow`: Merges the resulting VCFs into one output VCF file

## Workflow Execution
To execute the workflow, you need to provide the following inputs:

- `vcf`: The VCF file to be imputed
- `outdir`: The directory where the results will be saved.
- `windowSize`: Number of variants in each window. Defaults to 5000
- `overlap`: Number of variants shared by two consecutive windows. Defaults to 1000

Here is an example of how to execute the workflow:

```
nextflow run workflow.nf --vcf '/path/to/input.vcf' --outdir '/path/to/output/directory' --windowSize 5000 --overlap 1000
```

## Running the Workflow on Different Environments
Nextflow is designed to be platform-agnostic, allowing you to run your workflow on various execution environments such as local machines, cluster resource managers, or the cloud. This is achieved through the use of executors, which determine the system where a pipeline process is run and supervise its execution.

### Cluster Execution
Nextflow supports several cluster executors, including local and SLURM. For a full list refer to the [Nextflow Documentation](https://www.nextflow.io/docs/latest/executor.html). 

#### Local Executor
The local executor is used by default and runs the pipeline processes on the computer where Nextflow is launched. It parallelizes the processes by spawning multiple threads, taking advantage of the multi-core architecture of the CPU. This executor is useful for developing and testing a pipeline script on your computer before switching to a cluster or cloud environment with production data.

#### SLURM Executor
To use the SLURM executor, set `process.executor = 'slurm'` in the `nextflow.config` file. The pipeline must be launched from a node where the `sbatch` command is available, which is typically the cluster login node. Nextflow manages each process as a separate job that is submitted to the cluster using the `sbatch` command.

### Hybrid Deployments
Nextflow allows the use of multiple executors in the same workflow application. This feature enables the deployment of hybrid workloads in which some jobs are executed on the local computer or local computing cluster, and some jobs are offloaded to the AWS Batch service. To enable this feature, use one or more process selectors in your Nextflow configuration file.

### Sharing Your Workflow
Nextflow integrates seamlessly with BitBucket, GitHub, and GitLab hosted code repositories and sharing platforms. This feature allows you to manage your project code in a more consistent manner or use other people’s Nextflow pipelines, published through BitBucket/GitHub/GitLab, in a quick and transparent way.

To publish your Nextflow pipeline to GitHub (or any other supported platform) and allow other people to use it, you only need to create a repository containing all your project script and data files. Once you have uploaded your pipeline project, other people can execute it simply using the project name or the repository URL.

```
nextflow run foo/bar
```

or
```
nextflow run http://github.com/foo/bar
```