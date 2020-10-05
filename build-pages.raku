#!/usr/bin/env raku

use File::Find;
use Text::Utils :strip-comment, :normalize-string;

if not @*ARGS.elems {
    say qq:to/HERE/;
    Usage: {$*PROGRAM.IO.basename} go

    Builds the landing (HOME) page for this Zola website.
    HERE
    exit;
}

