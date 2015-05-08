class AuthenticationService
  attr_reader :hash, :client

  API_LOGIN_END_POINT = 'http://lrm-authentication-production.herokuapp.com/v1/login'

  def initialize(client,options)
    @client = client
    @hash = {
      user: options
    }
  end

  def process
    show_spinner
    user = hash.fetch :user
    method = if user[:email] == "mlx@lg.com" && user[:password] == "mlx"
      :handle_login_successful
    else
      :handle_login_failed
    end
    hide_spinner
    client.send method
  end


  def show_spinner
    SVProgressHUD.showWithMaskType(SVProgressHUDMaskTypeClear)
  end

  def hide_spinner
    SVProgressHUD.dismiss
  end

end