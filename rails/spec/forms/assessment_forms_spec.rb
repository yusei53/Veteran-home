# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'AssessmentForm' do
  describe 'validation' do
    describe '#user_name' do
      subject do
        build(:assessment_form, user_name: param)
      end

      context '正常ケース:文字列+半角スペース+文字列' do
        let(:param) { "#{Faker::Space.planet} #{Faker::Space.moon}" }

        it { is_expected.to be_valid }
      end

      context '空値' do
        let(:param) { nil }

        it { is_expected.not_to be_valid }
      end

      context '半角スペースなし' do
        let(:param) { Faker::Space.planet + Faker::Space.moon }

        it { is_expected.not_to be_valid }
      end

      context '文字列制限長以上' do
        let(:param) { "a #{'a' * 31}" }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#user_name_kana' do
      subject do
        build(:assessment_form, user_name_kana: param)
      end

      context '正常ケース:文字列+半角スペース+文字列' do
        let(:param) { "#{Faker::Space.planet} #{Faker::Space.moon}" }

        it { is_expected.to be_valid }
      end

      context '空値' do
        let(:param) { nil }

        it { is_expected.not_to be_valid }
      end

      context '半角スペースなし' do
        let(:param) { Faker::Space.planet + Faker::Space.moon }

        it { is_expected.not_to be_valid }
      end

      context '文字列制限長以上' do
        let(:param) { "a #{'a' * 63}" }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#user_tel' do
      subject do
        build(:assessment_form, user_tel: param)
      end

      context '正常ケース:0から始まる10桁値' do
        let(:param) { Faker::Number.leading_zero_number(digits: 10) }

        it { is_expected.to be_valid }
      end

      context '正常ケース:0から始まる11桁値' do
        let(:param) { Faker::Number.leading_zero_number(digits: 11) }

        it { is_expected.to be_valid }
      end

      context '空値' do
        let(:param) { nil }

        it { is_expected.not_to be_valid }
      end

      context '文字列制限長以上' do
        let(:param) { '0' * 12 }

        it { is_expected.not_to be_valid }
      end

      context '文字列制限長以下' do
        let(:param) { '0' * 9 }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#user_email' do
      subject do
        build(:assessment_form, user_email: param)
      end

      context '正常ケース:eメール' do
        let(:param) { Faker::Internet.email }

        it { is_expected.to be_valid }
      end

      context '空値' do
        let(:param) { nil }

        it { is_expected.not_to be_valid }
      end

      context '文字列制限長以上' do
        let(:param) { "a@h.#{'a' * 97}" }

        it { is_expected.not_to be_valid }
      end

      invalid_cases = ['hoge', 'hoge.huga', 'hoge.huga@', 'hoge.huga@example', 'hoge.huga@example.']
      invalid_cases.each do |invalid_case|
        context '不正なeメール' do
          let(:param) { invalid_case }

          it { is_expected.not_to be_valid }
        end
      end
    end

    describe '#company' do
      subject do
        build(:assessment_form, company: param)
      end

      context '正常ケース：文字列' do
        let(:param) { Faker::Company.name }

        it { is_expected.to be_valid }
      end

      context '空値' do
        let(:param) { nil }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#branch' do
      subject do
        build(:assessment_form, branch: param)
      end

      context '正常ケース:文字列' do
        let(:param) { Faker::Company.name }

        it { is_expected.to be_valid }
      end

      context '空値' do
        let(:param) { nil }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#property_prefecture' do
      subject do
        build(:assessment_form, property_prefecture: param)
      end

      context '正常ケース:文字列' do
        let(:param) { Faker::Address.city }

        it { is_expected.to be_valid }
      end

      context '空値' do
        let(:param) { nil }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#property_city' do
      subject do
        build(:assessment_form, property_city: param)
      end

      context '正常ケース:文字列' do
        let(:param) { Faker::Address.city }

        it { is_expected.to be_valid }
      end

      context '空値' do
        let(:param) { nil }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#property_address' do
      subject do
        build(:assessment_form, property_address: param)
      end

      context '正常ケース:文字列' do
        let(:param) { Faker::Address.street_address }

        it { is_expected.to be_valid }
      end

      context '空値' do
        let(:param) { nil }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#property_type' do
      subject do
        build(:assessment_form, property_type: param)
      end

      Property.all.map(&:id).each do |property_type_case|
        context '正常ケース:定義enum値' do
          let(:param) { property_type_case }

          it { is_expected.to be_valid }
        end
      end
      context '空値' do
        let(:param) { nil }

        it { is_expected.not_to be_valid }
      end

      property_type_cases = Property.all.map(&:id)
      property_type_min = property_type_cases.min
      property_type_cases.each do |property_type_case|
        context '定義enum外の値' do
          let(:param) { property_type_min - 1 - property_type_case }

          it { is_expected.not_to be_valid }
        end
      end
    end

    describe '#property_building_area_unit' do
      subject do
        build(:assessment_form, property_building_area_unit: param)
      end

      BuildingAreaUnit.all.map(&:id).each do |building_area_unit_case|
        context '正常ケース:定義enum値' do
          let(:param) { building_area_unit_case }

          it { is_expected.to be_valid }
        end
      end
      context '空値' do
        let(:param) { nil }

        it { is_expected.not_to be_valid }
      end

      property_building_area_unit_cases = BuildingAreaUnit.all.map(&:id)
      property_building_area_unit_min = property_building_area_unit_cases.min
      property_building_area_unit_cases.each do |property_building_area_unit_case|
        context '定義enum外の値' do
          let(:param) { property_building_area_unit_min - 1 - property_building_area_unit_case }

          it { is_expected.not_to be_valid }
        end
      end
    end

    describe '#property_exclusive_area' do
      subject do
        build(:assessment_form, property_exclusive_area: param)
      end

      context '正常ケース:小数値' do
        let(:param) { Faker::Number.decimal(l_digits: 3, r_digits: 3) }

        it { is_expected.to be_valid }
      end

      context '空値' do
        let(:param) { nil }

        it { is_expected.not_to be_valid }
      end

      context '負値' do
        let(:param) { -1 }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#property_land_area' do
      subject do
        build(:assessment_form, property_land_area: param)
      end

      context '正常ケース：小数値' do
        let(:param) { Faker::Number.decimal(l_digits: 3, r_digits: 3) }

        it { is_expected.to be_valid }
      end

      context '空値' do
        let(:param) { nil }

        it { is_expected.not_to be_valid }
      end

      context '負値' do
        let(:param) { -1 }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#property_building_area' do
      subject do
        build(:assessment_form, property_building_area: param)
      end

      context '正常ケース:小数値' do
        let(:param) { Faker::Number.decimal(l_digits: 3, r_digits: 3) }

        it { is_expected.to be_valid }
      end

      context '空値' do
        let(:param) { nil }

        it { is_expected.not_to be_valid }
      end

      context '負値' do
        let(:param) { -1 }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#property_floor_area' do
      subject do
        build(:assessment_form, property_floor_area: param)
      end

      context '正常ケース:小数値' do
        let(:param) { Faker::Number.decimal(l_digits: 3, r_digits: 3) }

        it { is_expected.to be_valid }
      end

      context '空値' do
        let(:param) { nil }

        it { is_expected.not_to be_valid }
      end

      context '負値' do
        let(:param) { -1 }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#url_param' do
      subject do
        build(:assessment_form, url_param: param)
      end

      context '正常ケース' do
        let(:param) { 'beteran-sumai' }

        it { is_expected.to be_valid }
      end

      context '空値' do
        let(:param) { nil }

        it { is_expected.not_to be_valid }
      end
    end

    describe '#property_room_plan' do
      subject do
        build(:assessment_form, property_room_plan: param)
      end

      PropertyRoomPlan.all.map(&:id).each do |property_room_plan_case|
        context '正常ケース:定義enum' do
          let(:param) { property_room_plan_case }

          it { is_expected.to be_valid }
        end
      end
      context '空値' do
        let(:param) { nil }

        it { is_expected.not_to be_valid }
      end

      property_room_plan_cases = PropertyRoomPlan.all.map(&:id)
      property_room_plan_min = property_room_plan_cases.min
      property_room_plan_cases.each do |property_room_plan_case|
        context '定義enum外の値' do
          let(:param) { property_room_plan_min - 1 - property_room_plan_case }

          it { is_expected.not_to be_valid }
        end
      end
    end

    describe '#property_constructed_year' do
      subject do
        build(:assessment_form, property_constructed_year: param)
      end

      context '正常ケース：整数値' do
        let(:param) { Faker::Number.number(digits: 2) }

        it { is_expected.to be_valid }
      end

      context '空値' do
        let(:param) { nil }

        it { is_expected.not_to be_valid }
      end

      context '負値' do
        let(:param) { -1 }

        it { is_expected.not_to be_valid }
      end
    end
  end
end
