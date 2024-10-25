---
title: Results
layout: default
--- 

# Results

In this section, we present the key results from the dimension reduction analysis and visualizations to understand the factors influencing tipping and FHV ride trends.

---
## 1. Principal Component Analysis (PCA)
Initially, three separate principal component analyses were conducted for different times of the day—morning, noon, and evening—excluding tipping variables. Since no significant differences were observed across the time periods, a combined principal component analysis was performed without considering time, while still excluding the tipping variables. This allowed for the regression of tips against the important principal components identified, leading to the following observations.

### a. Key Principal Components
To identify the most important principal components, a scree plot was first generated.

- **Visualization**:
<img src="images/FullScreeplot.png" alt="drawing" width="600"/>

- **Interpretation**:
 The scree plot shows that the first principal component accounts for 37.1% of the variance, while the second accounts for 11%. Based on the "elbow" in the plot, only the first two principal components need to be kept when performing principal component regression.


### b. Analyzing the Variables within the Principal Components
After selecting the first two principal components, the next step is to identify which variables play a significant role in these components. This can be examined through a biplot and bar plot, which highlight the contribution of each variable to the first two principal components.

- **Visualization**:
<img src="images/FullBiplot.png" alt="drawing" width="600"/>
 
 ![FullBarplot](images/FullBarplot.png)

- **Interpretation**:
The Barplot above clearly shows...


### c. Principal Component Regression
Since we found that the first two principal components explain,

- **Visualization**:
<img src="images/FullRegression.png" alt="drawing" width="600"/>
 
- **Interpretation**:

---
## 2. Canonical Correlation Analysis

### a. Visualizing Cross-Correlation 
The first two principal components consistently explain a significant portion of the variance (around 46-48%)
weather_vars <- taxi[, c("temp", "dwpt", "wspd", "rhum", "prcp", "wdir", "pres")]
trip_vars <- taxi[, c("trip_time", "trip_miles", "base_passenger_fare", "tolls", "tip_percentage")]

- **Visualization**:
<img src="images/CrossCorrelation.png" alt="drawing" width="600"/>

- **Interpretation**:
  The Screeplot above clearly shows... 


### b. Visualizing the Canonical Covariates
The first two principal components consistently explain a significant portion of the variance (around 46-48%)

- **Visualization**:
<img src="images/CCAbarplot.png" alt="drawing" width="600"/>

- **Interpretation**:
  The Screeplot above clearly shows... 


### c.Overall correlation Structure
The first two principal components consistently explain a significant portion of the variance (around 46-48%)

- **Visualization**:
<img src="images/CanonicalStructure.png" alt="drawing" width="600"/>

- **Interpretation**:
  The Screeplot above clearly shows... 

---
## 3. Visualizing Pickup/Dropoff Locations

### a. Pickup Location Trends
The first two principal components consistently explain a significant portion of the variance (around 46-48%)

- **Visualization**:
<img src="images/pickup.png" alt="drawing" width="600"/>

- **Interpretation**:
  The Screeplot above clearly shows... 


### b. Dropoff Location Trends
The first two principal components consistently explain a significant portion of the variance (around 46-48%)

- **Visualization**:
<img src="images/FullScreeplot.png" alt="drawing" width="600"/>

- **Interpretation**:
  The Screeplot above clearly shows...
---
