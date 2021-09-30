#' Get data on the number of psychologists of each gender in Brazil by region
#'
#' @return A tibble containing four columns: brazilian state, number of female psychologists, number of male psychologists and number of people that did not report their gender.
#' @export
#'
tabela_sexo <- function() {
  "https://www2.cfp.org.br/infografico/quantos-somos/" %>%
    httr::GET() %>%
    httr::content() %>%
    rvest::html_element(
      xpath = "//div[contains(@id,'tabela-sexo')]"
    ) %>%
    rvest::html_table(dec = ",") %>%
    dplyr::slice(-c(1:3)) %>%
    purrr::set_names(
      c("estado", "feminino", "masculino", "nao_informado")
    ) %>%
    dplyr::mutate(
      estado = stringr::str_remove_all(estado, "\\* ")
      ) %>%
    dplyr::mutate(
      dplyr::across(c("feminino", "masculino", "nao_informado"),
      ~ readr::parse_number(
        .x, locale = readr::locale(grouping_mark = ".")
        ))
      )
}
