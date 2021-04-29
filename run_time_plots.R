library(tidyverse)

bsl_df = read_csv("results/bsl.csv")
bsl_df$algorithm = "Random Walk Metropolis"

rula_df = read_csv("results/rula.csv")
rula_df$algorithm = "Riemannian ULA"

df = bind_rows(bsl_df, rula_df)

ggplot(df, aes(y = run_time, x = task, col = algorithm)) +
  geom_point() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  labs(y = "run time / s") +
  lims(y = c(0, 10000))

ggsave("plots/run_times.png")


