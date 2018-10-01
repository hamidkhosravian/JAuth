Rails.application.routes.draw do
  mount Jauth::Engine => "/jauth"
end
