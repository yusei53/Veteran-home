# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'AssessmentUser' do
  describe 'be_valid' do
    describe 'factorybot' do
      subject do
        build(:assessment_user)
      end

      context '正常ケース' do
        it { is_expected.to be_valid }
      end
    end

    describe '#name' do
      subject do
        build(:assessment_user, name: n)
      end

      context '正常ケース' do
        let(:n) { 'テスト太郎' }

        it { is_expected.to be_valid }
      end
    end

    describe '#yomi' do
      subject do
        build(:assessment_user, yomi: y)
      end

      context 'バリデーションがかかっていないのでなんでも通る' do
        let(:y) { Faker::String.random }

        it { is_expected.to be_valid }
      end

      context '空値の許容' do
        let(:y) { nil }

        it { is_expected.to be_valid }
      end
    end

    describe '#email' do
      subject do
        build(:assessment_user, email: e)
      end

      context '正常ケース' do
        let(:e) { 'hoge.huga@example.com' }

        it { is_expected.to be_valid }
      end

      context '空値の許容' do
        let(:e) { nil }

        it { is_expected.to be_valid }
      end
    end

    describe '#assessment_request_date' do
      subject do
        build(:assessment_user, assessment_request_date: a)
      end

      context '正常ケース' do
        let(:a) { '2023-08-25' }

        it { is_expected.to be_valid }
      end
    end

    describe '#is_received' do
      subject do
        build(:assessment_user, is_received: i)
      end

      bool_cases = [true, false]
      bool_cases.each do |bool_case|
        context '正常ケース' do
          let(:i) { bool_case }

          it { is_expected.to be_valid }
        end
      end
    end

    describe '#gender_id' do
      subject do
        build(:assessment_user, gender_id: g)
      end

      Gender.all.map(&:id).each do |gender_id|
        context '正常ケース' do
          let(:g) { gender_id }

          it { is_expected.to be_valid }
        end
      end
    end

    describe '#gender_id' do
      subject do
        build(:assessment_user, gender_id: g)
      end

      context '正常ケース' do
        Gender.all.map(&:id).each do |gender_id|
          let(:g) { gender_id }
          it { is_expected.to be_valid }
        end
      end

      context '空値の許容' do
        let(:g) { nil }

        it { is_expected.to be_valid }
      end
    end

    describe '#age' do
      subject do
        build(:assessment_user, age: a)
      end

      age_cases = [21, 200]
      age_cases.each do |age_case|
        context '正常ケース' do
          let(:a) { age_case }

          it { is_expected.to be_valid }
        end
      end

      context 'エッジケース' do
        let(:a) { 0 }

        it { is_expected.to be_valid }
      end
    end

    describe '#address' do
      subject do
        build(:assessment_user, address: a)
      end

      context 'バリデーションがかかっていないのでなんでも通る' do
        let(:a) { Faker::String.random }

        it { is_expected.to be_valid }
      end

      context '空値の許容' do
        let(:a) { nil }

        it { is_expected.to be_valid }
      end
    end
  end

  describe 'be_invalid' do
    describe '#name' do
      subject do
        build(:assessment_user, name: n)
      end

      context '空値' do
        let(:n) { nil }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#email' do
      subject do
        build(:assessment_user, email: e)
      end

      invalid_cases = ['hoge', 'hoge.huga', 'hoge.huga@', 'hoge.huga@example', 'hoge.huga@example.']
      invalid_cases.each do |invalid_case|
        context 'invalid email formats' do
          let(:e) { invalid_case }

          it do
            expect(subject).not_to be_valid
          end
        end
      end
    end

    describe '#assessment_request_data' do
      subject do
        build(:assessment_user, assessment_request_date: a)
      end

      context '空値' do
        let(:a) { nil }

        it { is_expected.not_to be_valid }
      end

      month_cases = ['1999-13-31', '1999-hoge-31', '1999-2-31']
      month_cases.each do |month_case|
        context 'invalid_month_format' do
          let(:a) { month_case }

          it { is_expected.not_to be_valid }
        end
      end
    end

    describe '#is_received' do
      subject do
        build(:assessment_user, is_received: i)
      end

      context '空値' do
        let(:i) { nil }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#age' do
      subject do
        build(:assessment_user, age: a)
      end

      context '０未満の値' do
        let(:a) { -1 }

        it { is_expected.not_to be_valid }
      end

      context '小数' do
        let(:a) { 0.1 }

        it { is_expected.not_to be_valid }
      end
    end
  end
end
