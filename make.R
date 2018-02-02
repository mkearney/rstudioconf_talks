## r


rmd_gh <- function(talk, author = "", pkgs = "", funs = "") {
  paste0('---
title: "', talk, '"
output: github_document
---

## Presenter

+ [', author, '](https://github.com/)

## Packages

', add_pkgs(pkgs, author), '
## Functions

', add_funs(funs))
}

add_pkgs <- function(pkgs, author = "") {
  add_pkg <- function(pkg, author) {
    paste0('+ [{', pkg, '}](', author, '/', pkg, ')\n')
  }
  paste(Map(add_pkg, pkgs, author, USE.NAMES = FALSE), collapse = "\n")
}

add_funs <- function(funs) {
  add_fun <- function(fun) paste0("+ `", fun, "`\n")
  paste(sapply(funs, add_fun), collapse = "\n")
}

init_talk <- function(talk, author, pkgs = "", funs = "", open = FALSE) {
  dir.create(talk)
  readme <- file.path(talk, "README.Rmd")
  cat(rmd_gh(talk, author, pkgs, funs),
      file = readme)
  if (open) {
    browseURL(readme)
  }
}

render_talk <- function(talk, open = TRUE) {
  readme_rmd <- file.path(talk, "README.Rmd")
  readme_html <- file.path(talk, "README.html")
  rmarkdown::render(readme_rmd)
  if (open) {
    system(paste("open -a firefox", sQuote(readme_html)))
  }
}

init_talk("tidy_spatial",
  author = "edzer/r-spatial",
  pkgs = c("sp", "sf", "mapview", "stars"),
  funs = c("sf", "methods:filter,arrange/distinct/group_by",  "geom_sf"))
render_talk("tidy_spatial")


init_talk("tidy_time",
  author = "business-science/DavisVaughan",
  pkgs = c("tidyquant", "tibbletime", "tidyfinance"),
  funs = c("collapse_by", "rollify"))
render_talk("tidy_time")


init_talk("tidy_stats",
  author = "andrewpbray",
  pkgs = c("infer"),
  funs = c("specify", "hypothesize", "calculate"))
render_talk("tidy_stats")

init_talk("tidy_networks",
  author = "thomasp85",
  pkgs = c("tidygraph", "ggraph"),
  funs = c("activate", "bind_edges", "bind_nodes", "bind_graphs",
           "ggraph", "geom_node_*", "geom_edges_*"))
render_talk("tidy_networks")
