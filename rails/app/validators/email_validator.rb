# frozen_string_literal: true

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, _attribute, value)
    return if value.blank?

    return unless /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/ !~ value

    record.errors.add :attribute, (options[:message] || '氏名が不正なフォーマットです')
  end
end
