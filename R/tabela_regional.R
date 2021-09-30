#' Get regional data about number of psychologist in Brazil
#'
#' @return A tibble containing three columns: regional council, brazilian state (initials) and number of psychologists.
#' @export
#'
tabela_regional <- function() {
  "https://www2.cfp.org.br/infografico/quantos-somos/" %>%
    httr::GET() %>%
    httr::content() %>%
    rvest::html_element(
      xpath = "//div[contains(@id,'tabela-regional')]"
    ) %>%
    rvest::html_table(dec = ",") %>%
    purrr::set_names(c("regiao_crp", "estado", "psicologos")) %>%
    dplyr::mutate(regiao_crp = readr::parse_number(regiao_crp),
      psicologos = readr::parse_number(
        psicologos,
        locale = readr::locale(grouping_mark = "."))
    )
}
