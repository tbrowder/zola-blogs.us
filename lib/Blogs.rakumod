unit module Blogs;

class Author is export {
}

class Blog is export {
    # the blog's file name:
    has $.file;

    # author alias unique NAME extracted from the file path and checked 
    # with the NAME.dat file in the same dir
    has $.author;

    # MANDATORY ENTRIES
    # blog title from the "title:" key in the blog file
    has $.title;
    
    # OPTIONAL ENTRIES
    # the programming language under discussion, e.g., raku, perl, rust, ...; used to create tags
    # defined in the "lang:" key in the blog file
    has $.lang; # e.g., raku, perl, rust, ...; used to create tags

    # blog submission time from the "time:" key in the blog file
    # is mandatory for tie-breaking
    has DateTime $.date;

    # OTHER DATA
    # the blog text as a string (all text AFTER the "title:" line
    has $.article;

    # the weight assigned during the indexing process (1..N)
    has UInt $.weight is rw = 0;
}

