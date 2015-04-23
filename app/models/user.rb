class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :nombre, :apellido, :DNI, :direccion, presence: true
  validates :telefono, :fecha_nacimiento, presence: true
  validates :DNI, length: { is: 8,
                            too_short: 'Debería tener 8 carateres',
                            too_long: 'Debería tener 8 caracteres' }
  validates :RUC, length: { maximum: 11,
                            too_short: 'Debería tener 11 caracteres',
                            too_long: 'Debería tener 11 caracteres' }
end
