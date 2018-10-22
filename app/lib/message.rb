class Message
  def self.not_found(record = "record")
    "Sorry, #{record} not found."
  end

  def self.invalid_credentials
    "Invalid credentials"
  end

  def self.invalid_token
    "Invalid token"
  end

  def self.missing_token
    "Missing token"
  end

  def self.unauthorized
    "Unauthorized request"
  end

  def self.account_created
    "Account created successfully"
  end

  def self.account_not_created
    "Account could not be created"
  end

  def self.expired_token
    "Sorry, your token has expired. Please login to continue."
  end

  def self.logged_in
    "Logged in success"
  end

  def self.created_success resource
    "#{resource} created successfully"
  end

  def self.updated_success resource
    "#{resource} updated successfully"
  end

  def self.destroyed_success resource
    "#{resource} destroyed successfully"
  end

  def self.cart_empty
    "Cart is empty"
  end
end
