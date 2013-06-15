class Homepage < Obj
  cms_attribute :search_page_link, type: :linklist, max_size: 1
  cms_attribute :headline, type: :string
  cms_attribute :error_not_found_page_link, type: :linklist
  cms_attribute :login_page_link, type: :linklist
  cms_attribute :footer_links, type: :linklist
  cms_attribute :locale, type: :string

  include Page

  # TODO edit mapping from hostnames to homepages
  def self.for_hostname(hostname)
    find_by_path('/website/en')
  end

  # TODO edit mapping from homepages to hostnames
  # Inverse of .for_hostname
  def desired_hostname
    'www.website.com'
  end

  def homepage
    self
  end

  def website
    parent
  end

  def error_not_found_page
    error_not_found_page_link.destination_objects.first
  end

  def login_page
    login_page_link.destination_objects.first
  end
end