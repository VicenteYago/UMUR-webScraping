library(magrittr)
library(rvest)
library(dplyr)

scrapeJson <- function(url, xpath){
  read_html(url) %>% 
    html_nodes(xpath = xpath) %>% 
    html_text() %>% jsonlite::fromJSON()  
}

scrapeTable <- function(url, xpath, fill=F){
  read_html(url) %>% 
    html_nodes(xpath = xpath) %>%  
    html_table(fill) %>% .[[1]]
}
