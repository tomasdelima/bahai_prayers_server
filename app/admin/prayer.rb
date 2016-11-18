ActiveAdmin.register Prayer do
  permit_params :author, :body, :category_id, :preamble, :active, :special_prayer
end
