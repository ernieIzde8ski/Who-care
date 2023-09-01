# Who-care

A teeny tiny wrapper over the [Bible API](https://bible-api.com), in Julia.

## install

- Get Julia
- Run `setup.jl` to install packages, etc
- Run `main.jl`

## examples

    # single verse
    julia main.jl 'john 3:16'
    # abbreviated book name
    julia main.jl 'jn 3:16'
    # verse range
    julia main.jl romans+12:1-2
    # multiple ranges
    julia main.jl 'romans 12:1-2,5-7,9,13:1-9&10'
    # different translation
    julia main.jl -T kjv 'john 3:16'
    # verse numbers
    julia main.jl -n 'john 3:16'
    # json response
    julia main.jl --json john+3:16
