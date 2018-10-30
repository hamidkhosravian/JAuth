byebug

json.email @user.email
json.token do
  json.partial! "tokens/show", token: @user.token
end
