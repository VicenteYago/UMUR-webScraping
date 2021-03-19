library(magrittr)
library(rvest)
library(dplyr)

# EXAMPLE 1: QUERY JSONS FROM WEBSITE

scrapeJson <- function(url, xpath){
  read_html(url) %>% 
    html_nodes(xpath = xpath) %>% 
    html_text() %>% jsonlite::fromJSON()  
}

# EXAMPLE 2: RETRIVE HTML TABLE FROM WEBSITE

scrapeTable <- function(url, xpath){
  read_html(url) %>% 
    html_nodes(xpath = xpath) %>%  
    html_table() %>% .[[1]]
}


scrapeJson('https://www.pccomponentes.com/cecotec-powergear-1500-xl-pro-batidora-de-mano-1500w', '//*[@id="microdata-product-script"]/text()')
scrapeJson('https://www.pccomponentes.com/sony-playstation-5-digital-sony-dualsense-mando-inalambrico-para-ps5', '//*[@id="microdata-product-script"]/text()')

scrapeTable('https://es.wikipedia.org/wiki/Tabla_peri%C3%B3dica_de_los_elementos', '/html/body/div[3]/div[3]/div[5]/div[1]/table[3]')
scrapeTable('https://es.wikipedia.org/wiki/Grupo_sangu%C3%ADneo', '/html/body/div[3]/div[3]/div[5]/div[1]/table[3]')

