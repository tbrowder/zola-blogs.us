#!/usr/bin/env raku

use File::Find;
use Text::Utils :strip-comment, :normalize-string;
use DB::SQLite;

if not @*ARGS.elems {
    say qq:to/HERE/;
    Usage: {$*PROGRAM.IO.basename} go

    Creates various sections and pages for this Zola website.
    HERE
    exit;
}

my $debug = 0;
for @*ARGS {
    when /^g/ {
        ; # ok
    }
    when /^d/ {
        $debug = 1;
    }
    default {
        note "FATAL: Unrecognized arg '$_'";
        exit;
    }
}

# collect blog and author info and ensure uniqueness
# and immutable order of posting
coll-blog-data :dir<AUTHORS>, :$debug;

=begin comment
# collect blog info and create the home page
my @blogs = find :dir<AUTHORS>, :name(/'.md'$/);
say "DEBUG: found src blog files:";
say "  $_" for @blogs.sort;
=end comment

##### SUBROUTINES #####
sub get-auth-data($f, :$debug) {
}

sub coll-blog-data(:$dir, :$debug) {
    my @authors = find :$dir, :name(/'.dat'$/), :type<file>;
    say "DEBUG: authors:" if $debug;
    for @authors.sort -> $f {
        # extract the author data from the 'NAME.dat'
        my $author-file = $f.IO.basename;
        my $author = '';
        if $author-file ~~ / (\S+) '.dat' $/ {
            $author = ~$0; 
            say "  $author" if $debug;
        }
        # read the auth file
        get-auth-data $f, :$debug;
    }

    say "DEBUG: blogs:" if $debug;
    my @blogs = find :$dir, :name(/'.md'$/), :exclude(/README/), :type<file>;
    for @blogs.sort -> $f {
        say "  $f" if $debug;
        # extract the blog data
        my $author = '';
        my $blog-title = $f.IO.basename;
        if $f ~~ / 'AUTHORS/' ( \S+ ) '/' \S+ '.md' $/ {
            $author = ~$0; 
            say "  $author" if $debug;
        }
    }

}

