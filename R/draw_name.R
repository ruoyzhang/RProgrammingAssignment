#' draw_name: plot the number of number babies with a specified name and gender in France from 1900 to 2015
#'
#' @param the_name the specified name
#' @param the_sex the specified gender
#'
#' @return a line graph plotting the number of babies against year born in a specific year
#' @export
#' @import prenoms
#' @import ggplot2
#' @import dplyr
#' @import utils
#'
#' @examples
#' \dontrun{
#' draw_a_name("Diane","F")
#' }
draw_a_name <- function(the_name, the_sex){
  assert_that(is.character(the_name))
  assert_that(is.character(the_sex))
  assert_that(the_name %in% unique(prenoms$name))
  assert_that(the_sex %in% unique(prenoms$sex))
    prenoms %>%
    filter(name == the_name, sex == the_sex) %>%
    group_by(year, name) %>% summarise(n=sum(n)) %>% ggplot(aes(x = year, y = n)) + geom_line()
}
