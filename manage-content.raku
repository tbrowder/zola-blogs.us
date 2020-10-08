#!/usr/bin/env raku

use File::Find;
use Text::Utils :strip-comment, :normalize-string;

use lib <./lib>;
use Blogs; # local lib

if not @*ARGS.elems {
    say qq:to/HERE/;
    Usage: {$*PROGRAM.IO.basename} build | index [debug]

    Creates various sections and pages for this Zola website.
    HERE
    exit;
}

my $debug = 0;
my $index = 0;
my $draft = 0;
for @*ARGS {
    when /^b/ {
        ; # ok
    }
    when /^i/ {
        $index = 1;
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

