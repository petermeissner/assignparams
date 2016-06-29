#' evaluate comma separated function parameter in global environment
#'
#'
#' @param fun A function object or a character string naming the function. See
#' \code{\link{formals}} for details.
#' @export
assign_params <- function() {
  context <- rstudioapi::getActiveDocumentContext()
  text <- context$selection[[1]]$text
  text <- unlist(strsplit(text, ","))
  print(text)
  for(i in seq_along(text)){
    try(eval(parse(text=text[i]), envir=globalenv()))
  }
}
