---
title: Methodology
layout: default
--- 

# Methodology

## 1. Principal Componenet Analysis (PCA) 

The dataset contains numerous quantitative variables, making it well-suited for dimension reduction techniques such as PCA. PCA was applied to reduce the dataset's dimensionality and identify key variables influencing ride behavior. Separate PCA analyses were conducted for the morning, noon, and evening time periods, focusing on variables such as trip duration, trip distance, fare, and weather measurements. This approach helps to explore the factors driving each principal component for different times of the day, providing valuable insights into the dynamics of ride-hailing behavior.

- **Screeplots**: 
  - Created three separate screeplots for the morning, noon, and evening
  - Interpret the amount of principal components to keep in the dataset
  
- **Biplots**:
  - Created three separate biplots for morning, noon, and evening
  - Interpet
 
 ## 2. Canonical Correlation Analysis (CCA)
To further explore the correlation between ride CCA was applied to examine the relationship between weather variables (e.g., temperature, humidity, wind speed) and trip characteristics (e.g., trip time, trip distance, fare). CCA is designed to explore relationships between two sets of variables. In this case, we aimed to identify any significant influence of weather on trip characteristics.

- **Canonical Matrix**: 
  - explore relationships between weather vairbales and trip characteristics

## 3. Maps for Pickup and Drop-off Locations
Hexbin maps were used to visualize the spatial distribution of pickup and drop-off locations across New York City for different times of the day (morning, noon, evening). Hexbin maps provide a clear, uncluttered visualization of dense spatial data. They allow for the identification of geographical hotspots by aggregating ride data into hexagonal bins, making it easier to see where ride demand is concentrated.

- **Map of Pickup anf Drop off Locations**: 
  - Created three separate screeplots for the morning, noon, and evening
  - Interpret the amount of principal components to keep in the dataset
    
- **Hexbin Map for Pickup and Drop-off Locations**: 
  - Created three separate screeplots for the morning, noon, and evening
  - Interpret the amount of principal components to keep in the dataset 
