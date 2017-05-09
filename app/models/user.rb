class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # include Devise::JWT::RevocationStrategies::JTIMatcher
  # devise :database_authenticatable,
  #        :registerable, #:recoverable, :rememberable, :trackable, :validatable
  #        :jwt_authenticatable,
  #        jwt_revocation_strategy: self #JwtCustomRevocationStrategy

   include Devise::JWT::RevocationStrategies::JTIMatcher

   devise :database_authenticatable,
          :registerable,
          :jwt_authenticatable,
          jwt_revocation_strategy: self

  # protected
  # if you need to add information to the payload (claims) for strategy JTIMatcher only (self)
  # def jwt_payload
  #   super.merge('foo' => 'bar')
  # end
end
