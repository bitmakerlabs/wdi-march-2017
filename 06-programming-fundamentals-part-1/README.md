# Ruby FUNdamentals, part 1

Ruby is the primary programming language we'll be learning in this course. Ruby was created by Yukihiro Matsumoto aka Matz in 1995.

Matz set out to design a language that emphasized human needs over those of the computer, which is why Ruby is so easy to pick up. Not only is it easy to learn, but has also become very popular for building web applications, thanks to Rails.

## Agenda
After this lesson, you will know:

  * [What is Ruby?](#what-is-ruby)
  * How to run Ruby programs
    * `ruby`
    * `irb`
  * [Basic Data Types](#basic-data-types)
    * Numbers
    * String
    * Booleans
    * Symbols
  * [Variables and assignment](#variables)
    * Constants
  * [Flow Control structures](#flow-control-structures)
    * Conditional statements
    * Loops
    * Simple iterators

## What is Ruby?
  * High-level
  * Written in C
  * Interpreted (vs. compiled)
  * Object-Oriented
  * Dynamically-typed

Find info about every Ruby data type in the [Ruby docs](http://ruby-doc.org/core-2.3.0/)!

## Basic Data Types
Data types are basic building blocks of programming languages. Programs are constructed by using these basic types to build up larger and more complex things, similar to how we combine words into sentences to convey deeper meaning than the words on their own.

### Numbers
How we represent numeric data in our programs

  * Integers
  * Floats

### Strings
How we represent text data in our programs

  * Single quotes (`''`) vs. double quotes (`""`)
  * String interpolation
  * Escape quotes with `\`

### Booleans
How we represent truthiness in our programs

  * Every programming language has it's own notion of what is true and what is false
  * We often refer to this as **truthiness** (or something being **truthy**) and **falsiness** (or something being **falsy**)
  * `true`
  * `false`
  * `nil` also evaluates to **false** in Ruby

### Symbols
  * Symbols represent names without values
  * They're often used to refer to other named objects

## Variables
Allow us to give data a name and remember its value for use later in our program

  * Use `=` to assign values, not `==` (comparison)
  * Should be defined with letters, numbers and `_`

### Constants
  * Should be defined in ALL_CAPS
  * Issues a warning if they are changed

## Flow Control structures
As our programs execute, we often need to control the flow of execution. This means making decisions about which path to take, as well as repeating a block of code a fixed number of times.

### Conditional statements
Allow us to perform different tasks based on one or more conditions

  * `if`, `elsif`, `unless`
  * Ternary operator
  * `case` / `when`

### Loops
Allow us to repeat a sequence of steps a fixed number of times

  * `while`
  * `until`

#### Simple iterators
The most common scenario where you want to repeat a sequence of steps is when you have a list of things and you want to do something once for every item in the list.

We call the process of running a block of code once for each item in a list **iteration**.
