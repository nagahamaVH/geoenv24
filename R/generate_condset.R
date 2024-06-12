library(dplyr)
library(tidyr)
library(ggplot2)

source("./R/nearest_neighbor_functions.R")

set.seed(125)
n <- 20
m <- 3

df <- tibble(x = runif(n), y = runif(n)) |>
  arrange(x) |>
  mutate(id = 1:n)

coords <- select(df, x, y) |>
  as.matrix()

nn_obj <- find_nn(coords, m)

nn <- as_tibble(nn_obj$NN_ind) |>
  mutate(id = 2:n) |>
  pivot_longer(!id, values_to = "neighbor") |>
  filter(neighbor != 0)

size <- 8
alpha <- 0.3
shape <- 21

df_plot <- NULL
for (i in 2:dim(df)[1]) {
  df_i <- df |>
    mutate(
      frame = i,
      node_type = case_when(
        id == i ~ "ref",
        id %in% nn$neighbor[nn$id == i] ~ "neighbor",
        .default = "outsider"
      )
    )
  df_plot <- bind_rows(df_plot, df_i)
}

p <- ggplot(df_plot, aes(x = x, y = y)) +
  geom_text(aes(label = id)) +
  geom_point(aes(fill = node_type, frame = frame), 
             filter(df_plot, node_type == "outsider"), 
             size = size, shape = shape, alpha = alpha, fill = "grey") +
  geom_point(aes(fill = node_type, frame = frame), 
             filter(df_plot, node_type == "neighbor"), 
             size = size, shape = shape, alpha = alpha, fill = "blue") +
  geom_point(aes(fill = node_type, frame = frame), 
             filter(df_plot, node_type == "ref"), 
             size = size, shape = shape, alpha = alpha, fill = "green") +
  labs(title = paste0("n = ", n, ", m = ", m))
# saveRDS(p, "./data/conditional_set.rds")
