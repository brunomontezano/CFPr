#' Get data about number of psychologist in each Brazilian state
#'
#' @return A tibble containing two columns: brazilian state and number of psychologists in given state.
#' @export
#'
tabela_estado <- function() {
  "https://www2.cfp.org.br/infografico/quantos-somos/" %>%
    httr::GET() %>%
    httr::content() %>%
    rvest::html_element(
      xpath = "//div[contains(@id,'tabela-estado')]"
    ) %>%
     rvest::html_table(dec = ",") %>%
     purrr::set_names(c("estado", "psicologos")) %>%
    dplyr::slice(-c(1:3)) %>%
       dplyr::mutate(psicologos = readr::parse_number(
         psicologos,
         locale = readr::locale(grouping_mark = "."))
     )
}
