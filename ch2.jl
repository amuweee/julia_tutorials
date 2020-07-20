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
