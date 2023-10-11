
# -----------------------------------------------------------------------------
# Top Ten Organizations by Mean Probability of Climate Change Tweet AND
# The Evolution of Climate Change Related Tweets by EPCNs from 2008 to 2021
# -----------------------------------------------------------------------------

if(!dir.exists(file.path("figures/"))) dir.create(file.path("figures/"))

  #Make the summary tables
by_year_2 <- tweets %>%
  # filter(username != "oof") %>%
  # filter(year != 2007) %>%
  group_by(year) %>%
  summarize(mean = mean(V2),
            sd = sd(V2)) %>%
  ggplot(aes(x = year, y = mean)) +
  geom_point() +
  geom_line() +
  # geom_errorbar(aes(ymin = (mean - sd), ymax = (mean + sd))) +
  theme_bw() +
  xlab("") +
  ylab("Topic #2") +
  ylim(0,.1) +
  scale_x_continuous(breaks = seq(2006, 2021, 3)) +
  theme(axis.title = element_text(face = "bold"))

by_org_2 <- tweets %>%
  # filter(username != "oof") %>%
  # filter(year != 2007) %>%
  group_by(username) %>%
  summarize(mean = mean(V2),
            sd = sd(V2)) %>%
  arrange(desc(mean)) %>%
  top_n(10) %>%
  ggplot(aes(x = mean, y = reorder(username, mean))) +
  geom_bar(stat = "identity", color = "black") +
  # geom_line() +
  # geom_errorbar(aes(ymin = (mean - sd), ymax = (mean + sd))) +
  theme_bw() +
  xlab("Topic #2") +
  ylab("") +
  theme(axis.title = element_text(face = "bold"),
        axis.text.y = element_text(size = 10),
        axis.text.x = element_text(size = 6)) +
  scale_x_continuous(expand = c(0,0), limits = c(0,.27))

by_year_5 <- tweets %>%
  # filter(username != "oof") %>%
  # filter(year != 2007) %>%
  group_by(year) %>%
  summarize(mean = mean(V5),
            sd = sd(V5)) %>%
  ggplot(aes(x = year, y = mean)) +
  geom_point() +
  geom_line() +
  # geom_errorbar(aes(ymin = (mean - sd), ymax = (mean + sd))) +
  theme_bw() +
  xlab("") +
  ylab("Topic #5") +
  ylim(0,.1) +
  scale_x_continuous(breaks = seq(2006, 2021, 3)) +
  theme(axis.title = element_text(face = "bold"))

by_org_5 <- tweets %>%
  # filter(username != "oof") %>%
  # filter(year != 2007) %>%
  group_by(username) %>%
  summarize(mean = mean(V5),
            sd = sd(V5)) %>%
  arrange(desc(mean)) %>%
  top_n(10) %>%
  ggplot(aes(x = mean, y = reorder(username, mean))) +
  geom_bar(stat = "identity", color = "black") +
  # geom_line() +
  # geom_errorbar(aes(ymin = (mean - sd), ymax = (mean + sd))) +
  theme_bw() +
  xlab("Topic #5") +
  ylab("") +
  theme(axis.title = element_text(face = "bold"),
        axis.text.y = element_text(size = 10),
        axis.text.x = element_text(size = 6)) +
  scale_x_continuous(expand = c(0,0), limits = c(0,.27))

by_year_6 <- tweets %>%
  # filter(username != "oof") %>%
  # filter(year != 2007) %>%
  group_by(year) %>%
  summarize(mean = mean(V6),
            sd = sd(V6)) %>%
  ggplot(aes(x = year, y = mean)) +
  geom_point() +
  geom_line() +
  # geom_errorbar(aes(ymin = (mean - sd), ymax = (mean + sd))) +
  theme_bw() +
  xlab("") +
  ylab("Topic #6") +
  ylim(0,.1) +
  scale_x_continuous(breaks = seq(2006, 2021, 3)) +
  theme(axis.title = element_text(face = "bold"))

by_org_6 <- tweets %>%
  # filter(username != "oof") %>%
  # filter(year != 2007) %>%
  group_by(username) %>%
  summarize(mean = mean(V6),
            sd = sd(V6)) %>%
  arrange(desc(mean)) %>%
  top_n(10) %>%
  ggplot(aes(x = mean, y = reorder(username, mean))) +
  geom_bar(stat = "identity", color = "black") +
  # geom_line() +
  # geom_errorbar(aes(ymin = (mean - sd), ymax = (mean + sd))) +
  theme_bw() +
  xlab("Topic #6") +
  ylab("") +
  theme(axis.title = element_text(face = "bold"),
        axis.text.y = element_text(size = 10),
        axis.text.x = element_text(size = 6)) +
  scale_x_continuous(expand = c(0,0), limits = c(0,.27))

