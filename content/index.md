+++
title = "Zola Blogs"
date = 2020-10-01
+++

This is a site for blog posts by
developers and programmers.

It is a work in progress, but the plan is to host 
my blogs plus those of others looking for a free
blog site. It runs on Github and its source
is in repo [github.com/tbrowder/zola-blogs.us](https://github.com/tbrowder/zola-blogs.us).

In spite of the domain name, I welcome bloggers from
every nation. If you want to blog in another language
than English I will try to accomodate that,
but I will have to find a Raku lang collaborator fluent
in your desired language willing
to assist me in helping you.

Interested bloggers will have to check the "authors"
directory in the repo and pick a unique, short name
in ASCII chars for your site alias. Create a
directory NAME.d and under that create a NAME file.
In that file,
please enter your real name. You can either add more
contact data you want to share with the world or,
as a minimum, send a valid email to me at my
CPAN address. See the "authors/tbrowder.d/tbrowder"
file for an example.

In the authors' directories, blog entries will be
entered in subdirectories named by ISOish format *yyyy-mm-yyThhmmZ*.
All entries there must be referenced in a file named "blog.md".

An example author's blog layout would look something like
this:

    authors/
        joey.d/
            joey
            2020-10-23T2157Z/
                blog.md


Those wanting to add a blog here will have the
choice of sending me your article, in Markdown 
format, to [tbrowder@cpan.org](mailto:tbrowder@cpan.org) or 
forking the repo and submitting
a PR. Any additional resources should be zipped into a 
single archive and attached to any email.

The domain name comes from [Zola](https://getzola.org), the static
website generator. (Its original name was
*Gutenberg*.)
