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
    
    has $.id;
    has $.id2;

    # OPTIONAL ENTRIES
    # the programming language under discussion, e.g., raku, perl, rust, ...; used to create tags
    # defined in the "lang:" key in the blog file
    has $.lang; # e.g., raku, perl, rust, ...; used to create tags
    has @.tags; # other user tags

    # OTHER DATA
    # the blog text as a string (all text AFTER the "title:" line)
    has $.article;

    # the weight assigned during the indexing process (1..N)
    has UInt $.weight is rw = 0;

    my @lines;
    method parse(:$debug) {
        # extracts data from the blog string
        for $.article.lines -> $line is copy {
            given $line {
                when /^ \h* 'lang:' \h* (\S+) / {
                    $.lang = ~$0.tc; # use title case
                }
                when /^ \h* 'title:' (\N+) $/ {
                    $.title = ~$0.words.join(' ');
                }
                when /^ \h* 'tag' 's'? ':' (\N+) $/ {
                    @.tags = ~$0.split(/<[, ]>/, :skip-empty).words;
                }
                default {
                    # keep the line as is
                    @lines.push: $_;
                }
            }
        }
    }

    method write-content(:$file!, :$weight = 1, :$debug) {
        # This should create the correctly formatted
        # markdown page in its proper location.
        # Among other things, it should get its leading
        # +++/+++ section with:
        #   title
        #   tags
        #   weight
        #
        # In addition, it should get a <read more> or
        # <see complete post> divider after the first
        # real paragraph (indicated by a blank line).

        
    }

}

