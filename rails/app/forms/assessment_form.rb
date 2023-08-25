class AssessmentForm
    include ActiveModel::Model #validationなどを使えるように
    include ActiveModel::Attributes #"カラム属性が加えられる"

    attribute :name, :string 
    attribute :yomi, :string 
    attribute :phone_number, :string 
    attribute :email, :string
    


end 