module ControllerHelpers
  def sign_in(user = double('usuario', nome: 'teste', permissao: 'administrador', 'authy_enabled?': true))
    if user.nil?
      allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, { scope: :usuario })
      allow(controller).to receive(:current_user).and_return(nil)
    else
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      allow(controller).to receive(:current_user).and_return(user)
    end
  end
end