by_year_8 <- tweets %>%
  # filter(username != "oof") %>%
  # filter(year != 2007) %>%
  group_by(year) %>%
  summarize(mean = mean(V8),
            sd = sd(V8)) %>%
  ggplot(aes(x = year, y = mean)) +
  geom_point() +
  geom_line() +
  # geom_errorbar(aes(ymin = (mean - sd), ymax = (mean + sd))) +
  theme_bw() +
  xlab("") +
  ylab("Topic #8") +
  ylim(0,.1) +
  scale_x_continuous(breaks = seq(2006, 2021, 3)) +
  theme(axis.title = element_text(face = "bold"))

by_org_8 <- tweets %>%
  # filter(username != "oof") %>%
  # filter(year != 2007) %>%
  group_by(username) %>%
  summarize(mean = mean(V8),
            sd = sd(V8)) %>%
  arrange(desc(mean)) %>%
  top_n(10) %>%
  ggplot(aes(x = mean, y = reorder(username, mean))) +
  geom_bar(stat = "identity", color = "black") +
  # geom_line() +
  # geom_errorbar(aes(ymin = (mean - sd), ymax = (mean + sd))) +
  theme_bw() +
  xlab("Topic #8") +
  ylab("") +
  theme(axis.title = element_text(face = "bold"),
        axis.text.y = element_text(size = 10),
        axis.text.x = element_text(size = 6)) +
  scale_x_continuous(expand = c(0,0), limits = c(0,.27))

by_year_11 <- tweets %>%
  # filter(username != "oof") %>%
  # filter(year != 2007) %>%
  group_by(year) %>%
  summarize(mean = mean(V11),
            sd = sd(V11)) %>%
  ggplot(aes(x = year, y = mean)) +
  geom_point() +
  geom_line() +
  # geom_errorbar(aes(ymin = (mean - sd), ymax = (mean + sd))) +
  theme_bw() +
  xlab("") +
  ylab("Topic #11") +
  ylim(0,.1) +
  scale_x_continuous(breaks = seq(2006, 2021, 3)) +
  theme(axis.title = element_text(face = "bold"))

by_org_11 <- tweets %>%
  # filter(username != "oof") %>%
  # filter(year != 2007) %>%
  group_by(username) %>%
  summarize(mean = mean(V11),
            sd = sd(V11)) %>%
  arrange(desc(mean)) %>%
  top_n(10) %>%
  ggplot(aes(x = mean, y = reorder(username, mean))) +
  geom_bar(stat = "identity", color = "black") +
  # geom_line() +
  # geom_errorbar(aes(ymin = (mean - sd), ymax = (mean + sd))) +
  theme_bw() +
  xlab("Topic #11") +
  ylab("") +
  theme(axis.title = element_text(face = "bold"),
        axis.text.y = element_text(size = 10),
        axis.text.x = element_text(size = 6)) +
  scale_x_continuous(expand = c(0,0), limits = c(0,.27))

by_year_14 <- tweets %>%
  # filter(username != "oof") %>%
  # filter(year != 2007) %>%
  group_by(year) %>%
  summarize(mean = mean(V14),
            sd = sd(V14)) %>%
  ggplot(aes(x = year, y = mean)) +
  geom_point() +
  geom_line() +
  # geom_errorbar(aes(ymin = (mean - sd), ymax = (mean + sd))) +
  theme_bw() +
  xlab("") +
  ylab("Topic #14") +
  ylim(0,.1) +
  scale_x_continuous(breaks = seq(2006, 2021, 3)) +
  theme(axis.title = element_text(face = "bold"))

by_org_14 <- tweets %>%
  # filter(username != "oof") %>%
  # filter(year != 2007) %>%
  group_by(username) %>%
  summarize(mean = mean(V14),
            sd = sd(V14)) %>%
  arrange(desc(mean)) %>%
  top_n(10) %>%
  ggplot(aes(x = mean, y = reorder(username, mean))) +
  geom_bar(stat = "identity", color = "black") +
  # geom_line() +
  # geom_errorbar(aes(ymin = (mean - sd), ymax = (mean + sd))) +
  theme_bw() +
  xlab("Topic #14") +
  ylab("") +
  theme(axis.title = element_text(face = "bold"),
        axis.text.y = element_text(size = 10),
        axis.text.x = element_text(size = 6)) +
  scale_x_continuous(expand = c(0,0), limits = c(0,.27))

