#' Importing multiple .csv files
#'
#' @param folder directory of the folder
#'
#' @return a list
#' @export
#' @importFrom utils read.csv2
#'
#' @examples
#' \dontrun{
#' my_csv_reader("../../folder/directory")
#' }
my_csv_reader <- function(folder){
  list <- list.files(path = folder, pattern = ".*csv$", full.names = TRUE)
  result <- lapply(list,read.csv2)
  return(result)
}
