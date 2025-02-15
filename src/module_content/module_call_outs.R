if (no_proceed_to_install) {
  cat("
::: callout-important
## Warning
Do not install course software until this warning is removed.
:::
")
}

if (under_construction) {
  cat("
::: callout-important\n## Under construction.
This page is a work in progress and may contain areas that need more detail or that required syntactical, grammatical, and typographical changes. If you find some part requiring some editing, please let me know so I can fix it for you.
:::
")
}
