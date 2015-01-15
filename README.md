Middleman Snippets
==================

A collection of useful Middleman snippets for use in [Middleman](https://middlemanapp.com/) and [Baseman](http://github.com/drewbarontini/baseman/) (Middleman starter application).

config.rb
---------

A collection of helper methods for use inside of `config.rb`.

### Active Page

The `is_page_active` method checks to see if the current page is active so that you can apply an active class to an element.

```haml
%nav
  = link_to 'Home', '/', class: ( 'is-active' if is_page_active('/') )
  = link_to 'About', '/about', class: ( 'is-active' if is_page_active('/about') )
```

### Get Resources

You can use [Middleman's Sitemap](http://middlemanapp.com/advanced/sitemap/) to get at the various files and assets within your application. Additionally, you can add [Frontmatter](http://middlemanapp.com/basics/frontmatter/) to filter down to only the files you want. For example, only grab "pages".

First, set up the Frontmatter in the view files:

```haml
---
title: Page Title
type: page
---
```

Next, use the `get_resources` method to select the pages with the `type` attribute of `page`.

```haml
- get_resources.each do |page|
  %h1= page.data.title
```

**Note**: By default, the `get_resources` method grabs files with the `type` attribute of `page`.

### Pretty Date

The `pretty_date` method formats a date string into a nicely formatted one.

```haml
%time= pretty_date('2014-12-18')
```

Which compiles to:

```haml
<time>December 12, 2014</time>
```

### Slugify

This is a common method used across a variety of programming languages, and it's used to take a string and turn it into a sluggable title that can, for instance, be used in a URL.

Let's say that we want to turn the page titles returned in the block above into slugs.

```haml
- get_resources.each do |page|
  %h1= slugify(page.data.title)
```

`Page Title` would then become `page-title`.
