# frozen_string_literal: true

# == Schema Information
#
# Table name: template_folders
#
#  id         :bigint           not null, primary key
#  deleted_at :datetime
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :bigint           not null
#  author_id  :bigint           not null
#
# Indexes
#
#  index_template_folders_on_account_id  (account_id)
#  index_template_folders_on_author_id   (author_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (author_id => users.id)
#
class TemplateFolder < ApplicationRecord
  DEFAULT_NAME = 'Default'

  belongs_to :author, class_name: 'User'
  belongs_to :account

  has_many :templates, dependent: :destroy

  scope :active, -> { where(deleted_at: nil) }
end
