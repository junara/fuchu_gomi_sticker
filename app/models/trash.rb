# frozen_string_literal: true

# == Schema Information
#
# Table name: trashes
#
#  id            :bigint(8)        not null, primary key
#  disposable    :boolean          default(TRUE)
#  disposal_cost :integer
#  import_file   :string
#  memo          :string
#  name          :string
#  name_furi     :string
#  updated_on    :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'csv'
class Trash < ApplicationRecord
  include AlgoliaSearch
  algoliasearch do
    attributes :name, :name_furi, :disposal_cost
    searchableAttributes %w[name name_furi]
    tags do
      t = [disposable ? '粗大ゴミ可' : '粗大ゴミ不可']
      t << '無料' if disposal_cost&.zero?
      t
    end
    customRanking ['desc(disposal_cost)']
  end

  def self.import_csv(file, date)
    list = []
    ActiveRecord::Base.transaction do
      CSV.foreach(file, encoding: 'cp932', headers: true) do |row|
        import_file = File.basename(file)
        list << Trash.new(trash_params(row).merge(import_file: import_file, updated_on: date))
      end
      import list
    end
  end

  def update_name_furi(force: false)
    return if name_furi.present? || !force

    rubyfuri = Rubyfuri::Client.new(ENV['YAHOO_JAPAN_DEVELOPER_CLIENT_ID'])
    update(name_furi: rubyfuri.furu(name))
  end

  def self.trash_params(row)
    {
      name: row['品目'],
      disposal_cost: row['料金'] == '不可' ? nil : row['料金'].sub(',', ''),
      disposable: row['料金'] == '不可'
    }
  end
end
