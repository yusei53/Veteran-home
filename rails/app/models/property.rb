# 物件種別

class Property < ActiveHash::Base
    self.data=[
        {id:0, name:"マンション"},
        {id:1, name:"戸建て"},
        {id:2, name:"土地"},
    ]
end