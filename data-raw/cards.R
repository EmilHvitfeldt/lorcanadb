## code to prepare `cards` cards goes here

library(rvest)
library(tidyverse)
library(janitor)
library(glue)

urls <- c()

for (page in 1:8) {
  new_urls <- read_html(glue("https://lorcanaplayer.com/cards/page/{page}/")) |>
    html_elements(".card-column h4 a") |>
    html_attr("href")

  urls <- c(urls, new_urls)
}

fetch_info <- function(url) {
  html <- read_html(url)
  attributes <- html |>
    html_elements(".card-details .gb-grid-column") |>
    html_text()

  other_attributes <- html |>
    html_elements(".gb-container.card-details > .gb-container") |>
    html_text()

  str_trim(other_attributes)

  attributes_tbl <- c(attributes, other_attributes) |>
    str_trim() |>
    setdiff("") |>
    str_split("\n+") |>
    map(\(x) setNames(tibble::tibble(x[2]), x[1])) |>
    list_cbind()

  image_url <- html |>
    html_elements(".wp-block-image figure.gb-block-image a") |>
    html_attr("href")

  attributes_tbl$url <- url
  attributes_tbl$image_url <- image_url

  attributes_tbl
}

all_cards <- map(urls, fetch_info, .progress = TRUE)

all_cards <- list_rbind(all_cards)

cards <- all_cards |>
  clean_names() |>
  mutate(card_text = str_squish(card_text)) |>
  mutate(flavor_text = str_squish(flavor_text)) |>
  select(-song_credits)
  pull(song_credits)

walk2(cards$image_url, fs::path("data-raw/images", basename(cards$image_url)), download.file)

cards$image_url <- NULL
cards$url <- NULL

cards <- cards |>
  mutate(across(c(ink_cost, strength, willpower, lore), as.integer)) |>
  mutate(card_type = str_replace(card_type, " • ", ", ")) |>
  mutate(classifications = str_replace_all(classifications, " • ", ", ")) |>
  mutate(card_text = str_replace_all(card_text, "⬡", "ink")) |>
  select(name, version, card_type, classifications, ink_color, ink_cost,
         inkwell, strength, willpower, keywords_abilities, lore, card_id,
         card_text, flavor_text, set, rarity, illustrator, release_date)

usethis::use_data(cards, overwrite = TRUE)
