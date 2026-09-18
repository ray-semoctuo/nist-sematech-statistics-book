# Generates mpc-bias-target.svg (dartboard depiction of unbiased/biased
# measurements, 2.1.1.3 Bias and Accuracy). Kept as a standalone script
# rather than a visible code chunk in the .qmd, per user request; rerun
# this script (from the book/ directory) to regenerate the SVG.
library(tidyverse)

ring_mpc113 <- function(r, n = 200) {
  theta <- seq(0, 2 * pi, length.out = n)
  tibble(x = r * cos(theta), y = r * sin(theta))
}

ring_radii_mpc113 <- c(1, 0.75, 0.5, 0.25)
ring_fill_mpc113 <- c("white", "#A6C8E0", "#5B90B8", "#2E6089")
processes_mpc113 <- c("Unbiased", "Biased")

# Rings are generated separately per facet (rather than crossed) so that
# each ring's points stay in angular order within its own group --
# tidyr::crossing() would resort rows and break the circular path,
# rendering as jagged stripes instead of filled circles.
rings_mpc113 <- map_dfr(processes_mpc113, function(p) {
  map2_dfr(ring_radii_mpc113, seq_along(ring_radii_mpc113), function(r, i) {
    ring_mpc113(r) |> mutate(ring = i)
  }) |> mutate(process = p)
})

set.seed(20240613)
n_target_mpc113 <- 40
target_demo_mpc113 <- bind_rows(
  tibble(x = rnorm(n_target_mpc113, 0, 0.12), y = rnorm(n_target_mpc113, 0, 0.12), process = "Unbiased"),
  tibble(x = rnorm(n_target_mpc113, 0.4, 0.12), y = rnorm(n_target_mpc113, 0.4, 0.12), process = "Biased")
)
center_mpc113 <- tibble(x = 0, y = 0, process = processes_mpc113)

p <- ggplot() +
  geom_polygon(data = rings_mpc113, aes(x, y, group = interaction(ring, process), fill = factor(ring)), color = "white") +
  scale_fill_manual(values = ring_fill_mpc113, guide = "none") +
  geom_point(data = center_mpc113, aes(x, y), shape = 3, size = 3, color = "firebrick") +
  geom_point(data = target_demo_mpc113, aes(x, y), color = "#1B1B1B", size = 1.6, alpha = 0.8) +
  facet_wrap(~process) +
  coord_equal(xlim = c(-1.15, 1.15), ylim = c(-1.15, 1.15)) +
  theme_void() +
  theme(
    strip.text = element_text(size = 12, face = "bold", margin = margin(b = 2)),
    panel.spacing = unit(1, "lines")
  )

ggsave("chapters/02-mpc/characterization/images/mpc-bias-target.svg", p, width = 7, height = 3.75, device = "svg")
