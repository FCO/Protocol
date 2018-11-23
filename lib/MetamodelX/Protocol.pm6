use X::Protocol::NonStubs;
unit class MetamodelX::Protocol is Metamodel::SubsetHOW is Metamodel::ClassHOW;

method new_type(:$name = "<anon>") {
    my $type;
    $type := callwith :$name, :refinee(Any), :refinement{ .^methods>>.name.any eq $type.^methods>>.name.all }
    $type
}

method compose(\type) {
    my @non-stubs = type.^methods.grep(not *.yada)>>.name;
    die X::Protocol::NonStubs.new: :@non-stubs, :protocol-name(type.^name) if @non-stubs
}
