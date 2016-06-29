#' evaluate comma separated function parameter in global environment
#'
#'
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
