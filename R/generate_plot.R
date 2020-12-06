#' Generate one generative plot
#'
#' This function plots previously created data.
#' @param df the data frame created with `generate_data()`
#' @param file_name the file name for saving the plot
#' @param polar do you want to use a polar coordinate system? The default is a cartesian coordinate system.
#' @param file_name filetype of the final image. Default is `png`, for other options see the `devics` argument in `gggplot::gsave()`
#' @param color color of the points. default is black
#' @param background_color background color of the plaut. default is white.
#' @param filetype set the file type for the image
#' @return a png file
#' @seealso \code{\link{generate_data}} where the data is created
#' @export
#' @examples
#' generate_plot(df, file_name, polar = FALSE)
#' @import ggplot2
#' @importFrom magrittr %>%

generate_plot <- function(df, file_name, polar, filetype, color = "black", background_color = "white") {
  print("generate plot")
  if (polar == TRUE) {
    plot <- df %>%
      ggplot2::ggplot(ggplot2::aes(x = x, y = y)) +
      ggplot2::geom_point(alpha = 0.1, size = 0, shape = 20, color = color) +
      ggplot2::theme_void() +
      ggplot2::coord_fixed() +
      ggplot2::coord_polar() +
      ggplot2::theme(
        panel.background = element_rect(fill = background_color),
        plot.background = element_rect(fill = background_color)
        )
  } else {
    plot <- df %>%
      ggplot2::ggplot(ggplot2::aes(x = x, y = y)) +
      ggplot2::geom_point(alpha = 0.1, size = 0, shape = 20, color = color) +
      ggplot2::theme_void() +
      ggplot2::coord_fixed() +
      ggplot2::theme(
        panel.background = element_rect(fill = background_color),
        plot.background = element_rect(fill = background_color)
        )
  }
  ggplot2::ggsave(plot, filename = paste0(IMG_PATH, file_name), width = 6, height = 6, device = filetype)
  print("image saved...")
}
