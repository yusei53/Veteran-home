require 'rails_helper'

RSpec.describe 'AssessmentUser', type: :model do
  describe 'be_valid' do

    describe "factorybot" do
      subject do
        FactoryBot.build(:assessment_user)
      end
      
      context '正常ケース' do
        it {is_expected.to be_valid }
      end
    
    end

    describe '#name' do
      subject do
        FactoryBot.build(:assessment_user, name: name)
      end

      context '正常ケース' do
         let(:name){'テスト太郎'} 
        it { is_expected.to be_valid }
      end
    end
    describe '#yomi' do
      subject do
        FactoryBot.build(:assessment_user, yomi: yomi)
      end

      context 'バリデーションがかかっていないのでなんでも通る' do
        let(:yomi){Faker::String.random} 
        it { is_expected.to be_valid }
      end
      context '空値の許容' do
        let(:yomi){nil} 
        it { is_expected.to be_valid }
      end
    end

    describe '#email' do
      subject do
        FactoryBot.build(:assessment_user, email: email)
      end

      context '正常ケース' do
        let(:email){'hoge.huga@example.com'} 
        it { is_expected.to be_valid }
      end

      context '空値の許容' do
         let(:email){nil} 
        it { is_expected.to be_valid }
      end
    end

    describe '#assessment_request_date' do
      subject do
        FactoryBot.build(:assessment_user, assessment_request_date: assessment_request_date)
      end

      context '正常ケース' do
        let(:assessment_request_date){"2023-08-25"} 
        it { is_expected.to be_valid }
      end
    end
    describe '#is_received' do
      subject do
        FactoryBot.build(:assessment_user, is_received: is_received)
      end

      bool_cases = [true, false]
      bool_cases.each do |bool_case|
        context '正常ケース' do
          let(:is_received){bool_case} 
          it { is_expected.to be_valid }
        end
      end
    end
    describe '#gender_id' do
      subject do
        FactoryBot.build(:assessment_user, gender_id: gender_id)
      end

      Gender.all.map(&:id).each do |gender_id|
        context '正常ケース' do
            let(:gender_id){gender_id} 
            it { is_expected.to be_valid }
        end
      end
    end

    describe '#gender_id' do
      subject do
        FactoryBot.build(:assessment_user, gender_id: gender_id)
      end

      context '正常ケース' do
        Gender.all.map(&:id).each do |gender_id|
          let(:gender_id){gender_id} 
          it { is_expected.to be_valid }
        end
      end
      context "空値の許容" do
        let(:gender_id){nil}
        it{ is_expected.to be_valid}
      end
    end
    describe '#age' do
      subject do
        FactoryBot.build(:assessment_user, age: age)
      end
      
      age_cases = [21,200]
      age_cases.each do |age_case|
        context '正常ケース' do
          let(:age){age_case} 
          it { is_expected.to be_valid }
        end
      end

      context 'エッジケース' do
        let(:age){0} 
        it { is_expected.to be_valid }
      end
    end
    describe '#address' do
      subject do
        FactoryBot.build(:assessment_user, address: address)
      end

      context 'バリデーションがかかっていないのでなんでも通る' do
        let(:address){Faker::String.random} 
        it { is_expected.to be_valid }
      end

      context '空値の許容' do
        let(:address){nil} 
        it { is_expected.to be_valid }
      end
    end
  end

  describe 'be_invalid' do

    describe '#name' do
      subject do
        FactoryBot.build(:assessment_user, name: name)
      end
      context '空値' do
         let(:name){nil} 
        it { is_expected.to be_invalid }
      end
    end

    describe '#email' do
      subject do
        FactoryBot.build(:assessment_user, email: email)
      end

      invalid_cases = ["hoge","hoge.huga","hoge.huga@","hoge.huga@example","hoge.huga@example."]
      invalid_cases.each do |invalid_case |
        context 'invalid email formats' do
              let(:email){invalid_case} 
              it do
                is_expected.to be_invalid 
            end
        end
      end
    end

    describe '#assessment_request_data' do
      subject do
        FactoryBot.build(:assessment_user, assessment_request_date: assessment_request_date) 
      end
      context '空値' do
         let(:assessment_request_date){nil} 
        it { is_expected.to be_invalid }
      end

      month_cases = ["1999-13-31","1999-hoge-31", "1999-2-31"]
      month_cases.each do |month_case|
        context 'invalid_month_format' do
          let(:assessment_request_date){month_case} 
          it { is_expected.to be_invalid }
        end
      end
    end

    describe '#is_received' do
      subject do
        FactoryBot.build(:assessment_user, is_received: is_received)
      end
      context '空値' do
         let(:is_received){nil} 
        it { is_expected.to be_invalid }
      end
    end
    
    describe '#age' do
      subject do
        FactoryBot.build(:assessment_user, age: age)
      end
      context '０未満の値' do
         let(:age){-1} 
        it { is_expected.to be_invalid }
      end
      context '小数' do
         let(:age){0.1} 
        it { is_expected.to be_invalid }
      end
    end

    describe '#gender_id' do
      subject do
        FactoryBot.build(:assessment_user, gender_id: gender_id)
      end
    end
  end
end
