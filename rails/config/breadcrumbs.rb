# frozen_string_literal: true

crumb :pref_show do |pref|
  link pref.name.to_s, "/areas/#{pref.id}"
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

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
