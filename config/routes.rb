Jauth::Engine.routes.draw do
  resource :authentications, only: [], path: '' do
    collection do
      post :sign_up
      post :sign_in
      delete :sign_out
      post :confirmation
      put :resend_confirmation
      post :forgot_password
      put :reset_password
      put :change_password
    end
  end
end
