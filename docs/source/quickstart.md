# Quickstart

## Dependencies

This library requires IP2Location BIN database to function. You may
download the BIN database at

-   IP2Location LITE BIN Data (Free): <https://lite.ip2location.com>
-   IP2Location Commercial BIN Data (Comprehensive):
    <https://www.ip2location.com>

:::{note}
An outdated BIN database was provided in the databases folder for your testing. You are recommended to visit the above links to download the latest BIN database.
:::

This library also requires IP2Location Python library for geolocation lookup. Hence, you will need to install the Python and IP2Location module before using this R package. It works in both Windows and Linux environment, and below is the installation command.

### Windows
At the command prompt, please run ```pip install IP2Location``` to install the module.

### Linux
At the terminal, please run ```pip install IP2Location``` to install the module.

## Requirements

1.  R 3.2.3 and above.

## Installation

Run ```install.packages("ip2location")``` in your R Studio IDE command prompt.

## Sample Codes

### Query geolocation information from BIN database

You can query the geolocation information from the IP2Location BIN database as below:

```r
library(ip2location)

ip2location::open("IP-COUNTRY-REGION-CITY-LATITUDE-LONGITUDE-ZIPCODE-TIMEZONE-ISP-DOMAIN-NETSPEED-AREACODE-WEATHER-MOBILE-ELEVATION-USAGETYPE-ADDRESSTYPE-CATEGORY-DISTRICT-ASN-SAMPLE.BIN")
result = ip2location::get_all("8.8.8.8")
print(result)
```

### Plot IP addresses on the map

To plot IP addresses on the map, use the open and plot_map functions like this:

```r
ip2location::open("~/IP-COUNTRY-REGION-CITY-LATITUDE-LONGITUDE-ZIPCODE-TIMEZONE-ISP-DOMAIN-NETSPEED-AREACODE-WEATHER-MOBILE-ELEVATION-USAGETYPE-SAMPLE.BIN")
ip2location::plot_map(c('8.8.8.8','8.8.6.6'))
```

