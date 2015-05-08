class PasswordProcessService
  attr_reader :client, :hash

  def initialize(client,options)
    @client = client
    @hash = options
  end

  def process
    email = @hash.fetch :email
    method = if email == "mlx@lg.com"
      :handle_reset_password_successful
    else
      :handle_no_record_found
    end
    client.send method
  end
end