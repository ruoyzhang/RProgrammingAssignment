#' multi_excel: reading all sheets of an excel file
#'
#' @param file "the directory of the file"
#'
#' @return a list of all the sheets of the excel file
#' @import readxl
#' @export
#'
#' @examples
#' \dontrun{
#' multi_excel("/directory/of/file")
#'}
multi_excel <- function(file){
  assert_that("TRUE" %in% has_extension(file, c("xlsx", "xls")))
  all_sheets <- excel_sheets(file)
  loadsheets <- lapply(all_sheets, function(sheet){
    read_excel(file, sheet = sheet)
  })
}
