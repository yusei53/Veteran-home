# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Company' do
  describe 'be_valid' do
    describe 'factorybot' do
      subject do
        build(:company)
      end

      context '正常ケース' do
        it { is_expected.to be_valid }
      end
    end

    describe '#name' do
      subject do
        build(:company, name: n)
      end

      context '正常ケース' do
        let(:n) { Faker::Company.name }

        it { is_expected.to be_valid }
      end
    end

    describe '#ieul_company_id' do
      subject do
        build(:company, ieul_company_id: i)
      end

      context '正常ケース' do
        let(:i) { Faker::Number.number(digits: 3) }

        it { is_expected.to be_valid }
      end
    end
  end

  describe 'be_invalid' do
    describe '#name' do
      subject do
        build(:company, name: n)
      end

      context '空値' do
        let(:n) { nil }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#ieul_company_id' do
      subject do
        build(:company, ieul_company_id: i)
      end

      context '正常ケース' do
        let(:i) { nil }

        it { is_expected.not_to be_valid }
      end

      context '数値以外の値' do
        let(:i) { Faker::Company.name }

        it { is_expected.not_to be_valid }
      end
    end
  end
end
