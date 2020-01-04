namespace :elasticsearch do
  desc "Elasticsearchのindex作成"
  task create_index: :environment do
    User.__elasticsearch__.create_index!
  end

  desc "UserをElasticsearchに登録"
  task import_user: :environment do
    User.__elasticsearch__.import
  end
end
