if(getRversion() >= "2.15.1")  utils::globalVariables(c("long", "lat", "group", "prop"))

#' @title Plot map using IP2Location data.
#'
#' @description Plot the country on the map based on IP addresses and its IP2Location country data.
#' @param ips A vector of IP addresses to be plot on
#' @return NULL
#' @import maps
#' @import ggplot2
#' @import scales
#' @import utils
#' @export
#' @examples \dontrun{
#' plot_map(c("8.8.8.8", "8.8.6.6"))
#' }
#'

plot_map <- function(ips){
  countries = c()
  mapData = map_data("world")
  for ( i in ips ) {
    result = ip2location::get_all(i)
    countries = append(countries, toString(result["country_long"]))
  }

  country_table    <- table(countries)
  ipData  <- data.frame(country_table)

  variable1 = deparse(substitute(countries))
  variable1 = strsplit(variable1, "\\$")[[1]][2]

  if(ncol(ipData) == 2) {
    names(ipData) <- c(variable1, "n")
  } else if(ncol(ipData) > 2){
    names(ipData)[length(ipData)] <- "n"
  }

  prop <- as.vector(country_table)/sum(country_table)
  ipData  <- data.frame(ipData, prop)

  table.prop <- as.vector(country_table)/sum(country_table)
  table.perc <- format(round(table.prop*100, 1), nsmall = 1)
  table.perc <- gsub("$", "%", table.perc)
  ipData <- data.frame(ipData, table.perc)

  names(ipData)[1] = "group"

  data <- read.csv("inst/countrynames_mapping.txt", header=TRUE)

  data$matched_country_name[data$matched_country_name == ''] <- NA

  for(i in 1:nrow(data)){
    if(!is.na(data[i, "matched_country_name"])){
      old.name <- paste(data[i, "country_name"])
      new.name <- paste(data[i, "matched_country_name"])
      ipData[, "group"] <- gsub(old.name, new.name, ipData[, "group"])
    }
  }

  print(ipData)

  worldMapIPs <- merge(mapData, ipData, by.x = "region", by.y = "group", all.x = TRUE)
  worldMapIPs <- worldMapIPs[order(worldMapIPs[, "order"]), ]
  worldMapIPs[is.na(worldMapIPs)] <- 0
  world <- map_data("world")
  p <- ggplot() +
    geom_polygon(data=world, aes(x=long, y=lat, group = group),
                 colour = "#595959", fill = "white") + theme(panel.background = element_rect(fill = "#b2cce5"), plot.background = element_rect(fill = "#b2cce5"))

  mapcolors = c("black", "#d6d6d6", "white")
  mapvalues = c(1, .025, 0)


  p + geom_polygon(data=worldMapIPs, aes(x=long, y=lat, group = group, fill = prop)) + geom_path(data=worldMapIPs, aes(x=long, y=lat, group=group), color="#595959", size=0.05) + scale_fill_gradientn(colours= mapcolors, values= mapvalues, labels = percent_format(), limits = c(0,1)) + theme(plot.title = element_text(size = 20, colour = "black", family = "sans", margin = unit(c(0, 0, 5, 0), "mm"))) + scale_y_continuous(name=NULL, breaks=NULL, expand = c(0,0)) + scale_x_continuous(name=NULL, breaks=NULL, expand = c(0,0)) + theme(legend.justification = c(0, 0), legend.position = c(0, 0.32), legend.background = element_blank(), legend.title = element_blank(), legend.text = element_text(size = rel(1.1), colour = "black", family = "sans")) + guides(fill = guide_colorbar(barwidth = rel(0.5), barheight = rel(5.0), ticks = F))
}
