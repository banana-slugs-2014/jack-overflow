
if Rails.env.development?
  %w[post question answer].each do |c|
    require_dependency File.join("app","models","#{c}.rb")
  end
end