by_year_17 <- tweets %>%
  filter(username != "oof") %>%
  filter(year != 2007) %>%
  group_by(year) %>%
  summarize(mean = mean(V17),
            sd = sd(V17)) %>%
  ggplot(aes(x = year, y = mean)) +
  geom_point() +
  geom_line() +
  # geom_errorbar(aes(ymin = (mean - sd), ymax = (mean + sd))) +
  theme_bw() +
  xlab("") +
  ylab("Topic #17") +
  ylim(0,.1) +
  scale_x_continuous(breaks = seq(2006, 2021, 3)) +
  theme(axis.title = element_text(face = "bold"))

by_org_17 <- tweets %>%
  filter(username != "oof") %>%
  filter(year != 2007) %>%
  group_by(username) %>%
  summarize(mean = mean(V17),
            sd = sd(V17)) %>%
  arrange(desc(mean)) %>%
  top_n(10) %>%
  ggplot(aes(x = mean, y = reorder(username, mean))) +
  geom_bar(stat = "identity", color = "black") +
  # geom_line() +
  # geom_errorbar(aes(ymin = (mean - sd), ymax = (mean + sd))) +
  theme_bw() +
  xlab("Topic #17") +
  ylab("") +
  theme(axis.title = element_text(face = "bold"),
        axis.text.y = element_text(size = 10),
        axis.text.x = element_text(size = 6)) +
  scale_x_continuous(expand = c(0,0), limits = c(0,.27))

by_year_20 <- tweets %>%
  # filter(username != "oof") %>%
  # filter(year != 2007) %>%
  group_by(year) %>%
  summarize(mean = mean(V20),
            sd = sd(V20)) %>%
  ggplot(aes(x = year, y = mean)) +
  geom_point() +
  geom_line() +
  # geom_errorbar(aes(ymin = (mean - sd), ymax = (mean + sd))) +
  theme_bw() +
  xlab("") +
  ylab("Topic #20") +
  ylim(0,.1) +
  scale_x_continuous(breaks = seq(2006, 2021, 3)) +
  theme(axis.title = element_text(face = "bold"))

by_org_20 <- tweets %>%
  # filter(username != "oof") %>%
  # filter(year != 2007) %>%
  group_by(username) %>%
  summarize(mean = mean(V20),
            sd = sd(V20)) %>%
  arrange(desc(mean)) %>%
  top_n(10) %>%
  ggplot(aes(x = mean, y = reorder(username, mean))) +
  geom_bar(stat = "identity", color = "black") +
  # geom_line() +
  # geom_errorbar(aes(ymin = (mean - sd), ymax = (mean + sd))) +
  theme_bw() +
  xlab("Topic #20") +
  ylab("") +
  theme(axis.title = element_text(face = "bold"),
        axis.text.y = element_text(size = 10),
        axis.text.x = element_text(size = 6)) +
  scale_x_continuous(expand = c(0,0), limits = c(0,.27))

by_year_21 <- tweets %>%
  # filter(username != "oof") %>%
  # filter(year != 2007) %>%
  group_by(year) %>%
  summarize(mean = mean(V21),
            sd = sd(V21)) %>%
  ggplot(aes(x = year, y = mean)) +
  geom_point() +
  geom_line() +
  # geom_errorbar(aes(ymin = (mean - sd), ymax = (mean + sd))) +
  theme_bw() +
  xlab("") +
  ylab("Topic #21") +
  ylim(0,.1) +
  scale_x_continuous(breaks = seq(2006, 2021, 3)) +
  theme(axis.title = element_text(face = "bold"))

by_org_21 <- tweets %>%
  # filter(username != "oof") %>%
  # filter(year != 2007) %>%
  group_by(username) %>%
  summarize(mean = mean(V19),
            sd = sd(V19)) %>%
  arrange(desc(mean)) %>%
  top_n(10) %>%
  ggplot(aes(x = mean, y = reorder(username, mean))) +
  geom_bar(stat = "identity", color = "black") +
  # geom_line() +
  # geom_errorbar(aes(ymin = (mean - sd), ymax = (mean + sd))) +
  theme_bw() +
  xlab("Topic #21") +
  ylab("") +
  theme(axis.title = element_text(face = "bold"),
        axis.text.y = element_text(size = 10),
        axis.text.x = element_text(size = 6)) +
  scale_x_continuous(expand = c(0,0), limits = c(0,.27))

