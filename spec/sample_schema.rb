on_pages_like 'someRegExp' do
  string :title, xpath: 'h1'
  set :articles, xpath: '.articles li a'
end