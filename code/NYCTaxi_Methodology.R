
## NYC Taxi Methodology Code
library(ggplot2)
library(reshape2)
library(ggcorrplot)
taxi_num <- c('trip_miles', 'trip_time', 'base_passenger_fare', 'tolls', 'bcf', 'sales_tax', 'congestion_surcharge', 'airport_fee', 'tips', 'driver_pay', 'temp', 'rhum', 'prcp', 'wdir', 'wspd')
data_pca <- taxi[, taxi_num]
pca_result <- prcomp(data_pca, center = TRUE, scale. = TRUE)

scree_data <- data.frame(PC = 1:length(pca_result$sdev), Variance = (pca_result$sdev)^2 / sum((pca_result$sdev)^2))
ggplot(scree_data, aes(x = PC, y = Variance)) + 
  geom_point() + geom_line() +
  ggtitle("Scree Plot: Variance Explained by Principal Components") +
  xlab("Principal Component") + ylab("Proportion of Variance Explained")

do pca wihtout tipping variable, and look at clusters in the pca analysis, like bar plots screeplots or whatever
mds: patterns in tipping behavior or perhaps geogrpahical context
cca: weather, duration

instead of doing one pca do it for three different times; incorporate tips and then do pca(see the different clusters)
three seprate pca for three different timestamp()
create three different maps based on time, using google maps

#Reading in the Data: -------------------------------------------------------
library(readr)
taxi <- read.csv("/Users/weiran/Downloads/2023_NYC_High_Volume_FHV_1015-1115_meteo_cleaned.csv")
taxi <- taxi[ , -c(1, 23, 28, 31, 33, 34)]
taxi <- taxi[ , colSums(is.na(taxi)) == 0]
taxi$tip_percentage <- (taxi$tips / taxi$base_passenger_fare) * 100


##PCA Analysis based on Period of Day: ----------------------------------------------------------------
taxi_num <- c('trip_miles', 'trip_time', 'base_passenger_fare', 'tolls', 'bcf', 
              'sales_tax', 'congestion_surcharge', 'airport_fee', 'tips', 
              'driver_pay', 'temp', 'rhum', 'prcp', 'wdir', 'wspd')

# Subset the data by time period
morning_data <- subset(taxi, PeriodOfDay == "Morning")
noon_data <- subset(taxi, PeriodOfDay == "Noon")
evening_data <- subset(taxi, PeriodOfDay == "Evening")


# Remove constant columns from each subset
pca_morning <- prcomp(morning_data[, taxi_num], scale. = TRUE)
pca_midday <- prcomp(midday_data[, taxi_num], scale. = TRUE)
pca_evening <- prcomp(evening_data[, taxi_num], scale. = TRUE)

# Visualizing Scree Plots for each time period
screeplot(pca_morning, type = 'lines', main = "Morning PCA")
screeplot(pca_midday, type = 'lines', main = "Midday PCA")
screeplot(pca_evening, type = 'lines', main = "Evening PCA")

# Add bar plots to show variance explained
barplot(pca_morning$sdev^2 / sum(pca_morning$sdev^2), main = "Morning PCA Variance")
barplot(pca_midday$sdev^2 / sum(pca_midday$sdev^2), main = "Midday PCA Variance")
barplot(pca_evening$sdev^2 / sum(pca_evening$sdev^2), main = "Evening PCA Variance")




# Adding percentage of variance explained to the scree plot
var_explained <- pca_morning$sdev^2 / sum(pca_morning$sdev^2) * 100

# Plot for Morning PCA with variance explained
par(mfrow = c(1, 1))  # Single plot again
plot(var_explained, type = "b", 
     main = "Scree Plot for Morning PCA with Variance Explained", 
     xlab = "Principal Components", 
     ylab = "Percentage of Variance Explained", 
     ylim = c(0, max(var_explained)))

# Add text labels for the variance percentages
var_explained <- pca_morning$sdev^2 / sum(pca_morning$sdev^2) * 100

text(1:length(var_explained), var_explained, 
     labels = round(var_explained, 1), 
     pos = 3, cex = 0.8)

# Repeat for other times (Midday and Evening)
var_explained_midday <- pca_midday$sdev^2 / sum(pca_midday$sdev^2) * 100
plot(var_explained_midday, type = "b", 
     main = "Scree Plot for Midday PCA with Variance Explained", 
     xlab = "Principal Components", 
     ylab = "Percentage of Variance Explained", 
     ylim = c(0, max(var_explained_midday)))

text(1:length(var_explained_midday), var_explained_midday, 
     labels = round(var_explained_midday, 1), 
     pos = 3, cex = 0.8)

var_explained_evening <- pca_evening$sdev^2 / sum(pca_evening$sdev^2) * 100
plot(var_explained_evening, type = "b", 
     main = "Scree Plot for Evening PCA with Variance Explained", 
     xlab = "Principal Components", 
     ylab = "Percentage of Variance Explained", 
     ylim = c(0, max(var_explained_evening)))

text(1:length(var_explained_evening), var_explained_evening, 
     labels = round(var_explained_evening, 1), 
     pos = 3, cex = 0.8)
