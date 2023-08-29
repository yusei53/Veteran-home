# frozen_string_literal: true

# class EmailValidator < ActiveModel::Validator
#   def validate(record)
#     # 名字＋半角スペース+名前の形式であるかを判定する
#     return if record.email.nil?

#     return if record.email =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

#     record.errors.add((options[:message] || "氏名が不正なフォーマットです：#{record.email}"))
#   end
# end

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, _attribute, value)
    return if value.blank?

    return unless /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/ !~ value

    record.errors.add :attribute, (options[:message] || '氏名が不正なフォーマットです')
  end
end
