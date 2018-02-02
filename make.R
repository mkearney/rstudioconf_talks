## r

source("R/funs.R")

match.fun("rtweet::search_tweets")

match.fun(noquote("rtweet::search_tweets"))
help(as.function("rtweet::search_tweets"))
install.packages("stars")

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
render_talk("tidy_time")

init_talk("tidy_stats",
  author = "andrewpbray",
  pkgs = c("andrewpbray/infer"),
  funs = c("infer::specify", "infer::hypothesize", "infer::calculate"))
render_talk("tidy_stats")

init_talk("tidy_networks",
  author = "thomasp85",
  pkgs = c("thomasp85/tidygraph", "thomasp85/ggraph"),
  funs = c("tidygraph::activate", "tidygraph::bind_edges",
    "tidygraph::bind_nodes", "tidygraph::bind_graphs",
    "ggraph::ggraph", "ggraph::geom_node_point",
    "ggraph::geom_edge_link"))
render_talk("tidy_networks")

system("git init")
cat("**.html", file = ".gitignore", fill = TRUE)

system("git add .")
system(paste0("git commit -m", sQuote("initial commit")))
system("git remote add origin git@github.com:mkearney/rstudioconf_talks.git")
system("git push -u origin master")

system("git push")

rmarkdown::render("README.Rmd")
?xml2::xml_document


xml2::as_xml_document(as.character(xt))
rvest::html_node(xml2::read_html(as.character(xt)), "h2")



init_talk(
  "tidy_modeling",
  author = "topepo",
  pkgs = "caret",
)
