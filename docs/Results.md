---
title: Results
layout: default
--- 

# Results

In this section, we present the key results from the dimension reduction analysis and visualizations to understand the factors influencing tipping and FHV ride trends.

---
## 1. Principal Component Analysis (PCA)

### a. The Important Principal Components
Principal component analysis was applied to reduce the dataset's dimensionality and identify key variables influencing tipping behavior. Initially, separate PCA analyses were conducted for the morning, noon, and evening time periods, focusing on variables such as trip duration, trip distance, fare, and weather conditions. However, we found from the this approach helps to explore the factors driving each principal component for different times of the day, providing valuable insights into the dynamics of ride-hailing behavior.

- **Visualization**:
<img src="images/FullScreeplot.png" alt="drawing" width="600"/>

- **Interpretation**:
From the screeplot, The first two principal components  explain a significant portion of the variance (around 46-48%)

### b. Analyzing the Variables within the Principal Components
We found that the first two principal components consistently explain a significant portion of the variance, but now we see weather variables are most correlated with the first principal component

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
