module ITrak
  module Persistable
    attr_accessor :store_file, :key, :data

    def store(file)
      @store_file = file
      @key = self.class.to_s.split('::').last.downcase
      dirname = @store_file.split('/')[0...-1].join
      FileUtils.mkdir_p(dirname) unless dirname.empty? || Dir.exist?(dirname)
      store = PStore.new(store_file)

      @data = store.transaction do |s|
        s[key]
      end || initial_data
    end

    def save
      store = PStore.new(store_file)
      store.transaction do |s|
        s[key] = data
      end
    end

    def initial_data
      fail 'Must be implemented in mixee class'
    end
  end
end
