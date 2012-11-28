class News < ActiveRecord::Base
  attr_accessible :text, :title,:updated_at,:original_updated_at
  validates :text, :title, presence: true

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


end
