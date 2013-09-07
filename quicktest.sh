#!/bin/bash
source '/Users/rs/.bash_include_rs'

BEEMINDSTRING="/Users/rs/.rvm/gems/ruby-1.9.3-p194/bin/beemind -t UUTnFgjX2FyEyC3GX2zW stories `ruby /Users/rs/rt/pivotal_accepted.rb`"
echo $BEEMINDSTRING
`$BEEMINDSTRING`

