#' save_as_csv: a function to save a data frame as a .csv file with built in verification mechanisms for the necessary conditions
#'
#' @param data a data frame
#' @param output the directory of the output file, it should end with ".csv"
#' @param row.names FALSE by default, this indicates whether the row names of the data is to be written along with the data
#' @param ... other default settings
#'
#' @return a message saying that the file has been successfully written in the desired location
#' @export
#' @importFrom utils write.csv2
#' @import assertthat
#'
#' @examples
#' \dontrun{
#' save_as.csv(iris, "output.csv")
#' }
save_as_csv <- function(data, output, row.names=FALSE, ...){
  assert_that(is.data.frame(data))
  assert_that(is.writeable(dirname(output)))
  assert_that(has_extension(output, "csv"))
  assert_that(not_empty(data))
  assert_that(is.dir(dirname(output)))
  write.csv2(data, output, row.names = row.names, ...)
  cat("This data frame has been successfully written at", normalizePath(output))
}
