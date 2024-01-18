
<!-- README.md is generated from README.Rmd. Please edit that file -->

# googlesheets.reader

<!-- badges: start -->
<!-- badges: end -->

A lightweight R package, `googlesheetsReader`, intended to make reading
data from Google Sheets easier. It uses the googlesheets4 package to
effortlessly retrieve and analyze data from any sheet in a Google Sheets
document, providing a clean and convenient interfacefor R users.
Streamline your workflow with this easy-to-use package for seamless
integration with Google Sheets data in your R projects.

## Installation

You can install the development version of googlesheets.reader from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("danymukesha/googlesheets.reader")
#> Downloading GitHub repo danymukesha/googlesheets.reader@HEAD
#> ── R CMD build ─────────────────────────────────────────────────────────────────
#>       ✔  checking for file 'C:\Users\dany.mukesha\AppData\Local\Temp\RtmpQFHuDa\remotes5da0296c599a\danymukesha-googlesheets.reader-e4bd0a0/DESCRIPTION'
#>       ─  preparing 'googlesheets.reader':
#>    checking DESCRIPTION meta-information ...  ✔  checking DESCRIPTION meta-information
#>       ─  checking for LF line-endings in source and make files and shell scripts
#>   ─  checking for empty or unneeded directories
#>    Omitted 'LazyData' from DESCRIPTION
#>       ─  building 'googlesheets.reader_0.0.1.tar.gz'
#>      
#> 
#> Installing package into 'C:/Users/dany.mukesha/AppData/Local/R/win-library/4.3'
#> (as 'lib' is unspecified)
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(googlesheets.reader)
google_sheets_url <- "https://docs.google.com/spreadsheets/d/1U6Cf_qEOhiR9AZqTqS3mbMF3zt2db48ZP5v3rkrAEJY/edit#gid=780868077"
result <- read_google_sheets(google_sheets_url)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
#> ✔ Reading from "gapminder".
#> ✔ Range ''Africa''.
#> ✔ Reading from "gapminder".
#> ✔ Range ''Americas''.
#> ✔ Reading from "gapminder".
#> ✔ Range ''Asia''.
#> ✔ Reading from "gapminder".
#> ✔ Range ''Europe''.
#> ✔ Reading from "gapminder".
#> ✔ Range ''Oceania''.
```

Replace “google_sheets_url” with the actual URL for your google sheet.

``` r
head(result)
#> # A tibble: 6 × 7
#>   sheet_name country continent  year lifeExp      pop gdpPercap
#>   <chr>      <chr>   <chr>     <dbl>   <dbl>    <dbl>     <dbl>
#> 1 Africa     Algeria Africa     1952    43.1  9279525     2449.
#> 2 Africa     Algeria Africa     1957    45.7 10270856     3014.
#> 3 Africa     Algeria Africa     1962    48.3 11000948     2551.
#> 4 Africa     Algeria Africa     1967    51.4 12760499     3247.
#> 5 Africa     Algeria Africa     1972    54.5 14760787     4183.
#> 6 Africa     Algeria Africa     1977    58.0 17152804     4910.
```
