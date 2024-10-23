# Data Description
## Link Data File here:

## Background Information
This project utilizes from high-volume for-hire vehicle (FHV) or taxi trip data in New York City from **October 15, 2023, to November 15, 2023**, focusing on trips that occurred at three specific times: **8:00 AM(Morning, 12:00 PM (Midday), and 6:00 PM(evening)**. These time windows were selected to capture key parts of the day (morning, midday, evening) while reducing the overall dataset size. Since the full dataset includes millions of trips, limiting the data to these specific times helps ensure a manageable dataset for analysis. In addition, the dataset provides detailed information on pickup locations, timestamps, and various meteorological conditions during each trip. The goal is to explore potential relationships between weather patterns and ride-hailing demand across NYC, identifying spatial and temporal clusters that may help optimize taxi operations.

The dataset contains **6,939 observations**, each representing a one-minute interval of ride-hiring activity at these selected times. Each trip is linked to weather data based on the pickup location's latitude and longitude, retrieved through the Meteostat API. Each case is linked to meteorological data based on the trip's pickup location, which was geocoded using Google Maps API. Weather conditions, including temperature, wind speed, and precipitation, were sourced from the Meteostat API. 

## Key Steps for Data Cleaning and Pre-Processing

1. **Geolocation Lookup**:  
   Pickup location IDs were mapped to geographic coordinates (latitude, longitude) using the NYC Taxi Zone dataset and Google Maps Geocoding API.
   
2. **Merging Weather Data**:  
   Weather data (temperature, wind speed, precipitation) was merged based on the geolocated pickup location and time using the Meteostat dataset.

3. **Handling Missing Data**:  
   Variables such as `snow`, `wpgt`, and `tsun` had many missing values. These were removed during replaced with appropriate default values (e.g., `0` for snow in cases without snowfall).

4. **Time of Day Labeling**:  
   To make for a more meanignful analysis, a new categorical variable `PeriodOfDay` (Morning, Midday, Evening) derived from the `pickup_datetime` was added to the dataset to better analyze temporal patterns.

5. **Filtering Data to Specific Time Points**:  
   Given the large size of the original dataset, which includes trips recorded every minute throughout the day, the analysis focuses on three specific time points—**8:00 AM, 12:00 PM, and 6:00 PM**. These times were   selected to represent key periods of the day when ride-hailing activity is likely to vary based on weather and other factors. By limiting the dataset to these specific times, we maintain a manageable dataset size while still capturing meaningful patterns in FHV demand.


## Variable Descriptions

| Variable Name          | Variable Label                                           | Valid Range/Code                                | Source                          |
|------------------------|----------------------------------------------------------|-------------------------------------------------|---------------------------------|
| `hvfhs_license_num`     | License number of the FHV service                       | Text                                             | NYC FHV Data                   |
| `dispatching_base_num`  | Dispatch base number of the FHV                         | Text                                             | NYC FHV Data                   |
| `request_datetime`      | Date and time when the FHV was requested                | Datetime format: `YYYY-MM-DD HH:MM:SS`           | NYC FHV Data                   |
| `pickup_datetime`       | Date and time when the trip began                       | Datetime format: `YYYY-MM-DD HH:MM:SS`           | NYC FHV Data                   |
| `dropoff_datetime`      | Date and time when the trip ended                       | Datetime format: `YYYY-MM-DD HH:MM:SS`           | NYC FHV Data                   |
| `pulocationid`          | Pickup location ID                                      | Integer, range: `1` to `263`                     | NYC FHV Data                   |
| `dolocationid`          | Dropoff location ID                                     | Integer, range: `1` to `263`                     | NYC FHV Data                   |
| `trip_miles`            | Distance covered during the trip (miles)                | Decimal, range: `0` to `100`                     | NYC FHV Data                   |
| `trip_time`             | Duration of the trip (seconds)                          | Integer, range: `0` to `5000`                    | NYC FHV Data                   |
| `base_passenger_fare`   | Fare paid by the passenger (USD)                        | Decimal, range: `0` to `500`                     | NYC FHV Data                   |
| `tolls`                 | Tolls charged during the trip (USD)                     | Decimal, range: `0` to `100`                     | NYC FHV Data                   |
| `bcf`                   | Black car fund fee                                      | Decimal, range: `0` to `10`                      | NYC FHV Data                   |
| `sales_tax`             | Sales tax applied to the trip (USD)                     | Decimal, range: `0` to `50`                      | NYC FHV Data                   |
| `congestion_surcharge`  | Congestion surcharge applied to the trip (USD)          | Decimal, range: `0` to `5.75`                    | NYC FHV Data                   |
| `airport_fee`           | Fee for airport dropoffs (USD)                          | Decimal, range: `0` to `10`                      | NYC FHV Data                   |
| `tips`                  | Tips given by the passenger (USD)                       | Decimal, range: `0` to `100`                     | NYC FHV Data                   |
| `driver_pay`            | Pay received by the driver (USD)                        | Decimal, range: `0` to `1000`                    | NYC FHV Data                   |
| `shared_request_flag`   | Indicates if a shared ride was requested                | Categorical: `Yes`, `No`                         | NYC FHV Data                   |
| `shared_match_flag`     | Indicates if a shared ride match was found              | Categorical: `Yes`, `No`                         | NYC FHV Data                   |
| `wav_request_flag`      | Indicates if a wheelchair-accessible ride was requested | Categorical: `Yes`, `No`                         | NYC FHV Data                   |
| `wav_match_flag`        | Indicates if a wheelchair-accessible ride was matched   | Boolean: `True`, `False`                         | NYC FHV Data                   |
| `temp`                  | Temperature at pickup location (°C)                     | Decimal, range: `-10` to `35`                    | Meteostat API                  |
| `dwpt`                  | Dew point temperature at pickup location (°C)           | Decimal, range: `-10` to `35`                    | Meteostat API                  |
| `rhum`                  | Relative humidity at pickup location (%)                | Decimal, range: `0` to `100`                     | Meteostat API                  |
| `prcp`                  | Precipitation at pickup location (mm)                   | Decimal, range: `0` to `50`                      | Meteostat API                  |
| `wdir`                  | Wind direction at pickup location (degrees)             | Integer, range: `0` to `360`                     | Meteostat API                  |
| `wspd`                  | Wind speed at pickup location (km/h)                    | Decimal, range: `0` to `100`                     | Meteostat API                  |
| `pres`                  | Atmospheric pressure at pickup location (hPa)           | Decimal, range: `900` to `1050`                  | Meteostat API                  |
| `WeatherCondition`      | Textual description of weather condition                | Text: Clear, Cloudy, Light Rain, etc.            | Meteostat API                  |
| `PeriodOfDay`           | Time of day the trip occurred                           | Text: Morning, Midday, Evening                   | Derived from `pickup_datetime` |

## Data Sources

1. **NYC FHV Trip Data (October 2023 - November 2023)**  
   [NYC 2023 High-Volume FHV Trip Data](https://data.cityofnewyork.us/Transportation/2023-High-Volume-FHV-Trip-Data/u253-aew4/data_preview)  
   Contains detailed trip records, including pickup and dropoff times, locations, and fare information.

2. **NYC Taxi Zone Data**  
   [NYC Taxi Zones](https://data.cityofnewyork.us/Transportation/NYC-Taxi-Zones/d3c5-ddgc)  
   Provides geographic zone mappings for location IDs in the trip data.

3. **Meteostat Weather Data**  
   [Meteostat API](https://dev.meteostat.net/)  
   Meteorological data (temperature, wind speed, precipitation, etc.) was retrieved for each trip’s pickup location and time.

