# frozen_string_literal: true

require "sqlite3"
require "rulers/sqlite_model"

class MyTable < Rulers::Model::SQLite; end

warn MyTable.schema.inspect

MyTable.create "title" => "it happened", "posted" => 1, "body" => "It did", "id" => 123
MyTable.create 'title' => 'I saw it', "asd" => "asdwqw"
MyTable.create 'title' => 'I saw it ot not'
mt = MyTable.create "title" => "I saw it again!"

puts "Count: #{MyTable.count}"

top_id = mt["id"].to_i
(1..top_id).each do |id|
  mt_id = MyTable.find(id)
  puts "Found title #{mt_id["title"]}"
end

mt = MyTable.create "title" => "it happened"
mt.title = "asdsadsa"
mt.save!

mt2 = MyTable.find mt.id
puts "Title: #{mt2.title}"
