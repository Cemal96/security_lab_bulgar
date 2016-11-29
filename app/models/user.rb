class User < ActiveRecord::Base
  before_create :hash_MD2_password
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  validate :restricted_passwords

  private
  def restricted_passwords
    self.errors.add(:password, "can contain only number and math operation!") if !password.match(/^[0-9()+-=\*\\]+$/)
  end

  private
  def hash_MD2_password
    crypt = Chilkat::CkCrypt2.new()

    success = crypt.UnlockComponent("set")
    if !success
      print crypt.lastErrorText + "\n"
    else
      crypt.put_EncodingMode("hex")
      crypt.put_HashAlgorithm("md2")

      salt = random_string(5)
      hash = crypt.hashStringENC(self.password + salt)

      self.md2_pass = crypt.hashStringENC(self.password + salt)
      self.md2_salt = salt
    end
  end

  def random_string length
    rand(36**length).to_s(36)
  end
end
