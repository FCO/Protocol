class X::Protocol::NonStubs is Exception {
    has Str $.protocol-name;
    has Str @.non-stubs;

    method message { "Protocol $!protocol-name has non-stubed methods: { @!non-stubs.join: ", " }" }
}

