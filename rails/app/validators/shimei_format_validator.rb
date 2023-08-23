class ShimeiFormatValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
        # 名字＋半角スペース+名前の形式であるかを判定する
        return if value.blank?
        unless value ~= ^[^ ]+ [^ ]+$
            record.errors[attribute] << (options[:message] || "氏名が不正なフォーマットです：#{value}")
        end
    end
end