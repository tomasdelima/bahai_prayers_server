ActiveAdmin.register Prayer do
  permit_params :author, :body, :category_id, :preamble, :active
end
