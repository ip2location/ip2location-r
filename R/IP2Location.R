#' @title Load IP2Location BIN data
#'
#' @description Load the IP2Location BIN data for lookup. Free IP2Location LITE data available for download at <https://lite.ip2location.com/>
#' @param bin_location Absolute path of IP2Location BIN data
#' @return NULL
#' @import reticulate
#' @export
#' @examples \dontrun{
#' open("~/IP-COUNTRY.BIN")
#' }
#'

open <- function(bin_location){
  py_run_string("import IP2Location")
  py_run_string("import json")
  path = paste("data = IP2Location.IP2Location('", bin_location , "')", sep = "")
  py_run_string(path)
}

#' @title Lookup for IP address information
#'
#' @description Find the country, region, district, city, coordinates, zip code, ISP, domain name, timezone, connection speed, IDD code, area code, weather station code, weather station name, mobile, usage type, address type, IAB category and ASN that any IP address or host name originates from. The return values will be depending on the BIN data loaded.
#' @param ip IPv4 or IPv6 address
#' @return Return all information about the IP address
#' @import reticulate
#' @import jsonlite
#' @export
#' @examples \dontrun{
#' get_all("8.8.8.8")
#' }
#'

get_all <- function(ip){
  address = paste("rec = data.get_all('", ip, "')", sep = "")
  py_run_string(address)
  py_run_string("j = json.dumps(rec.__dict__)")
  result = fromJSON(py$j)
  return(result)
}
