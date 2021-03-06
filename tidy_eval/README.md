tidy\_eval
================

Presenter
---------

-   [hadley](https://github.com/hadley): Chief Scientist at @rstudio

Packages
--------

-   [tidyverse/rlang](https://github.com/tidyverse/rlang): Low-level API for programming with R

Functions
---------

-   `rlang::quo()`: Create quosures Quosures are quoted expressions that keep track of an environment (just like closurefunctions). They are implemented as a subclass of one-sided formulas. They are an essential piece of the tidy evaluation framework.

-   `rlang::enquo()`: Create quosures Quosures are quoted expressions that keep track of an environment (just like closurefunctions). They are implemented as a subclass of one-sided formulas. They are an essential piece of the tidy evaluation framework.

-   `rlang::!!()`: Quasiquotation of an expression Quasiquotation is the mechanism that makes it possible to program flexibly with tidyeval grammars like dplyr. It is enabled in all tidyeval functions, the most fundamental of which are quo() and expr().

-   `rlang::!!!()`: Quasiquotation of an expression Quasiquotation is the mechanism that makes it possible to program flexibly with tidyeval grammars like dplyr. It is enabled in all tidyeval functions, the most fundamental of which are quo() and expr().

-   `rlang::eval_tidy()`: Evaluate an expression tidily eval\_tidy() is a variant of base::eval() and eval\_bare() that powers the tidy evaluationframework. It evaluates expr in an overscope where the special definitions enabling tidy evaluation are installed. This enables the following features:
