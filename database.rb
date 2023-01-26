require 'pstore'

class Database
  def initialize
    @store = PStore.new("address.txt")
  end

  def store(address)
    @store.transaction do
      @store[address.id] = address
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
      @store.delete(address.id)
    end
  end

end