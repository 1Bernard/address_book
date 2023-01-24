require 'pstore'

class Database
  def initialize
    @store = PStore.new("address.store")
  end

  def store(address)
    @store.transaction do
      @store[address.id.to_sym] = address
    end
  end

  def get_all
    address = []
    @store.transaction do
      @store.roots.each do |id|
        address.push(@store[id])
      end
    end
    address
  end

  def delete(address)
    @store.transaction do
      @store.delete(address.id.to_sym)
    end
  end

end