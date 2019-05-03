# Specialized Foraging and Social Preferences within Dolphin Communities
### Biological question

The central research question my project addressed: How does dolphin relatedness and foraging behavioral traits establish social structure?

### Context (introduction)

This study was done to see how social structures could be determined based on foraging approaches. By analyzing social animals, such as bottle nose dolphins, monitoring different foraging tactics and cooperation with local fishermen could quantify the development of social status within their community. By observing different foraging techniques and the social hierarchy within each group of dolphins, the status of each individual and their role within the group could be determined based on whether they cooperated not only one another, but with a different species from their own entirely.

### Methods

##### The source of the data:

The original authors of this study started by creating a photo-identification system with an identification number, the sampling period, presence or absence of calves, behavioral state, and cooperative foraging behavior. Once groups were identifiable, they were assigned to behavioral contexts: cooperative foraging, non-cooperative foraging, and non-foraging. Non-foraging included behavioral states of travelling, socializing, and resting as well as all behavior. They calculated home range overlap values and frequency of participation. 

The data consisted of four .csv files:
 1. Matrix of photo-identification protocols - 17.09 Kb
 2. Matrix with home range overlap values - 4.996 Kb
 3. Matrix of covariables of 52 photo-identified individuals - 1.157 Kb
 4. Matrix with pairwise genetic relatedness - 1.261 Kb  

The authors also provided supplementary material with information on the lab and stat methods applied to this study.

Initially there did not seem to be any issues with the data, but upon attempting to import it, formatting issues became an apparent problem. 

Machado, A. M. S., M. Cantor, A. P. B. Costa, B. P. H. Righetti, C. Bezamat, J. V. S. Valle-Pereira, P. C. Simões-Lopes, P. V. Castilho, and F. G. Daura-Jorge. 2019. "Homophily around Specialized Foraging Underlies Dolphin Social Preferences."  _Biology Letters_ 15, no. 4. 
[https://doi.org/10.1098/rsbl.2018.0909](https://doi.org/10.1098/rsbl.2018.0909)

Machado, A. M. S., M. Cantor, A. P. B. Costa, B. P. H. Righetti, C. Bezamat, J. V. S. Valle-Pereira, P. C. Simões-Lopes, P. V. Castilho, and F. G. Daura-Jorge. 2019. “Supplementary Lab and Stat Methods from Homophily Around Specialized Foraging Underlies Dolphin Social Preferences”. The Royal Society. [https://doi.org/10.6084/m9.figshare.7893047.v1](https://doi.org/10.6084/m9.figshare.7893047.v1)

S., Alexandre Marcel, Machado, Cantor, Ana Paula B., Barbara P. H., Righetti, Jo, and Pedro V. 2019. "Data From: Homophily around Specialized Foraging Underlies Dolphin Social Preferences." Dryad. [https://doi.org/10.5061/dryad.20vd145](https://doi.org/10.5061/dryad.20vd145)

##### What the original authors did with the data:

They used this data coupled with genetic samples to test for social preferences, social division, and assortativity around the simple-ratio indexes (SRI) of all behaviors, cooperative foraging, non-cooperative foraging, and non-foraging. After evaluating a randomized distribution of regression coefficients they used generalized affiliation incices (GAI) to adjust the devience residuals.

Once all results were analyzed, the original authors came to the conclusion to reject their null hypothesis that dolphins associate randomly in circumstances other than cooperative foraging. Their key finding was that even in situations outside of cooperative foraging, dolphins have a strong affiliation for peers who are similar.

![Expected_Results](https://ibb.co/cFbck52 "Expected_Results")

##### What  _YOU_  did with the data and how you did it:

Verbally describe what your approach was and how you achieved it. You don't need to include code here; rather, the goal is to give the reader an idea of what your code does and why and how it does it. Don't give the results here, though. Throughout this section, strive to be crystal clear about which things the original authors did and which things you did. Saying "this study" is ambiguous in that regard, so make it clear.

Initially, I intended to attempt to reproduce the results that Machado et al came to, but discovered very quickly that I could not properly manipulate the mrqap function the authors discussed. The closest I ended up with was: 
```
SRI_AB <- mrqap.dsp(SRI ~ SRI$Freq_Int + SRI$HR, 
randomisations = 20000, intercept = FALSE, 
test.statistic = "beta")
```
But this kept leading to the same error of:
```
Error in x[, , i] <- as.matrix(formula[[x_names[i]]]) : 
  incorrect number of subscripts
  ```
  I attempted to correct this for a few hours and determined that I was better off trying to use a different statistical test to compare my results with theirs. I used corr.test to find correlations between the IDs, frequency intervals, and home range values of dolphins in each behavioral context. Since the authors found no correlation between social association and genetic relatedness, I chose not to use the data on genetic relatedness to simplify the process. (Machado et al. 2019, 11)
I thought about designing a function to  streamline developing tables for each SRI, but the number of inputs varied between SRIs causing it to be more complex than creating individualized matrices. Instead, once the matrices were created, I created a function for corr.test to return confidence intervals, and probability for each matrix


### Results and conclusions

I found that confidence intervals between home range overlap values and frequency intervals were highest in the cooperative foraging behavior, and equal for all other behaviors. The confidence intervals overall were very close in each instance. Confidence intervals between IDs and frequency intervals, and IDs and home range overlap values were also very similar. Although I used a much smaller sample size by not randomizing the data 20,000 times, this seems to correspond with the rejection of the null hypothesis that dolphins associate randomly in situations other than cooperative foraging. They most often grouped with others with similar frequency intervals and similar home range values.

![AB_Matrix](https://ibb.co/m6kHqds "AB_Matrix")
![CF_Matrix](https://ibb.co/MNG3YbC "CF_Matrix")
![NCF_Matrix](https://ibb.co/BcWWPPh "NCF_Matrix")
![NF_Matrix](https://ibb.co/3dQDWfJ "NF_Matrix")
