surveys %>%
  group_by(genus) %>% 
  summarise_at(.vars = c("hindfoot_length", "weight"), .funs = mean, na.rm = TRUE) %>% 
  print(n = Inf)

# Create a summary table for mean hindfoot_length with some genera
hindfoot_length_join <- surveys %>%
  group_by(genus) %>% 
  summarise(hindfoot_length = mean(hindfoot_length, na.rm = TRUE)) %>% 
  slice(4,8,11)

weight_join <- surveys %>%
  group_by(genus) %>% 
  summarise(weight = mean(weight, na.rm = TRUE)) %>% 
  slice(4,8,15)

hindfoot_length_join
weight_join

left_join(hindfoot_length_join, weight_join, by = "genus")
right_join(hindfoot_length_join, weight_join, by = "genus")
inner_join(hindfoot_length_join, weight_join, by = "genus")
full_join(hindfoot_length_join, weight_join, by = "genus")
