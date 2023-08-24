# frozen_string_literal: true

RSpec.describe 'AssessmentForms' do
  describe 'GET /assessment_forms' do
    it '査定依頼フォームにアクセスする' do
      get assessment_forms_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /assessment_forms/thanks' do
    it '査定依頼フォームにアクセスする' do
      get '/assessment_forms/thanks'
      expect(response).to have_http_status(:ok)
    end
  end
end
