class Message < ActiveRecord::Base
    #名前は、必須入力かつ２０文字以内
    validates :name ,length: { maximum: 20 } , presence: true
    #内容は必須入力かつ2文字以上30文字以下
    validates :body , length: { minimum: 2 , maximum: 30 } , presence: true
    #年齢は０以上の数字のみ入力
    #validates :age , greater_than_or_equal_to: 0, numericality: true
    validates :age , numericality: { only_integer: true,greater_than_or_equal_to: 0 }
end
