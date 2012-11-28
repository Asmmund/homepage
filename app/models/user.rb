class User < ActiveRecord::Base
  attr_accessible :name, :password_digest,:password,:password_confirmation,:original_updated_at
  validates :name, presence: true, uniqueness: true
  has_secure_password
  after_destroy :ensure_an_admin_remains

  attr_writer :original_updated_at
  validate :handle_conflict, only: :update

  def original_updated_at
  @original_updated_at ||updated_at.to_f
  end

  def handle_conflict
    if @conflict ||updated_at.to_f > original_updated_at.to_f
      @conflict = true
      @original_updated_at = nil
      errors.add :base, "Record changed while you edited, update your attributes"
      changes.each do |attribute, values|
        errors.add attribute, "was #{values}"
      end
    end
  end

  private
  def ensure_an_admin_remains
    if User.count.zero?
      raise "Can't delete last admin!"
    end
  end
end
