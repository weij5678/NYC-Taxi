---
title: Methodology
layout: default
--- 

## Methodology

### 1. Principal Component Analysis (PCA)
Principal Component Analysis (PCA) was used to reduce the dimensionality of the dataset and to identify key variables driving ride behavior. Separate PCA analyses were conducted for morning, noon, and evening time periods, using variables such as trip time, trip miles, fare, and weather conditions.

- **Why PCA was chosen**:  
  PCA is an effective tool for summarizing multivariate data by identifying the most important components, allowing us to focus on the key drivers of variation in ride behavior. It helped to reveal underlying patterns in the trip data by condensing the most influential variables.
  
- **Application of PCA**:  
  The PCA revealed that the first principal component (PC1) explained around 35-37% of the variance, driven largely by trip-related factors like trip miles, trip time, and fare. The second principal component (PC2), accounting for 10-12% of the variance, was influenced more by weather conditions such as wind speed and humidity. The exclusion of tipping data allowed for a focused analysis on ride characteristics and environmental factors.

### 2. Scree Plots and Barplots of PCA Loadings
Scree plots and barplots were used to visualize the results of the PCA and to interpret which variables were the most influential in explaining the variance in the dataset.

- **Why these visualizations were chosen**:  
  Scree plots help determine how many principal components should be retained for meaningful analysis, while barplots visualize the loadings, making it easier to interpret which variables contribute most to each principal component.

- **Application**:  
  Scree plots showed that the first two principal components captured most of the variance in the data. Barplots highlighted that trip characteristics such as trip miles, fare, and trip time had the largest influence, while weather variables had a more marginal impact on ride behavior.

### 3. Hexbin Maps for Pickup and Drop-off Locations
Hexbin maps were used to visualize the spatial distribution of pickup and drop-off locations across New York City for different times of the day (morning, noon, evening).

- **Why hexbin maps were chosen**:  
  Hexbin maps provide a clear, uncluttered visualization of dense spatial data. They allow for the identification of geographical hotspots by aggregating ride data into hexagonal bins, making it easier to see where ride demand is concentrated.

- **Application of Hexbin Maps**:  
  The maps revealed that morning pickups were concentrated in business districts in central Manhattan, reflecting commuting patterns. Evening rides were more dispersed across residential areas in Brooklyn and Queens. Drop-offs followed similar patterns but were more evenly distributed during the evening as riders returned to suburban areas.

### 4. Canonical Correlation Analysis (CCA)
CCA was applied to examine the relationship between weather variables (e.g., temperature, humidity, wind speed) and trip characteristics (e.g., trip time, trip distance, fare).

- **Why CCA was chosen**:  
  CCA is designed to explore relationships between two sets of variables. In this case, we aimed to identify any significant influence of weather on trip characteristics.

- **Application of CCA**:  
  The results showed weak cross-correlations between weather and trip characteristics, suggesting that weather conditions did not have a strong impact on ride behavior during the study period. This indicates that while weather may affect certain trips, its overall influence on ride characteristics such as distance and fare was minimal.

