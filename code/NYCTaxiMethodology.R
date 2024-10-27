
#### NYC Taxi Filtering/Methodology Code

## Reading/Filtering the Data: -----------------------------------------------------------------------
library(readr)
taxi <- read.csv("/Users/weiran/MultiProject/final/2023NYC_FHV.csv")
taxi <- taxi[, !names(taxi) %in% c("Unnamed..0", "access_a_ride_flag", "snow", "wpgt", "coco", "tsun")]
taxi <- taxi[ , colSums(is.na(taxi)) == 0]
taxi$tip_percentage <- (taxi$tips / taxi$base_passenger_fare) * 100


##PCA Analysis based on Period of Day: ----------------------------------------------------------------
taxi_num <- c('trip_miles', 'trip_time', 'base_passenger_fare', 'tolls', 'bcf', 
              'sales_tax', 'congestion_surcharge', 'airport_fee', 
              'driver_pay', 'temp', 'rhum', 'prcp', 'wdir', 'wspd')
              
# Subset the data by time period
morning_data <- subset(taxi, PeriodOfDay == "Morning")
noon_data <- subset(taxi, PeriodOfDay == "Noon")
evening_data <- subset(taxi, PeriodOfDay == "Evening")

# Remove constant columns from each subset
pca_morning <- prcomp(morning_data[, taxi_num], scale. = TRUE)
pca_noon <- prcomp(noon_data[, taxi_num], scale. = TRUE)
pca_evening <- prcomp(evening_data[, taxi_num], scale. = TRUE)

# Visualizing Scree Plots for each time period
screeplot(pca_morning, type = 'lines', main = "Morning PCA")
screeplot(pca_noon, type = 'lines', main = "Midday PCA")
screeplot(pca_evening, type = 'lines', main = "Evening PCA")

# Add bar plots to show variance explained
barplot(pca_morning$sdev^2 / sum(pca_morning$sdev^2), main = "Morning PCA Variance")
barplot(pca_noon$sdev^2 / sum(pca_noon$sdev^2), main = "Midday PCA Variance")
barplot(pca_evening$sdev^2 / sum(pca_evening$sdev^2), main = "Evening PCA Variance")

# Plot for Morning PCA with variance explained
var_explained <- pca_morning$sdev^2 / sum(pca_morning$sdev^2) * 100
plot(var_explained, type = "b", 
     main = "Scree Plot for Morning PCA with Variance Explained", 
     xlab = "Principal Components", 
     ylab = "Percentage of Variance Explained", 
     ylim = c(0, max(var_explained) + 5))  
text(1:length(var_explained), var_explained, 
     labels = round(var_explained, 1), 
     pos = 3, cex = 0.8)

# Plot for Noon PCA with variance explained
var_explained2 <- pca_noon$sdev^2 / sum(pca_noon$sdev^2) * 100
plot(var_explained2, type = "b", 
     main = "Scree Plot for Noon PCA with Variance Explained", 
     xlab = "Principal Components", 
     ylab = "Percentage of Variance Explained", 
     ylim = c(0, max(var_explained2) + 5))  
text(1:length(var_explained2), var_explained2, 
     labels = round(var_explained2, 1), 
     pos = 3, cex = 0.8)

# Plot for Evening PCA with variance explained
var_explained3 <- pca_evening$sdev^2 / sum(pca_evening$sdev^2) * 100
plot(var_explained3, type = "b", 
     main = "Scree Plot for Evening PCA with Variance Explained", 
     xlab = "Principal Components", 
     ylab = "Percentage of Variance Explained", 
     ylim = c(0, max(var_explained3) + 5))  
text(1:length(var_explained3), var_explained3, 
     labels = round(var_explained3, 1), 
     pos = 3, cex = 0.8)

# Morning Biplot
biplot(pca_morning, scale = 0, cex = 0.6, 
       col = c("black", "red"), 
       xlabs = rep("•", nrow(pca_morning$x)),  
       xlim = c(-5, 5),  
       ylim = c(-5, 5))  

# Noon Biplot
biplot(pca_noon, scale = 0, cex = 0.6, 
       col = c("black", "red"), 
       xlabs = rep("•", nrow(pca_noon$x)),  
       xlim = c(-4, 4),  
       ylim = c(-4, 4))  

# Evening Biplot
biplot(pca_evening, scale = 0, cex = 0.6, 
       col = c("black", "red"), 
       xlabs = rep("•", nrow(pca_evening$x)),  
       xlim = c(-4, 4), 
       ylim = c(-4, 4))

# Morning Barplot
par(mfrow = c(1, 3), mar = c(10, 4, 4, 2) + 0.1)  
for (i in 1:3) {
  barplot(pca_morning$rotation[, i], 
          las = 2,                
          cex.names = 0.7,        
          main = paste("Morning PC", i, "Loadings"), 
          ylab = "Loadings", 
          xlab = "Variables")
}

# Noon Barplot
par(mfrow = c(1, 3), mar = c(10, 4, 4, 2) + 0.1)  
for (i in 1:3) {
  barplot(pca_noon$rotation[, i], 
          las = 2,                
          cex.names = 0.7,        
          main = paste("Noon PC", i, "Loadings"), 
          ylab = "Loadings", 
          xlab = "Variables")
}

# Evening Biplot
par(mfrow = c(1, 3), mar = c(10, 4, 4, 2) + 0.1)  
for (i in 1:3) {
  barplot(pca_evening$rotation[, i], 
          las = 2,                
          cex.names = 0.7,        
          main = paste("Evening PC", i, "Loadings"), 
          ylab = "Loadings", 
          xlab = "Variables")
}


