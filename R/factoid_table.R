

#' Build a factoid table.
#'
#' @param year
#' @param us_pres
#' @param best_pic
#' @param ticket_price
#'
#' @return
#' @export
#'
#' @import gt
factoid_table <- function(year, us_pres, best_pic, ticket_price) {
  oscars_url <- glue::glue("https://www.oscars.org/oscars/ceremonies/{year}",
                           year = year + 1)
  tibble::tribble(
    ~event, ~value,
    "US President:", us_pres,
    "Best Picture:", best_pic,
    "Avg. Ticket Price:", paste0("$", ticket_price)
  ) %>%
    gt() %>%
    tab_header(title = paste(year, "Factoids")) %>%
    tab_options(
      table.width = pct(100),
      column_labels.hidden = TRUE
    ) %>%
    tab_footnote(
      footnote = md(glue::glue("Source: [oscars.org]({url})", url = oscars_url)),
      locations = cells_body(
        columns = vars(value),
        rows = 2)
    ) %>%
    tab_footnote(
      footnote = md("Source: [boxofficemojo.com](https://www.boxofficemojo.com/about/adjuster.htm)"),
      locations = cells_body(
        columns = vars(value),
        rows = 3)
    )
}

