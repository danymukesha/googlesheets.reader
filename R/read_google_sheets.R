#' Read data from Google Sheets document
#'
#' This function reads data from a Google Sheets document given its URL.
#' It uses the googlesheets4 package to fetch and parse the data from each sheet.
#'
#' @param google_sheets_url URL of the Google Sheets document.
#' @param unnest_data Logical, indicating whether to unnest the data. Default is TRUE.
#'
#' @return A tibble of tibbles, where each tibble corresponds to a sheet in the document.
#' The result includes sheet names and their corresponding data.
#'
#' @import googlesheets4
#' @import dplyr
#' @import purrr
#' @import tibble
#'
#' @examples
#' \dontrun{
#'   google_sheets_url <- "https://docs.google.com/spreadsheets/d/1YsOKpxKOKlUEx6gAg0qO7JxJ52KWOZulmhwZYcGMYHY"
#'   read_google_sheets(google_sheets_url)
#' }
#'
#' @export
read_google_sheets <- function(google_sheets_url, unnest_data = TRUE) {
  # Installing and loading the googlesheets4 package
  if (!requireNamespace("googlesheets4", quietly = TRUE)) {
    install.packages("googlesheets4")
  }

  library(googlesheets4)
  library(dplyr)
  library(purrr)
  library(tidyr)
  library(tibble)

  # Deauthorize to avoid token-related issues
  gs4_deauth()

  # Fetch sheets information
  sheets_info <- gs4_get(google_sheets_url)

  # Use map to read each sheet and store the results in a tibble of tibbles
  sheet_tibbles <- tibble(sheet_name = sheets_info$sheets$name) %>%
    mutate(sheet_data = map(sheet_name, ~ read_sheet(google_sheets_url, sheet = .x)))

  if (unnest_data) {
    combined_data <- sheet_tibbles %>%
      unnest(sheet_data)  # Unnest the list column to combine tibbles
    return(combined_data)
  } else {
    return(sheet_tibbles)
  }
}
