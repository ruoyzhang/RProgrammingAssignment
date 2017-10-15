#' draw_names: plot the number of new born babies with specified names in France from 1900 to 2015
#'
#' @param names a vector of names
#'
#' @return a plot of the number of babies with specified names against year
#' @export
#' @import prenoms
#' @import ggplot2
#' @import dplyr
#' @import utils
#'
#' @examples
#' \dontrun{
#' draw_names(c("Diane","Vincent"))
#' }
draw_names <- function(names){
  prenoms %>%
    filter(name %in% names) %>%
    group_by(year, name) %>% summarise(n=sum(n)) %>% ggplot(aes(x = year, y = n, color=name)) + geom_line()
}
