use Test;

plan 19;

use Protocol;

use-ok "Protocol";

lives-ok { protocol Bla {} };

eval-dies-ok Q[protocol Ble { method ble {} }];

eval-dies-ok Q[protocol Ble { method ble {}; method bli { ... } } ];

lives-ok {
    protocol Writer {
        method write { ... }
    }
}

ok class W { method write {} } ~~ Writer;

ok W.new ~~ Writer;

my Writer $w;

lives-ok { $w = W };
lives-ok { $w = W.new };
dies-ok  { $w = 42 };

multi a(Writer $w) { can-ok $w, "write" }
multi a($w)        { ok not $w.^can: "write" }

.&a for |^5, W, W.new, class W2 {has $.write}, W2.new;
