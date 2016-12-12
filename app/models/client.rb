class Client < ApplicationRecord
  has_secure_token :secret

  enum app_type: {javascript: 0, native: 1}
end