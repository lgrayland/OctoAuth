class RefreshToken < ApplicationRecord

  before_save :remove_current_tokens

  def self.encode(user, client)
    r = RefreshToken.new
    r.user_id = user.id
    r.client_id = client.id
    r.expires = client.refresh_token_life_time.seconds.from_now
    r.token = JsonWebToken.encode({
                                      user_id: user.id,
                                      client_id: client.id,
                                      exp: client.refresh_token_life_time.seconds.from_now.to_i
                                  })
    if r.save
      return r.token
    else
      puts 'error creating refresh token'
    end
  end

  private

  def remove_current_tokens
    current_tokens = RefreshToken.where(user_id: self.user_id, client_id: self.client_id)
    if current_tokens.any?
      current_tokens.delete_all
    end
  end

end
