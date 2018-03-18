FactoryBot.define do
  factory :collection do
    name 'test'
    trait :with_torrent do
      after :create do |instance|
        instance.torrents << create(:torrent, torrentable_id: instance.id)
      end
    end
  end
end
