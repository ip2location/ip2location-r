.ip2location_env <- new.env(parent = emptyenv())

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
  .ip2location_env$IP2Location <- reticulate::import("IP2Location")
  .ip2location_env$data <- .ip2location_env$IP2Location$IP2Location(bin_location)
  invisible(NULL)
}

#' @title Get the current IP2Location BIN data object
#'
#' @description Retrieve the Python IP2Location object created by \code{open()}. Internal helper used by the lookup functions to ensure the BIN data has been loaded before making a request.
#' @return Return the Python IP2Location data object used for lookups
#' @keywords internal
#' @noRd
#'

.getData <- function() {
  if (is.null(.ip2location_env$data)) {
    stop("BIN data not loaded. Please call open() first.")
  }
  .ip2location_env$data
}

#' @title Lookup for IP address information
#'
#' @description Find the country, region, district, city, coordinates, zip code, ISP, domain name, timezone, connection speed, IDD code, area code, weather station code, weather station name, mobile, usage type, address type, IAB category and ASN that any IP address or host name originates from. The return values will be depending on the BIN data loaded.
#' @param ip IPv4 or IPv6 address
#' @return Return all information about the IP address
#' @import reticulate
#' @export
#' @examples \dontrun{
#' get_all("8.8.8.8")
#' }
#'

get_all <- function(ip){
  data <- .getData()
  rec <- data$get_all(ip)
  result <- reticulate::py_to_r(rec$`__dict__`)
  return(result)
}
