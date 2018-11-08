class OptionValue < ApplicationRecord
  belongs_to :option_type
  has_many :variants, through: :option_value_variants
  has_many :option_value_variants, dependent: :destroy

  validates_uniqueness_of :name, scope: :option_type_id, case_sensitive: false
  validates_presence_of :name
end
