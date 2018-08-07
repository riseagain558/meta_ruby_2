require 'active_record'
require 'sqlite3'

db = SQLite3::Database.new('dbfile')
rows = db.execute <<-SQL
  CREATE TABLE IF NOT EXISTS ducks(id int, name varchar(30));
SQL

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'dbfile')

class Duck < ActiveRecord::Base
  validate do
    errors.add(:base, 'Illegal duck name.') unless name[0] == 'D'
  end
end

p Duck.delete_all
p my_duck = Duck.new
p my_duck.name = 'Donald'
p my_duck.valid?
p my_duck.save!
p Duck.all