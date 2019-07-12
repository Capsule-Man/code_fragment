library(dplyr)

# mod

iris %>% mutate(Sepal.Length = Sepal.Length * 2)
iris %>% mutate(Species = case_when(
  Species == "setosa" ~ "s",
  Species == "versicolor" ~ "v1",  
  Species == "virginica" ~ "v2"
))
iris %>% mutate(Species = na_if(Species, "Unknown"))
iris %>% mutate_if(is.numeric, function(x){ x * 2 })
iris %>% select(matches("^(Sepal|Petal)")) %>% mutate_all(function(x){ x * 2 })
iris %>% transmute(Sepal.Length = Sepal.Length * 2)

# select col

iris %>% select(starts_with("Petal"))
iris %>% select(ends_with("Length"))
iris %>% select(contains("th"))
iris %>% select(matches("^(Sepal|Petal)"))

# select row

iris %>% filter(Sepal.Length > 3.0) %>% head()
iris %>% filter(between(Sepal.Length, 3.0, 5.0))
iris %>% filter_all(all_vars(!is.na(.)))
iris %>% filter_if(is.numeric, any_vars(. >= 3.0))
iris %>% filter_if(is.numeric, all_vars(. >= 1.0))
iris %>% filter_at(vars(Species), any_vars(. == "versicolor"))

# order

iris %>% arrange(Sepal.Length, Sepal.Width) %>% head()
iris %>% arrange(desc(Sepal.Length), Sepal.Width) %>% head()
iris %>% group_by(Species) %>% arrange(desc(Sepal.Length), .by_group=TRUE)

# summarise

iris %>% summarise(sum = sum(Petal.Length))
iris %>% summarise(avg = mean(Sepal.Length))
iris %>% group_by(Species) %>% summarise(test = sum(Sepal.Length))

# column -> vector

iris %>% head(10) %>% pull(Species)

# join

temp = iris %>% select(Species) %>% distinct() %>% mutate(id=row_number())
inner_join(iris, temp)
inner_join(iris, temp, c("Species" = "Species"))
