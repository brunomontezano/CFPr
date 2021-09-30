
<!-- README.md is generated from README.Rmd. Please edit that file -->

# CFPr <a href='https://github.com/brunomontezano/CFPr/'><img src='man/figures/logo.png' align="right" height="139" /></a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/brunomontezano/CFPr/workflows/R-CMD-check/badge.svg)](https://github.com/brunomontezano/CFPr/actions)
<!-- badges: end -->

The purpose of the CFPr package is to provide tables contained on the
Brazilian Federal Psychology Council website within the R environment
with ease in a clean and nice format.

## Installation

You can install the current version of CFPr with:

``` r
install.packages("remotes")
remotes::install_github("brunomontezano/CFPr")
```

## Usage

You can choose between three tables

-   By-state table (`tabela_estado()`)
-   By-council table (`tabela_regional()`)
-   By-gender table (`tabela_sexo()`)

Let’s suppose I want to check the number of psychologists of each gender
in brazilian states. In this case, I should use the `tabela_sexo`
function:

``` r
# Load the package
library(CFPr)
# Assign data to an R object and then print it
bysex_table <- tabela_sexo()
bysex_table
#> # A tibble: 29 × 4
#>    estado           feminino masculino nao_informado
#>    <chr>               <dbl>     <dbl>         <dbl>
#>  1 Acre                  891       166            73
#>  2 Alagoas              4290       727            24
#>  3 Amapá                 805       160           170
#>  4 Amazonas             4516       834           197
#>  5 Bahia               16874      2673           246
#>  6 Ceará                8651      1596          2121
#>  7 Distrito Federal    11070      1940           340
#>  8 Espírito Santo       6373      1222            69
#>  9 Goiás               10155      1294           199
#> 10 Maranhão             3513       643            31
#> # … with 19 more rows
```

# To Do

-   [ ] Plotting functions. Is it necessary?
-   [ ] Restructure workflow to provide data (as data and not
    function-based). Is it better?

# Acknowledgement

I’d like to thank the [Brazilian Federal Council of
Psychology](https://site.cfp.org.br/) for making the data available to
the population.

# Contact

Feel free to leave an issue to improve the package, and contact me
through this [email](mailto:brunodoyt@gmail.com).
