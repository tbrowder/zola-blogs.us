#!/usr/bin/env raku

use File::Find;
use Text::Utils :strip-comment, :normalize-string;

if not @*ARGS.elems {
    say qq:to/HERE/;
    Usage: {$*PROGRAM.IO.basename} go

    Creates various sections and pages for this Zola website.
    HERE
    exit;
}

for @*ARGS {
    when /^g/ {
        ; # ok
    }
    default {
        note "FATAL: Unrecognized arg '$_'";
        exit;
    }
}

# collect blog info and create the home page
my @blogs = find :dir<AUTHORS>, :name(/'.md'$/);
say "DEBUG: found src blog files:";
say "  $_" for @blogs.sort;

