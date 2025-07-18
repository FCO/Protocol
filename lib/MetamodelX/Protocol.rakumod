use Protocol::Type;
unit class MetamodelX::Protocol is Metamodel::ClassHOW;

has @.yada;

role ParentRole[$parent, ::Type] {
    ::?CLASS.^add_parent: $parent;
    ::?CLASS.HOW does my role Named { method name($) { "{Type.^name}+{$parent.^name}" } }
}

role Protocolable {
    multi method COERCE(Any \value where { .^methods>>.name.any ~~ $.HOW.yada.all }) {
        my $parent = self.WHAT;
        value but ParentRole[$parent, value];
    }
}

method new_type(:$name = "<anon>") {
    my $target_type := callsame;
    $target_type.^add_role: Protocolable;
    $target_type
}

multi method parameterize($type, ProtocolClass) {
    $type
}

multi method parameterize($type, ProtocolSubset) {
    my @yada = @!yada;
    my subset ProtocolSubset of Any where { .^methods>>.name.any ~~ @yada.all };
}

multi method parameterize($type, ProtocolCoerce) {
    Metamodel::CoercionHOW.new_type: $type.WHAT, $type.^parameterize: ProtocolSubset
}

multi method add_method(Mu, $name, & where { .yada }) {
    @!yada.push: $name
}

multi method add_method(|c) { nextsame }
