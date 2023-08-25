# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'City' do
  describe 'be_valid' do
    describe 'factorybot' do
      subject do
        build(:city)
      end

      context '正常ケース' do
        it { is_expected.to be_valid }
      end
    end

    describe '#name' do
      subject do
        build(:city, name: n)
      end

      context '正常ケース' do
        let(:n) { Faker::Address.city }

        it { is_expected.to be_valid }
      end

      context 'バリデーションがかかっていないのでなんでも通る' do
        let(:n) { Faker::String.random }

        it { is_expected.to be_valid }
      end
    end

    describe '#yomi' do
      subject do
        build(:city, yomi: y)
      end

      context '正常ケース' do
        let(:y) { Faker::Address.city }

        it { is_expected.to be_valid }
      end

      context 'バリデーションがかかっていないのでなんでも通る' do
        let(:y) { Faker::String.random }

        it { is_expected.to be_valid }
      end
    end

    describe '#city_id' do
      subject do
        build(:city, city_id: c)
      end

      context '正常ケース' do
        let(:c) { Faker::Number.number(digits: 5) }

        it { is_expected.to be_valid }
      end
    end
  end

  describe 'be_invalid' do
    describe '#name' do
      subject do
        build(:city, name: n)
      end

      context '空値' do
        let(:n) { nil }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#yomi' do
      subject do
        build(:city, yomi: y)
      end

      context '空値' do
        let(:y) { nil }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#city_id' do
      subject do
        build(:city, city_id: c)
      end
    end
  end
end