## Full PCA Analysis (without time aspect):---------------------------------------------------------
taxi_num <- taxi[, c('trip_miles', 'trip_time', 'base_passenger_fare', 'tolls', 'bcf', 
              'sales_tax', 'congestion_surcharge', 'airport_fee', 
              'driver_pay', 'temp', 'rhum', 'prcp', 'wdir', 'wspd')]
pca_full <- prcomp(taxi_num, scale. = TRUE)

# Visualizing Scree Plot
var_explained <- pca_full$sdev^2 / sum(pca_full$sdev^2) * 100
plot(var_explained, type = "b", 
     main = "Scree Plot for Full PCA with Variance Explained", 
     xlab = "Principal Components", 
     ylab = "Percentage of Variance Explained", 
     ylim = c(0, max(var_explained) + 5))  
text(1:length(var_explained), var_explained, 
     labels = round(var_explained, 1), 
     pos = 3, cex = 0.8)

#  Full Biplot
biplot(pca_full, scale = 0, cex = 0.6, 
       col = c("black", "red"), 
       xlabs = rep("•", nrow(pca_full$x)),  
       xlim = c(-5, 5),  
       ylim = c(-5, 5))  

#Full Barplot
par(mfrow = c(1, 3), mar = c(10, 4, 4, 2) + 0.1)  
for (i in 1:3) {
  barplot(pca_full$rotation[, i], 
          las = 2,                
          cex.names = 0.7,        
          main = paste("Full PC", i, "Loadings"), 
          ylab = "Loadings", 
          xlab = "Variables")
}  


## Principal Componenet Regression:-----------------------------------------------------------------

# Extract the first two principal components
pca_components <- pca_full$x[, 1:2]  
regression_data <- data.frame(tip_percentage = taxi$tip_percentage, 
                              PC1 = pca_components[, 1], 
                              PC2 = pca_components[, 2])

tip_lm <- lm(tip_percentage ~ PC1 + PC2, data = regression_data)
summary(tip_lm)

par(mfrow = c(2, 2))
plot(tip_lm)


## CCA: --------------------------------------------------------------------------------------------
# Load necessary library
library(CCA)

# Define weather variables and trip features
weather_vars <- taxi[, c("temp", "dwpt", "wspd", "rhum", "prcp", "wdir", "pres")]
trip_vars <- taxi[, c("trip_time", "trip_miles", "base_passenger_fare", "tolls", "tip_percentage")]

# Separate tipping-related and weather-related data into two matrices
weather_matrix <- as.matrix(weather_vars)
trip_matrix <- as.matrix(trip_vars)
cca_result <- cc(weather_matrix, trip_matrix)
summary(cca_result)

# Correlation Matrix
summary(cca_result)
correl = matcor(weather_vars, trip_vars)
img.matcor(correl,type = 2)

# CCA Calculations
library(CCP)
p.asym(rho, 6939, 7, 4, tstat = "Wilks")
(rho <- cca_result$cor)
a <- cca_result$xcoef[,1:2]; u <- weather_matrix%*%a
b <- cca_result$ycoef[,1:2]; v <- trip_matrix%*%b
round(cor(weather_matrix,u), 2)
round(cor(trip_matrix,u), 2)

#CCA Barplot
par(mfrow=c(2,2))
for(i in 1:2){ barplot(cca_result$scores$corr.X.xscores[,i], las=2)}
for(i in 1:2){ barplot(cca_result$scores$corr.Y.yscores[,i], las=2)}

### Mapping-----------------------------------------------------------------------------------------
library(ggmap)
library(ggplot2)
library(gridExtra)

#register_google(key = "your_google_api_key") <- insert own google api

# Get the map for NYC (zoom and maptype can be adjusted)
nyc_map <- get_map(location = c(lon = -73.9851, lat = 40.7580), zoom = 10, maptype = "roadmap")
geolocation$PeriodOfDay <- factor(geolocation$PeriodOfDay, levels = c("Morning", "Noon", "Evening"))

## Hexbin Plot for Pickup
ggmap(nyc_map) +
  stat_bin_hex(data = geolocation, aes(x = puloc_lng, y = puloc_lat, fill = ..count..), bins = 50, alpha = 0.8) + 
  scale_fill_viridis_c(option = "plasma", name = "Pickup Count") +  # Softer color palette for pastel-like effect
  facet_wrap(~ PeriodOfDay) +  # Create a separate panel for each time period
  ggtitle("Hexbin Pickup Locations by Time of Day") +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    strip.text = element_text(size = 14),  # Style the facet labels
    legend.position = "right",  # Move the legend to the right
    panel.grid = element_blank()  # Remove background grid
  )

# Hexbin Plot for Drop off
ggmap(nyc_map) +
  stat_bin_hex(data = geolocation, aes(x = doloc_lng, y = doloc_lat, fill = ..count..), bins = 50, alpha = 0.8) + 
  scale_fill_viridis_c(option = "C", name = "Pickup Count") +  # Use viridis color scale for better contrast
  facet_wrap(~ PeriodOfDay) +  # Create a separate panel for each time period
  ggtitle("Hexbin Dropoff Locations by Time of Day") +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    strip.text = element_text(size = 14),  # Style the facet labels
    legend.position = "right",  # Move the legend to the right
    panel.grid = element_blank()  # Remove background grid
  )



