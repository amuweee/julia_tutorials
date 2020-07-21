using RDatasets
using Statistics


iris = dataset("datasets", "iris")
names(iris) # columns
size(iris) # shape
first(iris, 5)
last(iris, 10)

# groupby count of species
iris_grouped = groupby(iris, :Species) # : <- used as prefix for columns
combine(iris_grouped, nrow)

describe(iris)
describe(iris, :all)
# manually by using Statistics
mean(iris[!, 1]) # col_index
std(iris[!, 1])

# finding correlations
for x in names(iris)[1:end-1]
    for y in names(iris)[1:end-1]
        println("$x \t $y \t $(cor(iris[!, x], iris[!, y]))")
    end
    println("----------------------")
end

# finding covariance
for x in names(iris)[1:end-1]
    for y in names(iris)[1:end-1]
        println("$x \t $y \t $(cov(iris[!, x], iris[!, y]))")
    end
    println("----------------------")
end

# get random values
rand(iris[!, :SepalLength], 5)
