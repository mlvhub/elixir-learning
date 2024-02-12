hello = fn -> "Hello, world!" end

add = fn a, b -> a + b end

# short-hand with capture operator
add = &(&1 + &2)
