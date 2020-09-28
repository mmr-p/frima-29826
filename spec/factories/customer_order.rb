FactoryBot.define do
  factory :customer_order, class: CustomerOrder do
    postal_code       { '123-4567' }
    prefecture_id     { '2' }
    city              { '横浜市緑区' }
    street            { '1-1-1' }
    building          { '柳ビル103' }
    tel               { '09012345678' }
    token             { 'aaaaa' }
  end
end