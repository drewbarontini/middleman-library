Baseman Helpers
===============

A collection of useful helper methods for use in [Baseman](http://github.com/drewbarontini/baseman/)(Middleman).

Active Page
-----------

The `is_page_active` method checks to see if the current page is active so that you can apply an active class to an element.

```haml
%nav
  = link_to 'Home', '/', class: ( 'is-active' if is_page_active('/') )
  = link_to 'About', '/about', class: ( 'is-active' if is_page_active('/about') )
```

Get Resources
-------------

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

Slugify
-------

This is a common method used across a variety of programming languages, and it's used to take a string and turn it into a sluggable title that can, for instance, be used in a URL.

Let's say that we want to turn the page title's we got in the block above into slugs.

```haml
- get_resources.each do |page|
  %h1= slugify( page.data.title )
```

`Page Title` would then become `page-title`.
