# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Store' do
  describe 'be_valid' do
    describe 'factorybot' do
      subject do
        build(:store)
      end

      context '正常ケース' do
        it { is_expected.to be_valid }
      end
    end

    describe '#name' do
      subject do
        build(:store, name: n)
      end

      context '正常ケース' do
        let(:n) { Faker::String.random }

        it { is_expected.to be_valid }
      end
    end

    describe '#ieul_store_id' do
      subject do
        build(:store, ieul_store_id: i)
      end

      context '正常ケース' do
        let(:i) { Faker::Number.number(digits: 5) }

        it { is_expected.to be_valid }
      end
    end

    describe '#logo_url' do
      subject do
        build(:store, logo_url: l)
      end

      context '正常ケース' do
        let(:l) { Faker::Internet.url(host: 'example.com') }

        it { is_expected.to be_valid }
      end
    end

    describe '#post_code' do
      subject do
        build(:store, post_code: p)
      end

      context '正常ケース' do
        let(:p) { '000-0000' }

        it { is_expected.to be_valid }
      end
    end

    describe '#address' do
      subject do
        build(:store, address: a)
      end

      context '正常ケース' do
        let(:a) { Faker::Address.street_address }

        it { is_expected.to be_valid }
      end
    end

    describe '#phone_number' do
      subject do
        build(:store, phone_number: p)
      end

      phone_number_cases = %w[000-0000-0000 00-0000-0000]
      phone_number_cases.each do |phone_number_case|
        context '正常ケース' do
          let(:p) { phone_number_case }

          it { is_expected.to be_valid }
        end
      end
    end

    describe '#fax_number' do
      subject do
        build(:store, fax_number: f)
      end

      fax_number_cases = %w[000-0000-0000 00-0000-0000]
      fax_number_cases.each do |fax_number_case|
        context '正常ケース' do
          let(:f) { fax_number_case }

          it { is_expected.to be_valid }
        end
      end
    end

    describe '#open_time' do
      subject do
        build(:store, open_time: o)
      end

      time = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
      open_time = "平日#{time.strftime('%H:%M')}~#{time.strftime('%H:%M')}"
      context '正常ケース' do
        let(:o) { open_time }

        it { is_expected.to be_valid }
      end
    end

    describe '#holiday' do
      subject do
        build(:store, holiday: h)
      end

      context '正常ケース' do
        let(:h) { Faker::Space.galaxy }

        it { is_expected.to be_valid }
      end
    end

    describe '#catch_copy' do
      subject do
        build(:store, catch_copy: c)
      end

      context '正常ケース' do
        let(:c) { Faker::Space.galaxy }

        it { is_expected.to be_valid }
      end
    end

    describe '#introduction' do
      subject do
        build(:store, introduction: i)
      end

      context '正常ケース' do
        let(:i) { Faker::Space.galaxy }

        it { is_expected.to be_valid }
      end
    end
  end

  describe 'be_invalid' do
    describe '#ieul_store_id' do
      subject do
        build(:store, ieul_store_id: i)
      end

      context '空値' do
        let(:i) { nil }

        it { is_expected.not_to be_valid }
      end

      context '数値以外' do
        let(:i) { Faker::Space.galaxy }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#logo_url' do
      subject do
        build(:store, logo_url: l)
      end

      context '空値' do
        let(:l) { nil }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#post_code' do
      subject do
        build(:store, post_code: p)
      end

      post_code_cases = ['00-0000', '000-000', 'hoge-0000', '000=0000', '000-hoge']
      post_code_cases.each do |post_code_case|
        context '不正な値' do
          let(:p) { post_code_case }

          it { is_expected.not_to be_valid }
        end
      end
    end

    describe '#address' do
      subject do
        build(:store, address: a)
      end

      context '値が空' do
        let(:a) { nil }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#phone_number' do
      subject do
        build(:store, phone_number: p)
      end

      phone_number_cases = ['0-0000-0000', '000-0-0000', '000=0000=0000', 'hoge-huga-piyo']
      phone_number_cases.each do |phone_number_case|
        context '異常な値' do
          let(:p) { phone_number_case }

          it { is_expected.not_to be_valid }
        end
      end
    end

    describe '#fax_number' do
      subject do
        build(:store, fax_number: f)
      end

      fax_number_cases = ['0-0000-0000', '000-0-0000', '000=0000=0000', 'hoge-huga-piyo']
      fax_number_cases.each do |fax_number_case|
        context '異常な値' do
          let(:f) { fax_number_case }

          it { is_expected.not_to be_valid }
        end
      end
    end

    describe '#catch_copy' do
      subject do
        build(:store, catch_copy: c)
      end

      context '空値' do
        let(:c) { nil }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#introduction' do
      subject do
        build(:store, introduction: i)
      end

      context '空値' do
        let(:i) { nil }

        it { is_expected.not_to be_valid }
      end
    end
  end
end
