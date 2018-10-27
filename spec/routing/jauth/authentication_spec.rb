describe Jauth::AuthenticationsController, :type => :routing do
  routes { Jauth::Engine.routes }

  it 'Post sign_up' do
    expect(post: 'sign_up').to route_to(controller: 'jauth/authentications', action: 'sign_up')
  end

  it 'Post sign_in' do
    expect(post: 'sign_in').to route_to(controller: 'jauth/authentications', action: 'sign_in')
  end

  it 'Delete sign_out' do
    expect(delete: 'sign_out').to route_to(controller: 'jauth/authentications', action: 'sign_out')
  end

  it 'Post confirmation' do
    expect(post: 'confirmation').to route_to(controller: 'jauth/authentications', action: 'confirmation')
  end

  it 'Put resend_confirmation' do
    expect(put: 'resend_confirmation').to route_to(controller: 'jauth/authentications', action: 'resend_confirmation')
  end

  it 'Post forgot_password' do
    expect(post: 'forgot_password').to route_to(controller: 'jauth/authentications', action: 'forgot_password')
  end

  it 'Put reset_password' do
    expect(put: 'reset_password').to route_to(controller: 'jauth/authentications', action: 'reset_password')
  end

  it 'Put change_password' do
    expect(put: 'change_password').to route_to(controller: 'jauth/authentications', action: 'change_password')
  end
end
