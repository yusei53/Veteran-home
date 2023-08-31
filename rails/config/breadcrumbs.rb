# frozen_string_literal: true

crumb :root_show do
  link 'home', root_path
end

crumb :pref_show do |pref|
  link pref.name.to_s, "/areas/#{pref.id}"
  parent :root_show
end

crumb :city_show do |city|
  link "#{city.name}の査定可能店舗", "/areas/#{city.prefecture.id}/city/#{city.id}"
  parent :pref_show, city.prefecture
end

crumb :store_show do |store|
  assessment_city = City.find(session[:assessment_city]['id'])
  store_name = store.name.nil? ? store.company.name : store.name
  link store_name.to_s, store_path(store)
  parent :city_show, assessment_city
end

crumb :review_show do |review|
  link '口コミ詳細', review_path(review)
  parent :store_show, review.original_review.store
end
