json.extract! order, :id, :name, :mobile_number, :email, :comments, :total_price, :created_at, :updated_at
json.url order_url(order, format: :json)
