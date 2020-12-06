#' Check, if a logfile exists
#'
#' This function loads the logfile, if it exists. If it doesn't, it will create one.
#' @return a data frame
#' @seealso \code{\link{generate_logfile_entry}} get the data to be logged
#' @export
#' @examples
#' \dontrun{
#' check_logfile_existence()
#' }

check_logfile_existence <- function() {
  if (file.exists(LOGFILE_PATH)) {
    print("load logfile")
    logfile <- read.csv(LOGFILE_PATH, sep = "\t", stringsAsFactors = F)
  } else {
    print("create logfile")
    logfile <- data.frame(file_name = NA, seed = NA, formula_x = NA, formula_y = NA)
  }
}
