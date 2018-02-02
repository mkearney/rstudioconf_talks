## r

rmd_gh <- function(talk, author = "", pkgs = "", funs = "") {
  paste0('---
title: "', talk, '"
output: github_document
---

## Presenter

+ [', author, '](https://github.com/)

## Packages

', add_pkgs(pkgs), '
## Functions

', add_funs(funs))
}

add_pkgs <- function(pkgs) {
  add_pkg <- function(pkg) {
    github_link <- paste0("https://github.com/", pkg)
    h <- xml2::read_html(github_link)
    abt <- rvest::html_text(rvest::html_nodes(h, "span.col-11"))
    if (length(abt) == 0L) abt <- ""
    paste0('+ [', pkg, '](', github_link, '): ', abt[1], "\n")
  }
  paste(sapply(pkgs, add_pkg), collapse = "\n")
}

add_funs <- function(funs) {
  add_fun <- function(fun) {
    x <- strsplit(fun, "::")[[1]]
    if (!requireNamespace(x[1], quietly = TRUE)) install.packages(x[1])
    x <- help(x[2], package = x[1])
    x <- repr::repr_html(x)
    x <- as.character(x)
    x <- xml2::read_html(x)
    metap <- rvest::html_text(rvest::html_nodes(x, "p"))[1]
    metah <- rvest::html_text(rvest::html_nodes(x, "h2"))[1]
    meta <- paste(metah, metap)
    paste0("+ `", fun, "()`: ", meta, "\n")
  }
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

