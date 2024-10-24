---
title: Methodology
layout: default
--- 

# Methodology

## 1. Principal Componenet Analysis (PCA) 

Given that the dataset contains numerous quantitative variables, a PCA was applied to reduce the dataset's dimensionality and identify key variables influencing ride behavior. Initially, separate PCA analyses were conducted for the morning, noon, and evening time periods, focusing on variables such as trip duration, trip distance, fare, and weather conditions, excluding tip percentage variable. It was thought that this approach would help explore the factors driving each principal component for different times of the day, providing valuable insights into the dynamics of ride-hailing behavior. However, after observing the visualizations, it is found that there is not much of a difference between the PCA anlyses in regards to time. Instead, a PCA was performed on the dataset disregarding time, but still exlcuding the tip percentage variable to observe the dynamics.

- **PCA Visualizations**: 
  - *Screeplot*: Utilized to determine how many principal components to preserve
  - *Biplot*: Shows the variables that are important to the principal components
  - *Barplot*: Shows which variables principal components are made up of
  
- **Principal Component Regression**:
  - Performed a Principal Component Regression on the first two principal components
  - Plotted the diagnostic graphs for the regression
 
 ## 2. Canonical Correlation Analysis (CCA)
To further explore the cross-correlation between ride characteristics, and weather variables, CCA was applied to examine those relationships. Specifically, we explored seven weather conditions (temperature, dew point, wind speed, humidity, precipitation, wind direction, air pressure ) and five trip characteristics (trip duration, trip distance, base passenger fare, tolls, tip percentage). We aimed to identify any significant influence of weather on trip characteristics.

- **Correlation Matrix**: 
  - Explored the relationships between weather vairbales and trip characteristics, and the cross correlation as well
    
- **Visualizing Canonical Covariates**: 
  - Explored what variables correlated most with u1 and v1

- **Canonical Correlation Structure**:
  - visualized the entire sturcture to find what variables were most related

## 3. Maps for Pickup and Drop-off Locations
Hexbin maps were used to visualize the spatial distribution of pickup and drop-off locations across New York City for different times of the day (morning, noon, evening). Hexbin maps provide a clear, uncluttered visualization of dense spatial data. They allow for the identification of geographical hotspots by aggregating ride data into hexagonal bins, making it easier to see where ride demand is concentrated.

- **Map of Pickup anf Drop off Locations**: 
  - Created three separate screeplots for the morning, noon, and evening
  - Interpret the amount of principal components to keep in the dataset
    
- **Hexbin Map for Pickup and Drop-off Locations**: 
  - Created three separate screeplots for the morning, noon, and evening
  - Interpret the amount of principal components to keep in the dataset 
