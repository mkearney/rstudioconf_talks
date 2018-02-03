## initialize git repo (and create repo on github.com)
#system("git init")
#cat("**.html", file = ".gitignore", fill = TRUE)
#system("git add .")
#system(paste0("git commit -m", sQuote("initial commit")))
#system("git remote add origin git@github.com:mkearney/rstudioconf_talks.git")
#system("git push -u origin master")
#system("git push")

## read in functions
source("R/funs.R")

## build talk directories
init_talk("tidy_spatial",
  author = "edzer",
  pkgs = c("r-spatial/sf", "r-spatial/stars"),
  funs = c("sf::st_sf", "sf::filter.sf", "sf::arrange.sf", "sf::group_by.sf",
    "sf::distinct.sf"))
render_talk("tidy_spatial")

init_talk("tidy_time",
  author = "DavisVaughan",
  pkgs = c("business-science/tidyquant", "business-science/tibbletime",
    "DavisVaughan/tidyfinance"),
  funs = c("tibbletime::collapse_by", "tibbletime::rollify"))
render_talk("tidy_time", open = FALSE)

init_talk("tidy_stats",
  author = "andrewpbray",
  pkgs = c("andrewpbray/infer"),
  funs = c("infer::specify", "infer::hypothesize", "infer::calculate"))
render_talk("tidy_stats", open = FALSE)

init_talk("tidy_networks",
  author = "thomasp85",
  pkgs = c("thomasp85/tidygraph", "thomasp85/ggraph"),
  funs = c("tidygraph::activate", "tidygraph::bind_edges",
    "tidygraph::bind_nodes", "tidygraph::bind_graphs",
    "ggraph::ggraph", "ggraph::geom_node_point",
    "ggraph::geom_edge_link"))
render_talk("tidy_networks", open = FALSE)

init_talk("tidy_modeling",
  author = "topepo",
  pkgs = "topepo/caret",
  funs = c("caret::train")
)
render_talk("tidy_modeling", open = FALSE)


init_talk("tidy_eval",
  author = "hadley",
  pkgs = "tidyverse/rlang",
  funs = c("rlang::expr", "rlang::enxpr",
    "rlang::quo", "rlang::enquo",
    "rlang::!!", "rlang::!!!",
    "rlang::eval_tidy")
)
render_talk("tidy_eval")


## add and commit changes and then push to github
system("git add .")
system(paste0("git commit -m", sQuote("edits")))
system("git push")


ex1 <- expr(x + y)


library(rlang)
?dplyr::mutate_if

as.numeric.tbl_df <- function(.data, ...) {
  dots <- quos(...)
  dplyr::mutate_if(.data,
    names(.data) %in% names(dplyr::select(.data, !!!dots)),
    as.numeric)
}


as_numeric <- function(.data, ...) {
  dots <- quos(...)
  dplyr::mutate_if(.data,
    names(.data) %in% names(dplyr::select(.data, !!!dots)),
    as.numeric)
}

as_character <- function(.data, ...) {
  dots <- quos(...)
  dplyr::mutate_if(.data,
    names(.data) %in% names(dplyr::select(.data, !!!dots)),
    as.character)
}

mtcars <- dplyr::tbl_df(mtcars)
as_numeric(mtcars, cyl, mpg)
as_character(mtcars, cyl, mpg)
