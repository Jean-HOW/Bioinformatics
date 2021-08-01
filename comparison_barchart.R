anno <- read.table("Annotation.csv",
                   header = T,
                   check.names = F,
                   stringsAsFactors = F,
                   sep = ",",
                   na.strings = c("","NA")
                   
melt_anno <- melt(anno,
                  id = `Subsystem Features`)
                  
p1 <- ggplot(melt_anno, aes(y = `Subsystem Features`,
                            x = value,
                            fill = `variable`))+
      geom_bar(stat='identity') +
      scale_fill_brewer(palette = "Dark2") +
      facet_wrap(melt_anno$`variable`) + 
      geom_text(aes(label = paste0(melt_anno$value), x = melt_anno$value),
             vjust = 0.5, size = 3, color = "black" )
 
p1
                   
