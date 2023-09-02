#' Card details
#'
#' A data set containing all the details on the lorcana cards.
#'
#' @format A data frame with `r nrow(cards)` rows and `r ncol(cards)`
#' variables:
#'
#' ## Names
#' \describe{
#'   \item{name}{Name of card}
#'   \item{version}{Version of card. Some cards share their `name`, The version,
#'   helps make distinctions between them. Will sometimes be `NA`.}
#' }
#'
#' ## Gameplay
#' \describe{
#'   \item{card_type}{Card type, takes values `Action`, `Action, Song`,
#'   `Character`, or `Item`.}
#'   \item{classifications}{Comma separated, types of classes. Such as `Ally`,
#'   `King` and `Villain`.}
#'   \item{ink_color}{Ink color, takes values `Amber`, `Amethyst`, `Emerald`,
#'   `Ruby`, `Sapphire`, or `Steel`.}
#'   \item{ink_cost}{Integer value, denoting its ink cost.}
#'   \item{inkwell}{Logical value, denoting if card can be put in inkwell or
#'   not. Takes values `Yes` and `No`.}
#'   \item{strength}{Integer value, denoting the card's strength. Will be `NA`
#'   for non-character cards.}
#'   \item{willpower}{Integer value, denoting the card's willpower Will be `NA`
#'   for non-character cards.}
#'   \item{keywords_abilities}{Character, extracted keywords and abilities.}
#'   \item{lore}{Integer value, amount of lore card will produce.}
#' }
#'
#' ## Card information
#' \describe{
#'   \item{card_id}{Character, on the format `x/y` where `x` is the number the
#'   card as in the set, and `y` is the number of of cards in the set. `x` can
#'   be larger than `y`.}
#'   \item{card_text}{Character, text of the card. Can be `NA`.}
#'   \item{flavor_text}{Character, text of the card. Can be `NA`.}
#'   \item{set}{Character, name of set card is printed in.}
#'   \item{rarity}{Character, rarity of card. Takes values: `Common`,
#'   `Uncommon`, `Rare`, `Super Rare`, `Promo`, `Legendary`, `Enchanted`.}
#'   \item{illustrator}{Character, name of illustrator.}
#'   \item{release_date}{Character, release date.}
#' }
#'
#' @source \url{https://lorcanaplayer.com/}
#' @source \url{https://lorcania.com/}
"cards"


