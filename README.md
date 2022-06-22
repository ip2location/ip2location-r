# Description

Enables the user to find the country, region, city, coordinates, zip code, time zone, ISP, domain name, connection type, area code, weather station code, weather station name, mobile, usage type, address type and IAB category that any IP address or hostname originates from.

# Installation

## R Package
1. Launch RStudio IDE.
2. Make sure *devtools* is installed on your local machine. At the console window, run `install.packages("devtools")`
3. Load *devtools* `require(devtools)`
4. Install the package `install_github("ip2location/ip2location-r")`
5. Call the open() and get_all() function to open and get all the information about the IP address
```
> ip2location::open("~/IP-COUNTRY-REGION-CITY-LATITUDE-LONGITUDE-ZIPCODE-TIMEZONE-ISP-DOMAIN-NETSPEED-AREACODE-WEATHER-MOBILE-ELEVATION-USAGETYPE-SAMPLE.BIN")
> ip2location::get_all("8.8.8.8")
$ip
[1] "8.8.8.8"

$country_short
[1] "US"

$country_long
[1] "United States"

$region
[1] "California"

$city
[1] "Mountain View"

$isp
[1] "Google LLC"

$latitude
[1] 37.40599

$longitude
[1] -122.0785

$domain
[1] "google.com"

$zipcode
[1] "94043"

$timezone
[1] "-07:00"

$netspeed
[1] "T1"

$idd_code
[1] "1"

$area_code
[1] "650"

$weather_code
[1] "USCA0746"

$weather_name
[1] "Mountain View"

$mcc
[1] "-"

$mnc
[1] "-"

$mobile_brand
[1] "-"

$elevation
[1] "32"

$usage_type
[1] "SES"

$address_type
[1] "A"

$category
[1] "IAB19"
```


## IP2Location Python Module
This R package leverage the IP2Location Python library for geolocation lookup. Hence, you will need to install the `Python` and `IP2Location` module before using this R package. It works in both Windows and Linux environment, and below is the installation command.

### Windows
At the command prompt, please run ```pip install IP2Location``` to install the module.

### Linux
At the terminal, please run ```pip install IP2Location``` to install the module.

# IP2Location BIN Data File
IP2Location BIN data file contains the geolocation information for the lookup. You can download the data file from the below links

* [IP2Location Free LITE BIN Data](https://lite.ip2location.com)
* [IP2Location Commercial BIN Data](https://www.ip2location.com)

# Support
https://www.ip2location.com/
