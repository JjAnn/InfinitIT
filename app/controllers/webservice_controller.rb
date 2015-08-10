class WebserviceController < ApplicationController
  include WashOut::SOAP
  soap_service namespace: "ProjetoInfinit", wsse_auth_callback: ->(email, password) {
  return !User.find_by(email: email).authenticate(password).blank?
}

  # Teste 
  soap_action "integer_to_string",
              :args   => {:cliente_id => :integer},
              :return => :string
  def integer_to_string
    render :soap => params[:value].to_s
  end

  # Recebe ID Cliente Retorna relato

  soap_action "relatorio",
	       :args => :integer,
               :return => :string
  def relatorio
  @busca = Relorio.where(cliente_id: params[:cliente_id])
        render :soap => @busca.id 
  end




  soap_action "concat",
              :args   => { :a => :string, :b => :string },
              :return => :string
  def concat
    render :soap => (params[:a] + params[:b])
  end

end
