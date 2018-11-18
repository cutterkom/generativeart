#' Generate the generative image
#'
#' This function saves the information in order to recreate an image with random elements and appends it to the logfile.
#' @param logfile the logfile
#' @param formula a string of the formula, that is used
#' @param seed the specific seed used
#' @param file_name the file name of the image
#' @return a data frame and a saved csv-file
#' @seealso \code{\link{check_logfile_existence}} check, if there is a logfile
#' @export
#' @examples
#' generate_logfile_entry(logfile, formula, seed, file_name)
#' @importFrom dplyr bind_rows

generate_logfile_entry <- function(logfile, formula, seed, file_name) {
  logfile_tmp <- data.frame(file_name = file_name,
                            seed = seed,
                            formula_x = as.character(formula["x"]),
                            formula_y = as.character(formula["y"]), stringsAsFactors = F)
  logfile <- dplyr::bind_rows(logfile, logfile_tmp)
  write.table(logfile, LOGFILE_PATH, sep = "\t", quote = F, row.names = F)
  print("logfile saved")
}
