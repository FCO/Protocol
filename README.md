[![Build Status](https://travis-ci.org/FCO/Protocol.svg?branch=master)](https://travis-ci.org/FCO/Protocol)

Potocol
=======

Description
-----------

The idea here is to have a "set of methods". So, you can test a *class* based on that set of methods. But different from *roles* with stubbed methods it doesn't need do be "*does*ed" to be matched. It does create a subset but using a different syntax, and will check the methods.

Synopsis
--------

```raku
use Protocol;

protocol Writer {               # creates a Writer protocol that have a write method
    method write { ... }
}

sub write(Writer $w) {          # accepts a Writer
    $w.write
}

class JustAGreeter {            # no roles, parents nor protocols declared on the class
    method write {              # it has the write method, so it attends to the protocol
        say "Hello protocol!"
    }
}

write JustAGreeter.new;         # prints: Hello protocol!
```

