class AdminUser < ApplicationRecord
  has_secure_password

  ROLES = {
    "manager" => "Редактор",
    "admin" => "Администратор"
  }.freeze

  normalizes :email, with: ->(email) { email.to_s.strip.downcase }

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :full_name, presence: true, length: { maximum: 100 }
  validates :role, inclusion: { in: ROLES.keys }

  def self.ensure_default_admin!
    find_or_initialize_by(email: "admin@example.ru").tap do |admin|
      admin.password = "password123"
      admin.password_confirmation = "password123"
      admin.full_name = "Администратор проекта"
      admin.role = "admin"
      admin.active = true
      admin.save!
    end
  end

  def admin?
    role == "admin"
  end
end
