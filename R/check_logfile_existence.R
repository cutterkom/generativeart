#' Check, if a logfile exists
#'
#' This function loads the logfile, if it exists. If it doesn't, it will create one.
#' @param file_name the file name for saving the plot
#' @return a data frame
#' @seealso \code{\link{generate_logfile_entry}} get the data to be logged
#' @export
#' @examples
#' check_logfile_existence()

check_logfile_existence <- function() {
  if (file.exists(LOGFILE_PATH)) {
    print("load logfile")
    logfile <- readr::read_tsv(LOGFILE_PATH)
  } else {
    print("create logfile")
    logfile <- data.frame(file_name = NA, seed = NA, formula_x = NA, formula_y = NA)
  }
}
