#' Generate one generative plot
#'
#' This function plots previously created data.
#' @param df the data frame created with `generate_data()`
#' @param file_name the file name for saving the plot
#' @param polar do you want to use a polar coordinate system? The default is a cartesian coordinate system.
#' @return a png file
#' @seealso \code{\link{generate_data}} where the data is created
#' @export
#' @examples
#' generate_plot(df, file_name, polar = FALSE)

generate_plot <- function(df, file_name, polar) {
  print("generate plot")
  if (polar == TRUE) {
    plot <- df %>%
      ggplot(aes(x = x, y = y)) +
      geom_point(alpha = 0.1, size = 0, shape = 20) +
      theme_void() +
      coord_fixed() +
      coord_polar()
  } else {
    plot <- df %>%
      ggplot(aes(x = x, y = y)) +
      geom_point(alpha = 0.1, size = 0, shape = 20) +
      theme_void() +
      coord_fixed()
  }
  ggsave(plot, filename = paste0(IMG_PATH, file_name), width = 6, height = 6)
  print("image saved...")
}
