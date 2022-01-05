# pandoc-fennel

This is an example repository demonstrating how to embed
[Fennel](https://fennel-lang.org/) to be used as a scripting language
for writing [Pandoc](https://pandoc.org/)
filters.

## Rationale

Fennel is a Lisp that compiles to Lua. It can be used in place of
Lua but doing so to write Pandoc filters is not obvious and so I have
put together this repo to demonstrate a basic example.

I prefer writing Lisp rather than Lua. You may too.

Also, I think there are some good patterns stored in this repo for
using Pandoc in general, such as:

1. Use a self-documenting Makefile to kick off tasks.
2. Use config files for different build options.

## Installation and usage

It is assumed that you have installed the correct LaTeX dependencies
for your operation system as well as `pandoc` and `make`.

If this is true, just clone this repository.

Run the following command for a help menu of assorted options:
```
$ make
```

Built files will appear in the `build` directory.

## Writing filters

Please refer to the following documentation for programming in
Fennel:

<https://fennel-lang.org/tutorial>

Please refer to the following documentation for writing Pandoc 
filters in Lua:

<https://pandoc.org/lua-filters.html>

The rest is up to you.

## How does this thing actually work?

The entire Fennel language will be loaded from `filters/fennel.lua`
via the `filters/fennel-loader.lua` script. The loader will import 
our custom filter `filters/myfilter.fnl`. This is setup in the
various build defaults in the `configs` directory. The different 
build options are specified in `Makefile`.

# LICENSE

The Fennel MIT license is included in the `filters` directory. This
repo is also MIT licensed.

