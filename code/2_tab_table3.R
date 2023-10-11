
# -----------------------------------------------------------------------------
# Top terms per topic
# -----------------------------------------------------------------------------

  # Put climate change mission statements together
ms.data$MissionRecode <- recode(ms.data$MissionRecode, 
                                `Climate change - but slogan is different` = "Climate change",
                                `Climate change - but saving life on earth` = "Climate change",
                                .default = ms.data$MissionRecode)
  # The table
CrossTable(ms.data$MissionRecode)
