#!/usr/bin/env raku

use File::Find;
use Text::Utils :strip-comment, :normalize-string;

use lib <./lib>;
use Blogs; # local lib

constant $OIDB    = 'data/order-index.dat';
constant $CONTENT = 'content';
constant $AUTHORS = 'AUTHORS';

# the draft users:
constant $Ua = 'joe-cool';
constant $Ub = 'sally-sue';

my $draft = 1;

if not @*ARGS.elems {
    if $draft {
        say "======================================================";
        say "WARNING: option 'draft' is currently the default state";
        say "======================================================";
    }

    print qq:to/HERE/;
    Usage: {$*PROGRAM.IO.basename} build | index [debug draft]

    Creates various sections and pages for this Zola website.

    Modes
        build - rewrites Markdown files in the '$CONTENT' directory
        index - checks and updates the order index database file '$OIDB'-

    Options
        draft - uses the test users '$Ua' and '$Ub' for building the site
                also shows 'SITE UNDER CONTSTRUCTION' warning
        debug - for developer use
    HERE
    if $draft {
        say "======================================================";
        say "WARNING: option 'draft' is currently the default state";
        say "======================================================";
    }
    exit;
}

my $debug = 0;
my $index = 0;
for @*ARGS {
    when /^b/ {
        ; # ok
    }
    when /^i/ {
        $index = 1;
    }
    when /^de/ {
        $debug = 1;
    }
    when /^dr/ {
        $draft = 1;
    }
    default {
        note "FATAL: Unrecognized arg '$_'";
        exit;
    }
}

# collect blog and author info and ensure uniqueness
# and immutable order of posting
if $index {
    say "Checking and updating the order index database: '$OIDB'";
    check-index :dbIO($OIDB.IO), :$debug;
    exit;
}

coll-blog-data :dir<AUTHORS>, :$draft, :$debug;

=begin comment
# collect blog info and create the home page
my @blogs = find :dir<AUTHORS>, :name(/'.md'$/);
say "DEBUG: found src blog files:";
say "  $_" for @blogs.sort;
=end comment

##### SUBROUTINES #####
sub check-index(:$dbIO, :$debug) {

    my %blogs;
    say "DEBUG: blogs:" if $debug;
    my @blogs = find :dir($AUTHORS), :name(/'.md'$/), :exclude(/README/), :type<file>;
    for @blogs -> $f {
        say "  $f" if $debug;
        # extract the blog data
        my $author = '';
        my $blog-title = $f.IO.basename;
        if $f ~~ / 'AUTHORS/' ( \S+ ) '/' \S+ '.md' $/ {
            $author = ~$0; 
            say "  $author" if $debug;
        }
        # create a Blog object
        my $id = $blog-title ~ $author;
        my $b = Blog.new: :file($f), :author($author), :$id;
        if %blogs{$id}:exists {
            say "WARNING: duplicate blog id '$id'";
        }
        else {
            %blogs{$id} = $b;
        }
    }
    my @keys = %blogs.keys.sort.reverse;
    if $debug {
        say "DEBUG: dumping blog ids in reverse order:";
        say "  $_" for @keys;
    }

}

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

