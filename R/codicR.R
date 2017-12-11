#' Translate Japanese to English
#'
#' This function translate Japanese string to English using Codic API.
#' @importFrom rstudioapi getActiveDocumentContext modifyRange
#' @export
codicR <- function() {
  context <- rstudioapi::getActiveDocumentContext()
  selection <- context$selection[[1]]
  new_txt <- get_from_codic(selection$text)
  rstudioapi::modifyRange(selection$range, new_txt)
}

#' Get Translate text from codic
#'
#' @importFrom httr GET content
get_from_codic <- function(txt){
  token <- Sys.getenv('CODIC_TOKEN')
  API_URL <- 'https://api.codic.jp/v1/engine/translate.json'

  r <-
    httr::GET(
      API_URL,
      query = list(text=txt, casing="lower underscore"),
      add_headers(
        Authorization = paste("Bearer", token), Accept = "application/json"
      )
    )
  if(r$status_code == 200L){
    x <- httr::content(r, "parsed")
    new_txt <- x[[1]]$translated_text
    return(new_txt)
  } else {
    return(txt)
  }
}
