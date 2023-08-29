# frozen_string_literal: true

class ShimeiValidator < ActiveModel::Validator
  def validate(record)
    # 名字＋半角スペース+名前の形式であるかを判定する
    return if record.name =~ /\A[^ ]+ [^ ]+\z/

    record.errors.add(attribute, (options[:message] || "氏名が不正なフォーマットです：#{value}"))
  end
end
