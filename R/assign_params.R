#' evaluate comma separated function parameter in global environment
#'
#'
#' @export
assign_params <- function() {
  context <- rstudioapi::getActiveDocumentContext()
  text    <- context$selection[[1]]$text
    tryCatch(
      eval(parse(text=text[i]), envir=globalenv()),
      error = function(e){
        tmp   <- eval(parse(text = paste0("function(",text,"){}")))
        val   <- formals(tmp)
        iffer <- as.character(val)!=""
        nam   <- names(val)[iffer]
        val   <- val[iffer]
        eval(parse(text=paste(nam, val, sep="=")), envir = globalenv())
      }
    )
  }