by_year_22 <- tweets %>%
  filter(username != "oof") %>%
  filter(year != 2007) %>%
  group_by(year) %>%
  summarize(mean = mean(V22),
            sd = sd(V22)) %>%
  ggplot(aes(x = year, y = mean)) +
  geom_point() +
  geom_line() +
  # geom_errorbar(aes(ymin = (mean - sd), ymax = (mean + sd))) +
  theme_bw() +
  xlab("") +
  ylab("Topic #22") +
  ylim(0,.1) +
  scale_x_continuous(breaks = seq(2006, 2021, 3)) +
  theme(axis.title = element_text(face = "bold"))

by_org_22 <- tweets %>%
  filter(username != "oof") %>%
  filter(year != 2007) %>%
  group_by(username) %>%
  summarize(mean = mean(V22),
            sd = sd(V22)) %>%
  arrange(desc(mean)) %>%
  top_n(10) %>%
  ggplot(aes(x = mean, y = reorder(username, mean))) +
  geom_bar(stat = "identity", color = "black") +
  # geom_line() +
  # geom_errorbar(aes(ymin = (mean - sd), ymax = (mean + sd))) +
  theme_bw() +
  xlab("Topic #22") +
  ylab("") +
  theme(axis.title = element_text(face = "bold"),
        axis.text.y = element_text(size = 10),
        axis.text.x = element_text(size = 6)) +
  scale_x_continuous(expand = c(0,0), limits = c(0,.27))

by_year_25 <- tweets %>%
  # filter(username != "oof") %>%
  # filter(year != 2007) %>%
  group_by(year) %>%
  summarize(mean = mean(V25),
            sd = sd(V25)) %>%
  ggplot(aes(x = year, y = mean)) +
  geom_point() +
  geom_line() +
  # geom_errorbar(aes(ymin = (mean - sd), ymax = (mean + sd))) +
  theme_bw() +
  xlab("") +
  ylab("Topic #25") +
  ylim(0,.1) +
  scale_x_continuous(breaks = seq(2006, 2021, 3)) +
  theme(axis.title = element_text(face = "bold"))

by_org_25 <- tweets %>%
  # filter(username != "oof") %>%
  # filter(year != 2007) %>%
  group_by(username) %>%
  summarize(mean = mean(V25),
            sd = sd(V25)) %>%
  arrange(desc(mean)) %>%
  top_n(10) %>%
  ggplot(aes(x = mean, y = reorder(username, mean))) +
  geom_bar(stat = "identity", color = "black") +
  # geom_line() +
  # geom_errorbar(aes(ymin = (mean - sd), ymax = (mean + sd))) +
  theme_bw() +
  xlab("Topic #25") +
  ylab("") +
  theme(axis.title = element_text(face = "bold"),
        axis.text.y = element_text(size = 10),
        axis.text.x = element_text(size = 6)) +
  scale_x_continuous(expand = c(0,0), limits = c(0,.27))


  #Make single by-org plot
org.plot <- ggarrange(by_org_2, by_org_5, by_org_6, by_org_8, by_org_11, by_org_14, by_org_17, by_org_20,
                      by_org_21, by_org_22, by_org_25, align = "hv") %>%
  annotate_figure(., left = text_grob("Mean Probability of Tweet about Climate Change Topic",
                                      face = "bold", size = 14, rot = 90))

  #Make single by-year plot
year.plot <- ggarrange(by_year_2, by_year_5, by_year_6, by_year_8, by_year_11, by_year_14, by_year_17, by_year_20,
                       by_year_21, by_year_22, by_year_25, align = "hv") %>%
  annotate_figure(., left = text_grob("Mean Probability of Tweet about Climate Change Topic",
                                      face = "bold", size = 14, rot = 90))


  # By org
png("figures/figure3.png", res = 750, width = 11, height = 8.5, units = "in")
  org.plot
dev.off()

  # By year
png("figures/figure4.png", res = 750, width = 11, height = 8.5, units = "in")
  year.plot
dev.off()
