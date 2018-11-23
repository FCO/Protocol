# Potocol

## Description

The idea here is to have a "set of methods". So, you can test a *class* based on that set of methods.
But different from *roles* with stubed methods it doesn't need do be "*does*ed" to be matched.
It does create a subset but using a different syntax, and will check the methods.

## Synopsis

```perl6
use Protocol;

protocol Writer {
    method write { ... }
}

multi write(Writer $w) {
    $w.write
}

multi write($data) {
    say $data
}

class JustAGreeter {            # no roles, parents nor protocols declared on the class
    method write {              # it has the write method, so it attends to the protocol
        say "Hello protocol!"
    }
}

write JustAGreeter.new;         # prints: Hello protocol!

```
