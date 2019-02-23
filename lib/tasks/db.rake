# frozen_string_literal: true

namespace :db do
  desc '府中市のcsvをインポート'
  # https://www.city.fuchu.tokyo.jp/kurashi/gomirisaikuru/dashikata/sodaigomidasikata.html
  # docker-compose exec web rake db:import['tmp/gojuon3012.csv','2019-01-05']
  task :import, %w[filename updated_on] => :environment do |_task, args|
    raise if args['filename'].nil? || args['updated_on'].nil?

    date = Date.parse(args['updated_on']).to_date
    Trash.import_csv(args['filename'], date)
    Trash.all.each(&:update_name_furi)
  end
end
