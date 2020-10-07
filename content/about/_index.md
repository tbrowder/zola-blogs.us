+++
title = "ABOUT"
date = 2020-10-01
+++

# Zola Blogs

This is a free site for blog posts by
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

## PLANS

The site layout is very much a work-in-progress (WIP).

I plan to add a blog comment capability using [Staticman](https://staticman.net).

**WARNING: SOME INFORMATION BELOW THIS LINE IS SUBJECT TO CHANGE
UNTIL THIS WARNING IS REMOVED**

Interested bloggers will have to check the "AUTHORS"
directory in the repo and pick a unique, short NAME
in ASCII chars for his site alias. Create a
directory NAME and under that create a NAME.dat file.
In that file,
please enter your real name. You can either add more
contact data you want to share with the world or,
as a minimum, send a valid email to me at my
CPAN address (tbrowder@cpan.org). See the 'AUTHORS/tbrowder/tbrowder.dat'
file for an example.

In the authors' directories, blog entries will be
entered in a 'blogs' subdirectory and named by ISO date format
with an '.md' extension. For example, author 'joe'
might have a blog post of 'AUTHORS/joe/blogs/2020-10-09.md'.
If you have multiple entries for a day, use a numerical suffix
to the ISO date, e.g., 'yyyy-mm-dd.2.md'.
The blog file itself must be in Markdown format which will
be converted into an HTML file for the website.

An example author's blog layout would look something like
this:

```
AUTHORS/
    joe/
        joe.dat
        blogs/
            2020-10-01.md
            2020-10-23.md
            2020-10-23.2.md
            2020-10-23.4.md
```

Those wanting to add a blog here will have to
fork the repo and submit
a PR. 

The domain name comes from [Zola](https://getzola.org), the static
website generator. (Its original name was
*Gutenberg*.)
