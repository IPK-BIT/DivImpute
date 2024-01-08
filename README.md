# DivImpute
![GitHub License](https://img.shields.io/github/license/IPK-BIT/divassociate)

This workflow is implemented to perform a genotype imputation using the Beagle [1] Imputation Software. It splits the VCF into overlapping windows that are imputed independant from another and merged into one VCF afterwards.

```mermaid
flowchart TB
    subgraph " "
    v0["vcfFile"]
    v3["windowSize"]
    v4["overlap"]
    end
    v1([indexVCF])
    v2([listVariants])
    v5([writeWindows])
    v8([splitVCFByWindow])
    v9([imputeWindows])
    v11([indexImputedWindow])
    v13([mergeImputedWindows])
    subgraph " "
    v14[" "]
    end
    v6(( ))
    v10(( ))
    v12(( ))
    v0 --> v1
    v1 --> v2
    v1 --> v8
    v2 --> v5
    v3 --> v5
    v4 --> v5
    v5 --> v6
    v6 --> v8
    v8 --> v9
    v9 --> v11
    v9 --> v10
    v11 --> v12
    v10 --> v13
    v12 --> v13
    v13 --> v14
```

# Citations

Feser, Manuel, König, Patrick, Fiebig, Anne, Arend, Daniel, Lange, Matthias and Scholz, Uwe. "On the way to plant data commons – a genotyping use case" Journal of Integrative Bioinformatics, vol. 19, no. 4, 2022, pp. 20220033. https://doi.org/10.1515/jib-2022-0033

A list of publications of standards and tools used with this workflow can be found here: 

[1] B L Browning, Y Zhou, and S R Browning (2018). A one-penny imputed genome from next generation reference panels. Am J Hum Genet 103(3):338-348. doi:10.1016/j.ajhg.2018.07.015
