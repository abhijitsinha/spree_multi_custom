Spree::Taxonomy.class_eval do
  belongs_to :store
  scope :by_store, lambda { |store| where(:store_id => store.id) }

  before_filter :taxonomy_store, :only => :index

  def order_store
    @taxonomy = Spree::Taxonomy.by_store(current_store.id) if current_store.id
  end

end

