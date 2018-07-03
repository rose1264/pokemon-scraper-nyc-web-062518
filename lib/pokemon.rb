require "pry"

class Pokemon
	attr_accessor :name, :type, :db, :id, :hp

	def initialize(name:, type:, db:, id:, hp: nil)
		@name, @type, @db, @id, @hp = name, type, db, id, hp
	end

	def self.save(name, type, db)
		db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?);", name, type)
	end

	def self.find(id_num, db)
		info_array = db.execute("SELECT * FROM pokemon WHERE id = ?", id_num).flatten
		Pokemon.new(id: info_array[0], name: info_array[1], db: db, type: info_array[2], hp: info_array[3])
	end

	def alter_hp(hp_num, db)
		db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp_num, self.id)
	end
end