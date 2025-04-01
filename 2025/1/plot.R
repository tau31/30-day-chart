# comparisons/fracions

library(ggplot2)
library(extrafont)
library(ggtext)
font_import()

strawberry <- data.frame(
  Rs = as.character(c(1, 2, 3)),
  chatgpt = as.character(c(1, 1, "You")),
  y = c("y_intercept")
)

# strong #E32E34
# weak #FC9FB1

p <- ggplot(strawberry, aes(x = Rs, y = y, fill = chatgpt)) +
  geom_tile(color = "white", linejoin = "bevel", linewidth = 4) +
  coord_equal() +
  scale_x_discrete(
    breaks = c("1", "2", "3")
  ) +
  scale_fill_manual(
    values = c("#E32E34", "#FC9FB1"),
    labels = c("GPT-4o", "You")
  ) +
  labs(
    title = "How many R letters are in the word \"strawberry?\"",
    caption = "By Tiago Cabaço (github.com/tau31)"
  ) +
  theme_minimal() +
  theme(
    panel.grid = element_blank(),
    legend.position = "bottom",
    legend.key.width = unit(1, "cm"),
    legend.key.height = unit(1, "cm"),
    legend.text = element_text(
      size = 20,
    ),
    legend.title = element_blank(),
    axis.text.y = element_blank(),
    axis.text.x = element_text(size = 25),
    axis.title = element_blank(),
    text = element_text(family = "Lato"),
    plot.title = element_markdown(size = 35, face = "bold", hjust = .5),
    plot.caption = element_markdown(face = "italic", size = 20)
  )


ggsave(p, device = "png", filename = "2025/1/day1.png", height = 7, width = 13, bg = "white")
