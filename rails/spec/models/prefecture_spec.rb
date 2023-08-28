# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Prefecture' do
  describe 'be_valid' do
    describe 'factorybot' do
      subject do
        build(:prefecture)
      end

      context '正常ケース' do
        it { is_expected.to be_valid }
      end
    end

    describe '#name' do
      subject do
        build(:prefecture, name: n)
      end

      context '正常ケース' do
        let(:n) { Faker::Address.city }

        it { is_expected.to be_valid }
      end
    end

    describe '#prefecture_id' do
      subject do
        build(:prefecture, prefecture_id: p)
      end

      context '正常ケース' do
        let(:p) { Faker::Number.number(digits: 3) }

        it { is_expected.to be_valid }
      end
    end
  end

  describe 'be_invalid' do
    describe '#name' do
      subject do
        build(:prefecture, name: n)
      end

      context '空値' do
        let(:n) { nil }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#prefecture_id' do
      subject do
        build(:prefecture, prefecture_id: p)
      end

      context '空値' do
        let(:p) { nil }

        it { is_expected.not_to be_valid }
      end

      context '不正値' do
        let(:p) { Faker::Space.galaxy }

        it { is_expected.not_to be_valid }
      end
    end
  end
end
