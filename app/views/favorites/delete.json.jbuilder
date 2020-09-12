json.user_id @product.favorites.current_user.id
json.product_id @product.favorites.product.id
json.created_at @product.favorites.created_at.strftime("%Y年%m月%d日 %H時%M分")