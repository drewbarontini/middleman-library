helpers do

  # Determines if the current page is active
  #
  # == Parameters
  #
  # * +page+ - The page to check
  #
  # == Usage
  #
  #   = link_to 'Home', '/', class: ( 'is-active' if is_page_active('/') )
  #
  def is_page_active(page)
    current_page.url == page
  end

  # Grabs a set of resources from Middleman's Sitemap
  #
  # == Parameters
  #
  # * +type+ - The Frontmatter type of resource to get (defaults to 'page')
  #
  # == Usage
  #
  #   - get_resources.each do |page|
  #     # ...
  #
  def get_resources(type = 'page')
    sitemap.resources.select { |resource| resource.data.type == type }
  end

  # Formats a date string
  #
  # == Parameters
  #
  # * +date+ - The date string to format
  #
  # == Usage
  #
  #   pretty_date('2015-01-01')
  #
  def pretty_date(date)
    date.strftime('%B %d, %Y')
  end

  # Turns a string into a slugable string
  #
  # == Parameters
  #
  # * +string+ - The string to convert
  #
  # == Usage
  #
  #   slugify('This is my string')
  #
  def slugify(string)
    string.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

end
