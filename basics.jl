# Defining Variables
book = "Julia by Example"
pi = 3.14
ANSWER = 42
my_first_name = "mbai"


## CONSTANTS (immutable vars)
# Attempting to change constants with same object type will result in warning
# different type will result in error
const firstmonth = "January"
const mealoption = "vegetarian"
const amount = 10.25
# constant amount is a float so redefining to 10 as intger will return error


# Multiline comments
#=
    this is a multiline comment
    ignore by runtime and executions
=#


## STRINGS
"This is a string"
"This is how to \"escape quotes within\"."
"""Triple quote strings "are better" for escaping quotes."""
"""
            Can
        Also
    Do
This with triple quotes."""


# Concatenate strings
"Hello " * "World!"
string("Itsy", " ", "Bitches", " ", "Spider")
username = "amuweee"
greeting = "Hellow There!"
greeting * " " * username

userid = 987564
string(greeting, " ", userid)


# Interpolating strings
# user $ symbol to perform variable Interpolation
"$greeting, $username"
"$(uppercase(greeting)) $(reverse(username))"
"The sum of 1 and 2 is: $(1 + 2)"


# String manipulation
str = "Nice to meet you"
str[1]
# note that julia is 1-based index. first element is 1 not 0
str[9:11]
str[1:1] # returns string
str[1] # returns char
str[1:1] == str[1] # false


# Unicode and UTF-8
unicode = "rêve"
unicode[1] # r
unicode[2] # ê
unicode[3] # error because ê takes two bytes
unicode[4] # e
# recommended way to slice is to use iterables
for s in unicode
    println(s)
end
unicode[end] # last item
unicode[end-1:end]


## REGEX
reg = r"[0-9]+"
match(reg, "It was 1970")
Regex("[0-9]+") == reg
occursin(r"hello", "It was 1970") # false
occursin(r"70", "It was 1970") # true


# raw string literals
# string that do not perform interpoation or escaping
raw"This $will work"


## NUMBERS

# integers
i = 42
typeof(i)

# float
f = 3.14
typeof(f)
# use _ for readability
1_000_000
0.000_000_005

# rational numbers
3 // 2
1 // 2 + 2 // 4
Int(1 // 1)
float(1 // 3)

# numerical operators
a = 2
a *= 3
a ^= 2
a += 4
# chaining comparisons
10 > 5 < 6 == 6 >= 3 != 2

# vetorized dot operators
first_five_fib = [1, 1, 2, 3, 5]
first_five_fib .^ 2


## TUPLES
# any length and any types - immutable
("a", 4, 12.5)
(1,) # must have comma
'e', 2 # can leave off parathesis
lang = ("Julia", v"1.0")
lang[2]
# dot operation
(3, 4) .+ (1, 1)

# Named Tuples
skills = (language = "Julia", version = v"1.0")
skills.language
skills[1]


## RANGES
r = 1:20
abc = 'a':'z'
abc[10]
abc[end]
# use ranges to make tuple
(1:20...,)
[1:20...]
# set different increments
(0:5:20...,)
(20:-5:-20...,)
(0.5:10...,)
# use collect() to turn ranges to array
collect(0.5:0.5:10)


## ARRAYS
[1, 2, 3]
Float32[1, 2, 3, 4]
# matrices
[1 2 3; 4 5 6; 7 8 9]
# matrix constructors
zeros(Int, 2)
zeros(Float64, 3)
ones(2)
ones(Int, 2)
ones(Int, 3, 4)
trues(2)
falses(3, 3)
rand(Int, 4, 2)
rand(Char, 5, 5)
fill(42, 2, 4)
# accessing values
arr1d = rand(5)
arr1d[5]
arr2d = rand(5, 5)
arr2d[4, 1]
arr2d[1:3, 3:5] # slices
arr2d[:, 3:5]
# assign values
arr2d[1, 1] = 0.0


## ITERATIONS
for person in ["Alison", "James", "Cohen"]
    println("Hello $person")
end

people = ["Alison", "James", "Cohen"]

for i in eachindex(people)
    println("$i. $(people[i])")
end


## MUTATING ARRAYS
arr = [1, 2, 3]
push!(arr, 4)
arr
push!(arr, 5, 6, 7)
arr
# the ! notation is a convention to warn that functing is modify the data
pop!(arr) # remove last
deleteat!(arr, 3) # remove at index

# when arrays are assigned to a variable, it is not a copy
arr = [1,2,3]
arr2 = arr
pop!(arr2) # this will modify both arr and arr2
arr == arr2 #true

# use copy() to create new binding
arr2 = copy(arr)
pop!(arr2)
arr == arr2 #false


## COMPREHENSIONS
[x += 1 for x = 1:5]
Float64[x += 1 for x = 1:5]
[x += y for x = 1:5, y = 11:15] # 5x5 matrix
[x += 1 for x = 1:10 if x/2 > 3]


## GENERATORS
# defined just like comprehensions but without square brackets
(x += 1 for x = 1:10)

# benchmarks vs comprehensions
@time for i in [x^3 for x=1:1_000_000] #comp
    i >= 1_000 && break
    println(i)
end

@time for i in (x^3 for x=1:1_000_000) # gen
    i >= 1_000 && break
    println(i)
end
