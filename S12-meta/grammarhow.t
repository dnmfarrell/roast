use Test;

grammar Foo {
    token TOP    { <bottom> }
    token bottom {   <?>    }
}

class Foo::Actions {
    method TOP($/) {
        my $grmr := Metamodel::GrammarHOW.new_type(name => 'BNFGrammar');
        $grmr.^add_method('TOP', token { <foo> });
        $grmr.^add_method('foo', $<bottom>.ast[0]);
        $grmr.^compose;
        {
            my $/;
            $grmr.new.parse('bar');
        }
    }

    method bottom($/) {
        make [token { "bar" }]
    }
}

lives_ok { Foo.new.parse('', :actions(Foo::Actions.new)) }

done;
