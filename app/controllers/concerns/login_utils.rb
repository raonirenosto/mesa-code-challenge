module LoginUtils
  extend ActiveSupport::Concern
  SECRET_KEY = Rails.application.secrets.secret_key_base. to_s

  def authenticate_user email, password
    user = User.find_by_email(email)
    return user if user && user.authenticate(password)
  end

  def encode(user_id)
    payload = {}
    payload[:user_id] = user_id.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  end
end
