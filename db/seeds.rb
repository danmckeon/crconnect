require 'csv'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
lung_cancer_csv = File.join(Rails.root, 'db', 'seed_data', 'lung_cancer.csv')
csv_text = File.open(lung_cancer_csv, "r:ISO-8859-1")
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  Trial.create!(row.to_hash)
end
