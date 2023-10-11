
# -----------------------------------------------------------------------------
# Facet bar plot of top terms per topic
# -----------------------------------------------------------------------------

if(!dir.exists(file.path("figures/"))) dir.create(file.path("figures/"))

  #Get the top terms per topic
terms <- terms(topics, top_n = 10)

  #Faceted bar graphs
for (i in 1:length(terms)) {
  
  if (i %in% c(2,5,6,8,11,14,17,20,21,22,25)) {
    
    assign(paste0("top_terms_", i),
           ggplot(terms[[i]], aes(x = probability, y = reorder(token, probability))) +
             geom_col(fill = "#1696d2", color = "black") +
             theme_bw() +
             xlab(paste0("Topic #", i)) +
             ylab("") +
             theme(axis.title = element_text(face = "bold"),
                   axis.text.y = element_text(size = 7)) +
             scale_x_continuous(expand = c(0,0), limits = c(0,.075))
    )
    
  } else {
    
    assign(paste0("top_terms_", i),
           ggplot(terms[[i]], aes(x = probability, y = reorder(token, probability))) +
             geom_col(fill = "gray50", color = "black") +
             theme_bw() +
             xlab(paste0("Topic #", i)) +
             ylab("") +
             theme(axis.title = element_text(face = "bold"),
                   axis.text.y = element_text(size = 7)) +
             scale_x_continuous(expand = c(0,0), limits = c(0,.075))
    )
    
  }
}

top_terms <- ggarrange(top_terms_1, top_terms_2, top_terms_3, top_terms_4, top_terms_5,
                       top_terms_6, top_terms_7, top_terms_8, top_terms_9, top_terms_10,
                       top_terms_11, top_terms_12, top_terms_13, top_terms_14, top_terms_15,
                       top_terms_16, top_terms_17, top_terms_18, top_terms_19, top_terms_20,
                       top_terms_21, top_terms_22, top_terms_23, top_terms_24, top_terms_25,
                       align = "hv") %>%
  annotate_figure(., bottom = text_grob("Highest Probability Terms per Topic",
                                        face = "bold", size = 14))

  #Output the figure
png("figures/figure1.png", res = 750, width = 11, height = 8.5, units = "in")
  top_terms
dev.off()
