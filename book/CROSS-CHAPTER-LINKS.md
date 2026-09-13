# Pending cross-chapter links

This file tracks in-text links from the original handbook that point to a chapter/section we
haven't migrated yet. They're currently plain text in the `.qmd` source (consistent with our rule
of never linking to a page that doesn't exist yet), each marked at the exact spot with an inline
`<!-- XREF: ... -->` HTML comment so they're easy to find later (`grep -rn "XREF:" book/chapters/`).

**Workflow:** once the target chapter/section is migrated and has a real anchor, convert the plain
text mention to a real Quarto link (`[text](#sec-anchor)`), remove the `XREF` comment, and check off
the row below.

| Done | Current location | Text | Target (once migrated) | Source page |
|---|---|---|---|---|
| [ ] | `chapters/01-eda/distributions/estimating-distribution-parameters.qmd` (Maximum Likelihood) | "reliability chapter" | Ch. 8 Assessing Product Reliability, §8.4.1.2 (Likelihood) | `handbook/apr/section4/apr412.htm` |
| [ ] | `chapters/01-eda/index.qmd` (EDA versus Classical and Bayesian, Models) | "regression models" | Ch. 4 Process Modeling, §4.1.4.1 (regression models) | `handbook/pmd/section1/pmd141.htm` |
| [ ] | `chapters/01-eda/index.qmd` (EDA versus Classical and Bayesian, Techniques) | "ANOVA" | Ch. 7 Product and Process Comparisons, §7.4.2 (ANOVA) | `handbook/prc/section4/prc42.htm` |
| [ ] | `chapters/01-eda/index.qmd` (The Role of Graphics) | "analysis of variance" | Ch. 7 Product and Process Comparisons, §7.4.2 (ANOVA) | `handbook/prc/section4/prc42.htm` |
| [ ] | `chapters/01-eda/index.qmd` (The Role of Graphics) | "least squares regression" | Ch. 4 Process Modeling landing page | `handbook/pmd/pmd.htm` |
| [ ] | `chapters/01-eda/index.qmd` (An EDA/Graphics Example) | "Anscombe" | EDA bibliography entry for Anscombe | `handbook/eda/section4/eda43.htm` |
| [ ] | `chapters/01-eda/index.qmd` (An EDA/Graphics Example) | "the following data set" | ANSCOMBE.DAT dataset | `handbook/datasets/ANSCOMBE.DAT` |
| [ ] | `chapters/01-eda/index.qmd` (An EDA/Graphics Example, first callout) | "this case study's dataset" | ANSCOMBE.DAT dataset | `handbook/datasets/ANSCOMBE.DAT` |
| [ ] | `chapters/01-eda/index.qmd` (An EDA/Graphics Example, second callout) | "this case study's dataset" | ANSCOMBE.DAT dataset (data sets 2, 3, and 4) | `handbook/datasets/ANSCOMBE.DAT` |
| [ ] | `chapters/01-eda/index.qmd` (General Problem Categories, Control) | "Control Charts" | Ch. 6 Process or Product Monitoring and Control, §6.3 (Control Charts) | `handbook/pmc/section3/pmc3.htm` |
| [ ] | `chapters/01-eda/index.qmd` (General Problem Categories, Optimization) | "Least Squares Fitting" | Ch. 4 Process Modeling, §4.1.4.1 | `handbook/pmd/section1/pmd141.htm` |
| [ ] | `chapters/01-eda/index.qmd` (General Problem Categories, Regression) | "Least Squares Fitting" | Ch. 4 Process Modeling, §4.1.4.1 | `handbook/pmd/section1/pmd141.htm` |
| [ ] | `chapters/01-eda/index.qmd` (General Problem Categories, Time Series) | "ARIMA Models" | Ch. 6 Process or Product Monitoring and Control, §6.4 (ARIMA Models) | `handbook/pmc/section4/pmc4.htm` |
| [ ] | `chapters/01-eda/index.qmd` (General Problem Categories, Multivariate) | "Scatter Plot Matrix" | EDA graphical technique not yet migrated to this book | `handbook/eda/section3/scatterb.htm` |
| [ ] | `chapters/01-eda/index.qmd` (General Problem Categories, Multivariate) | "Conditioning Plot" | EDA graphical technique not yet migrated to this book | `handbook/eda/section3/scatterc.htm` |
| [ ] | `chapters/01-eda/index.qmd` (General Problem Categories, Multivariate) | "Principal Components" | Ch. 6 Process or Product Monitoring and Control, §6.5.5 (Principal Components) | `handbook/pmc/section5/pmc55.htm` |
| [ ] | `chapters/01-eda/index.qmd` (Underlying Assumptions) | "characterize and model the function" | Ch. 4 Process Modeling landing page | `handbook/pmd/pmd.htm` |
| [ ] | `chapters/01-eda/index.qmd` (Underlying Assumptions) | "residuals from the fitted model" | Ch. 4 Process Modeling, §4.4.4 (residuals) | `handbook/pmd/section4/pmd44.htm` |
| [ ] | `chapters/01-eda/index.qmd` (Techniques for Testing Assumptions) | "500 normal random numbers" | RANDN.DAT dataset | `handbook/datasets/RANDN.DAT` |
| [ ] | `chapters/01-eda/index.qmd` (Techniques for Testing Assumptions) | "the following example" | LEW.DAT dataset | `handbook/datasets/LEW.DAT` |
| [ ] | `chapters/01-eda/index.qmd` (Consequences of Non-Normality) | "airplane glass failure case study" | EDA Case Studies (Section 1.4), Airplane Glass Failure | `handbook/eda/section4/eda429.htm` |
| [ ] | `chapters/01-eda/index.qmd` (Consequences of Non-Normality) | "uniform random numbers case study" | EDA Case Studies (Section 1.4), Uniform Random Numbers | `handbook/eda/section4/eda422.htm` |
| [ ] | `chapters/01-eda/index.qmd` (What is EDA?) | "Tukey's *Exploratory Data Analysis* (1977)" | EDA bibliography entry for Tukey | `handbook/eda/section4/eda43.htm#Tukey` |
| [ ] | `chapters/01-eda/index.qmd` (What is EDA?) | "Mosteller and Tukey's *Data Analysis and Regression* (1977)" | EDA bibliography entry for Mosteller and Tukey | `handbook/eda/section4/eda43.htm#Mosteller` |
| [ ] | `chapters/01-eda/index.qmd` (What is EDA?) | "Hoaglin's *Interactive Data Analysis* (1977)" | EDA bibliography entry for Hoaglin (Mcneil) | `handbook/eda/section4/eda43.htm#Mcneil` |
| [ ] | `chapters/01-eda/index.qmd` (What is EDA?) | "Velleman and Hoaglin's *The ABC's of EDA* (1981)" | EDA bibliography entry for Velleman and Hoaglin | `handbook/eda/section4/eda43.htm#Velleman` |
| [ ] | `chapters/01-eda/distributions/estimating-distribution-parameters.qmd` (Least Squares) | "Non-linear least squares" | Ch. 4 Process Modeling, §4.1.4.2 (Non-linear Least Squares) | `handbook/pmd/section1/pmd142.htm` |
| [ ] | `chapters/01-eda/distributions/estimating-distribution-parameters.qmd` (Other Graphical Methods) | "hazard plot" | Ch. 8 Assessing Product Reliability, §8.2.2.2 (Hazard Plots) | `handbook/apr/section2/apr222.htm` |
| [ ] | `chapters/01-eda/distributions/related-distributions.qmd` (Hazard Function) | "Johnson, Kotz, and Balakrishnan" | EDA bibliography entry for Johnson, Kotz, and Balakrishnan | `handbook/eda/section4/eda43.htm#Johnson` |
| [ ] | `chapters/01-eda/distributions/related-distributions.qmd` (Cumulative Hazard Function) | "Johnson, Kotz, and Balakrishnan" | EDA bibliography entry for Johnson, Kotz, and Balakrishnan | `handbook/eda/section4/eda43.htm#Johnson` |
| [ ] | `chapters/01-eda/distributions/cauchy-distribution.qmd` (Parameter Estimation) | "Johnson, Kotz, and Balakrishnan" | EDA bibliography entry for Johnson, Kotz, and Balakrishnan | `handbook/eda/section4/eda43.htm` |
| [ ] | `chapters/01-eda/distributions/t-distribution.qmd` (Cumulative Distribution Function) | "Evans, Hastings, and Peacock" | EDA bibliography entry for Evans, Hastings, and Peacock | `handbook/eda/section4/eda43.htm#EVANS` |
| [ ] | `chapters/01-eda/distributions/exponential-distribution.qmd` (Parameter Estimation) | "Johnson, Kotz, and Balakrishnan" | EDA bibliography entry for Johnson, Kotz, and Balakrishnan | `handbook/eda/section4/eda43.htm#Johnson` |
| [ ] | `chapters/01-eda/distributions/weibull-distribution.qmd` (Parameter Estimation) | reliability chapter reference for Weibull maximum likelihood estimation | Ch. 8 Assessing Product Reliability | `handbook/apr/` (chapter not yet migrated) |
| [ ] | `chapters/01-eda/distributions/weibull-distribution.qmd` (Parameter Estimation) | "Johnson, Kotz, and Balakrishnan" | EDA bibliography entry for Johnson, Kotz, and Balakrishnan | `handbook/eda/section4/eda43.htm` |
| [ ] | `chapters/01-eda/distributions/weibull-distribution.qmd` (Comments) | reliability chapter reference for Weibull failure-time modeling | Ch. 8 Assessing Product Reliability | `handbook/apr/` (chapter not yet migrated) |
| [ ] | `chapters/01-eda/distributions/lognormal-distribution.qmd` (Probability Density Function) | "Evans, Hastings, and Peacock" | EDA bibliography entry for Evans, Hastings, and Peacock | `handbook/eda/section4/eda43.htm` |
| [ ] | `chapters/01-eda/distributions/lognormal-distribution.qmd` (Comments) | reliability chapter reference for lognormal failure-time modeling | Ch. 8 Assessing Product Reliability | `handbook/apr/` (chapter not yet migrated) |
| [ ] | `chapters/01-eda/distributions/fatigue-life-distribution.qmd` (Parameter Estimation) | reliability chapter reference for Birnbaum-Saunders maximum likelihood estimation | Ch. 8 Assessing Product Reliability | `handbook/apr/` (chapter not yet migrated) |
| [ ] | `chapters/01-eda/distributions/fatigue-life-distribution.qmd` (Comments) | reliability chapter reference for Birnbaum-Saunders failure-time modeling | Ch. 8 Assessing Product Reliability | `handbook/apr/` (chapter not yet migrated) |
| [ ] | `chapters/01-eda/distributions/power-normal-distribution.qmd` (Common Statistics) | Nelson reference for mean/median/mode/standard deviation of the power normal distribution | EDA bibliography entry for Nelson | `handbook/eda/section4/eda43.htm#Nelson2` |
| [ ] | `chapters/01-eda/distributions/power-lognormal-distribution.qmd` (Common Statistics) | Nelson reference (same as power normal) | EDA bibliography entry for Nelson | `handbook/eda/section4/eda43.htm#Nelson2` |
| [ ] | `chapters/01-eda/distributions/power-lognormal-distribution.qmd` (Parameter Estimation) | Nelson reference for maximum likelihood estimation | EDA bibliography entry for Nelson | `handbook/eda/section4/eda43.htm#Nelson2` |
| [ ] | `chapters/01-eda/distributions/beta-distribution.qmd` (Parameter Estimation) | "Chapter 14 of Bury" | EDA bibliography entry for Bury | `handbook/eda/section4/eda43.htm` |
