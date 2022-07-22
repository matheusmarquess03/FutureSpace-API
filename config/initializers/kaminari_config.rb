Kaminari.configure do |config|
  config.default_per_page = 2
  # config.max_per_page = nil
  # config.window = 4
  # config.outer_window = 0
  # config.left = 0
  # config.right = 0
  config.page_method_name = :pagina
  config.param_name = :pagina
end
