# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'PublicReview' do
  describe 'be_valid' do
    describe 'factorybot' do
      subject do
        build(:original_review)
      end

      context '正常ケース' do
        it { is_expected.to be_valid }
      end
    end

    describe '#property_address' do
      subject do
        build(:original_review, property_address: p)
      end

      context '正常ケース' do
        let(:p) { Faker::Address.street_address }

        it { is_expected.to be_valid }
      end
    end

    describe '#property' do
      subject do
        build(:original_review, property: p)
      end

      Property.all.map(&:id).each do |property_case|
        context '正常ケース' do
          let(:p) { property_case }

          it { is_expected.to be_valid }
        end
      end
    end

    describe '#num_sale' do
      subject do
        build(:original_review, num_sale: n)
      end

      NumSale.all.map(&:id).each do |num_sale_case|
        context '正常ケース' do
          let(:n) { num_sale_case }

          it { is_expected.to be_valid }
        end
      end
    end

    describe '#date_considered' do
      subject do
        build(:original_review, date_considered: d)
      end

      context '正常ケース' do
        let(:d) { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now).strftime('%Y-%m-%d') }

        it { is_expected.to be_valid }
      end
    end

    describe '#date_assessment' do
      subject do
        build(:original_review, date_assessment: d)
      end

      context '正常ケース' do
        let(:d) { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now).strftime('%Y-%m-%d') }

        it { is_expected.to be_valid }
      end
    end

    describe '#start_sale' do
      subject do
        build(:original_review, start_sale: s)
      end

      context '正常ケース' do
        let(:s) { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now).strftime('%Y-%m-%d') }

        it { is_expected.to be_valid }
      end
    end

    describe '#end_sale' do
      subject do
        build(:original_review, end_sale: e)
      end

      context '正常ケース' do
        let(:e) { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now).strftime('%Y-%m-%d') }

        it { is_expected.to be_valid }
      end
    end

    describe '#date_handover' do
      subject do
        build(:original_review, date_handover: d)
      end

      context '正常ケース' do
        let(:d) { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now).strftime('%Y-%m-%d') }

        it { is_expected.to be_valid }
      end
    end

    describe '#score_speed' do
      subject do
        build(:original_review, score_speed: s)
      end

      (1..5).each do |score_speed_case|
        context '正常ケース' do
          let(:s) { score_speed_case }

          it { is_expected.to be_valid }
        end
      end
    end

    describe '#price_assessment' do
      subject do
        build(:original_review, price_assessment: p)
      end

      context '正常ケース' do
        let(:p) { Faker::Number.number(digits: 10) }

        it { is_expected.to be_valid }
      end
    end

    describe '#price_sale' do
      subject do
        build(:original_review, price_sale: p)
      end

      context '正常ケース' do
        let(:p) { Faker::Number.number(digits: 10) }

        it { is_expected.to be_valid }
      end
    end

    describe '#is_discount' do
      subject do
        build(:original_review, is_discount: i)
      end

      [true, false].each do |is_discount_case|
        context '正常ケース' do
          let(:i) { is_discount_case }

          it { is_expected.to be_valid }
        end
      end
    end

    describe '#discount_n_month_later' do
      subject do
        build(:original_review, discount_n_month_later: d)
      end

      (1..12).each do |month_cases|
        context '正常ケース' do
          let(:d) { month_cases }

          it { is_expected.to be_valid }
        end
      end
    end

    describe '#price_discount' do
      subject do
        build(:original_review, price_discount: p)
      end

      context '正常ケース' do
        let(:p) { Faker::Number.number(digits: 10) }

        it { is_expected.to be_valid }
      end
    end

    describe '#price_contract' do
      subject do
        build(:original_review, price_contract: p)
      end

      context '正常ケース' do
        let(:p) { Faker::Number.number(digits: 10) }

        it { is_expected.to be_valid }
      end
    end

    describe '#score_contract' do
      subject do
        build(:original_review, score_contract: s)
      end

      (1..5).each do |score_contract_case|
        context '正常ケース' do
          let(:s) { score_contract_case }

          it { is_expected.to be_valid }
        end
      end
    end

    describe '#contract_type' do
      subject do
        build(:original_review, contract_type: c)
      end

      ContractType.all.map(&:id).each do |contract_type_case|
        context '正常ケース' do
          let(:c) { contract_type_case }

          it { is_expected.to be_valid }
        end
      end
    end

    describe '#headline' do
      subject do
        build(:original_review, headline: h)
      end

      context '正常ケース' do
        let(:h) { Faker::Number.number(digits: 10) }

        it { is_expected.to be_valid }
      end
    end

    describe '#reason_sale' do
      subject do
        build(:original_review, reason_sale: r)
      end

      ReasonSale.all.map(&:id).each do |reason_sale_case|
        context '正常ケース' do
          let(:r) { reason_sale_case }

          it { is_expected.to be_valid }
        end
      end
    end

    describe '#anxiety' do
      subject do
        build(:original_review, anxiety: a)
      end

      context '正常ケース' do
        let(:a) { Faker::Lorem.paragraph(sentence_count: 3) }

        it { is_expected.to be_valid }
      end
    end

    describe '#reason_decision' do
      subject do
        build(:original_review, reason_decision: r)
      end

      context '正常ケース' do
        let(:r) { Faker::Lorem.paragraph(sentence_count: 3) }

        it { is_expected.to be_valid }
      end
    end

    describe '#score_store' do
      subject do
        build(:original_review, score_store: s)
      end

      (1..5).each do |score_store_case|
        context '正常ケース' do
          let(:s) { score_store_case }

          it { is_expected.to be_valid }
        end
      end
    end

    describe '#reason_score' do
      subject do
        build(:original_review, reason_score: s)
      end

      context '正常ケース' do
        let(:s) { Faker::Lorem.paragraph(sentence_count: 3) }

        it { is_expected.to be_valid }
      end
    end

    describe '#advice' do
      subject do
        build(:original_review, advice: a)
      end

      context '正常ケース' do
        let(:a) { Faker::Lorem.paragraph(sentence_count: 3) }

        it { is_expected.to be_valid }
      end
    end

    describe '#improvement' do
      subject do
        build(:original_review, improvement: i)
      end

      context '正常ケース' do
        let(:i) { Faker::Lorem.paragraph(sentence_count: 3) }

        it { is_expected.to be_valid }
      end
    end
  end

  describe 'be_invalid' do
    describe '#property_address' do
      subject do
        build(:original_review, property_address: p)
      end

      context '空値' do
        let(:p) { nil }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#property' do
      subject do
        build(:original_review, property: p)
      end

      context '空値' do
        let(:p) { nil }

        it { is_expected.not_to be_valid }
      end

      Property.all.map(&:id).each do |property_case|
        context '異常値' do
          let(:p) { property_case > 0 ? 0 - property_case : -10_000 }

          it { is_expected.not_to be_valid }
        end
      end
    end

    describe '#num_sale' do
      subject do
        build(:original_review, num_sale: n)
      end

      context '空値' do
        let(:n) { nil }

        it { is_expected.not_to be_valid }
      end

      NumSale.all.map(&:id).each do |num_sale_case|
        context '異常値' do
          let(:n) { num_sale_case > 0 ? 0 - num_sale_case : -10_000 }

          it { is_expected.not_to be_valid }
        end
      end
    end

    describe '#date_considered' do
      subject do
        build(:original_review, date_considered: d)
      end

      context '空値' do
        let(:d) { nil }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#date_assessment' do
      subject do
        build(:original_review, date_assessment: d)
      end

      context '空値' do
        let(:d) { nil }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#start_sale' do
      subject do
        build(:original_review, start_sale: s)
      end

      context '空値' do
        let(:s) { nil }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#end_sale' do
      subject do
        build(:original_review, end_sale: e)
      end

      context '空値' do
        let(:e) { nil }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#date_handover' do
      subject do
        build(:original_review, date_handover: d)
      end

      context '空値' do
        let(:d) { nil }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#score_speed' do
      subject do
        build(:original_review, score_speed: s)
      end

      context '空値' do
        let(:s) { nil }

        it { is_expected.not_to be_valid }
      end

      (1..5).each do |score_speed_case|
        context '異常値' do
          let(:s) { score_speed_case > 0 ? 0 - score_speed_case : -10_000 }

          it { is_expected.not_to be_valid }
        end
      end
    end

    describe '#price_assessment' do
      subject do
        build(:original_review, price_assessment: p)
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

    describe '#price_sale' do
      subject do
        build(:original_review, price_sale: p)
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

    # describe '#is_discount' do
    #     subject do
    #       build(:original_review, is_discount:i)
    #     end
    #     context '不正値' do
    #       let(:i){Faker::Space.galaxy}
    #       it { is_expected.not_to be_valid }
    #     end
    # end
    describe '#discount_n_month_later' do
      subject do
        build(:original_review, discount_n_month_later: d)
      end

      context '不正値' do
        let(:d) { Faker::Space.galaxy }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#price_discount' do
      subject do
        build(:original_review, price_discount: p)
      end

      context '不正値' do
        let(:p) { Faker::Space.galaxy }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#price_contract' do
      subject do
        build(:original_review, price_contract: p)
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

    describe '#score_contract' do
      subject do
        build(:original_review, score_contract: s)
      end

      context '空値' do
        let(:s) { nil }

        it { is_expected.not_to be_valid }
      end

      (1..5).each do |score_contract_case|
        context '異常値' do
          let(:s) { 1 - score_contract_case }

          it { is_expected.not_to be_valid }
        end
      end
    end

    describe '#contract_type' do
      subject do
        build(:original_review, contract_type: c)
      end

      context '空値' do
        let(:c) { nil }

        it { is_expected.not_to be_valid }
      end

      ContractType.all.map(&:id).each do |contract_type_case|
        context '正常ケース' do
          let(:c) { contract_type_case > 0 ? 0 - contract_type_case : -10_000 }

          it { is_expected.not_to be_valid }
        end
      end
    end

    describe '#headline' do
      subject do
        build(:original_review, headline: h)
      end

      context '空値' do
        let(:h) { nil }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#reason_sale' do
      subject do
        build(:original_review, reason_sale: r)
      end

      context '空値' do
        let(:r) { nil }

        it { is_expected.not_to be_valid }
      end

      ReasonSale.all.map(&:id).each do |reason_sale_case|
        context '正常ケース' do
          let(:r) { reason_sale_case > 0 ? 0 - reason_sale_case : -10_000 }

          it { is_expected.not_to be_valid }
        end
      end
    end

    describe '#anxiety' do
      subject do
        build(:original_review, anxiety: a)
      end

      context '空値' do
        let(:a) { nil }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#reason_decision' do
      subject do
        build(:original_review, reason_decision: r)
      end

      context '空値' do
        let(:r) { nil }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#score_store' do
      subject do
        build(:original_review, score_store: s)
      end

      context '空値' do
        let(:s) { nil }

        it { is_expected.not_to be_valid }
      end

      (1..5).each do |score_store_case|
        context '異常値' do
          let(:s) { score_store_case > 0 ? 0 - score_store_case : -10_000 }

          it { is_expected.not_to be_valid }
        end
      end
    end

    describe '#reason_score' do
      subject do
        build(:original_review, reason_score: s)
      end

      context '空値' do
        let(:s) { nil }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#advice' do
      subject do
        build(:original_review, advice: a)
      end

      context '空値' do
        let(:a) { nil }

        it { is_expected.not_to be_valid }
      end
    end
    # describe '#improvement' do
    #     subject do
    #       build(:original_review, improvement:i)
    #     end
    #     context '正常ケース' do
    #       let(:i){faker::lorem.paragraph(sentence_count: 3)}
    #       it { is_expected.not_to be_valid }
    #     end
    # end
  end
end
