using RDatasets
using Statistics
using Gadfly
using CSV
using Feather


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

# convert DataFrame into matrix
irisarr = convert(Array, iris[:,:])


# Visualizing using Gadfly
plot(iris, x=:SepalLength, y=:PetalLength, color=:Species)
plot(iris, x=:Species, y=:PetalLength, Geom.boxplot)
plot(iris, x=:PetalLength, color=:Species, Geom.histogram)
plot(iris, x=:PetalWidth, color=:Species, Geom.histogram)
plot(iris, x=:PetalWidth, y=:PetalLength, color=:Species)


# saving and loading
# df slices
iris[1:3, [:PetalLength, :PetalWidth]]

# select a df section by applying bool filters
test_data = iris[rand(150) .<= 0.1, [:PetalLength, :PetalWidth, :Species]]
# assigning a random values between 0 and 1, and get a condition
# so that 10% of total is returned as True, thus sliced for our selection


# Saving files
CSV.write("iris_test_data.csv", test_data)
td = CSV.read("iris_test_data.csv")

# Save to feather format
Feather.write("iris_test_data.feather", test_data)
td = Feather.read("iris_test_data.feather")
