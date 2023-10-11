
# -----------------------------------------------------------------------------
# PCA plot
# -----------------------------------------------------------------------------

if(!dir.exists(file.path("figures/"))) dir.create(file.path("figures/"))

  #The plot
topic.pca <- PCA(tweets[,1:25], scale.unit = T, graph = F)
topic.pca$eig 
rownames(topic.pca$var$coord) <- paste0("T", 1:25)

colors <- matrix(nrow = 25, ncol = 1) %>% as.data.frame()
colors$V1[rownames(topic.pca$var$coord) %in% c("T1","T3","T9")] <- "Educating on Healthy Habits"
colors$V1[rownames(topic.pca$var$coord) %in% c("T2","T5","T6",
                                               "T8","T11","T14",
                                               "T17","T20","T21",
                                               "T22","T25")] <- "Climate Change"
colors$V1[rownames(topic.pca$var$coord) %in% c("T4","T7","T16","T18",
                                               "T19","T23")] <- "Environmental Protection and Conservation"
colors$V1[rownames(topic.pca$var$coord) %in% c("T10","T12","T13")] <- "Donations & Giving"
colors$V1[rownames(topic.pca$var$coord) %in% c("T15","T24")] <- "Clean Energy"

pca.plot <-
  
  fviz_pca_var(topic.pca, pointshape = 21,
               repel = T, geom = "point",
               fill.var = colors$V1,
               palette = c("#55b748","#1696d2","#fdbf11",
                           "#ec008b","#5c5859"),
               pointsize = 5, alpha.var = .7) +
  
  labs(title="", x="Dimension #1 (9.57%)", y="Dimension #2 (7.18%)",
       fill = "Topic Area") +
  
  guides(fill = guide_legend(ncol = 2)) +
  
  theme(axis.title = element_text(face = "bold"),
        legend.title = element_text(face = "bold"),
        legend.position = "bottom")

png("figures/figure2.png", width = 8, height = 6, res = 750, units = "in")
  pca.plot
dev.off()
