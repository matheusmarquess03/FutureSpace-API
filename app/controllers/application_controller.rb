class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  LIMITE_PAGINACAO_PADRAO = 20

  def per
    params[:per_page] ? params[:per_page].to_i : LIMITE_PAGINACAO_PADRAO
  end

  def index
    render json: { message: 'REST Back-end Challenge 20201209 Running' }
  end
end
