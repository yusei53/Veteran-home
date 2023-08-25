# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'AssessmentArea' do
  describe 'be_valid' do
    describe 'factorybot' do
      subject do
        build(:assessment_area)
      end

      context '正常ケース' do
        it { is_expected.to be_valid }
      end
    end
  end
end
