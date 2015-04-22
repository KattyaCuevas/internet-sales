class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :nombre, :apellido, :DNI, :direccion, presence: true
  validates :telefono, :fecha_nacimiento, presence: true
  validates :DNI, length: { is: 8,
                            too_short: 'must have at least 8 characters',
                            too_long: 'must have at most 8 characters' }
  validates :RUC, length: { maximum: 11,
                            too_short: 'must have at least 11 characters',
                            too_long: 'must have at most 11 characters' }
end
