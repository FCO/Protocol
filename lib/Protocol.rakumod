my package EXPORTHOW {
    package DECLARE {
        use MetamodelX::Protocol;
        constant protocol = MetamodelX::Protocol;
    }
}

sub EXPORT(--> Map()) {
    use Protocol::Type;
    Protocol::Type::
}

=begin pod

=head1 Potocol

=head2 Description

The idea here is to have a "set of methods". So, you can test a *class* based on that set of methods.
But different from *roles* with stubbed methods it doesn't need do be "*does*ed" to be matched.
It's kinda subset but using a different syntax, and will check the methods.
It also can create a coerce type that when coerced, returns the value passed to it mixed in with
a role adding the default implementations of the methods created on the protocol.

=head2 Synopsis

=begin code :lang<raku>

use Protocol;

class Song   { has $.name }
class Person { has $.name }
class Animal { has $.name }

protocol Nameable {
    method name        { ... }
    method description { say "Type: $.^name()\nName: $.name()" }
}

say Song.new(:name("Joao e Maria")) ~~ Nameable[ProtocolSubset];

sub print-description(Nameable[ProtocolCoerce] $a) { $a.description }

print-description .new: :name("my { .^name }") for Song.new, Person.new, Animal.new

# Output:
# ======
#
# True
# Type: Song+Nameable
# Name: my Song
# Type: Person+Nameable
# Name: my Person
# Type: Animal+Nameable
# Name: my Animal

=end code

=end pod
