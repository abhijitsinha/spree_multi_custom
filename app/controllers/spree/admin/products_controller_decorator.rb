Spree::Admin::ProductsController.class_eval do
  update.before :set_stores
  before_filter :product_store, :only => :index

  def product_store
    Spree:Product.by_store(current_store_id) if current_store_id
  end

  private
  def set_stores
    @product.store_ids = nil unless params[:product].key? :store_ids
  end

end

