# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create([
  { first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com', password: 'password123', status: 'Active', is_admin: false },
  { first_name: 'Jane', last_name: 'Smith', email: 'jane.smith@example.com', password: 'password123', status: 'Active', is_admin: true },
  { first_name: 'Alice', last_name: 'Johnson', email: 'alice.johnson@example.com', password: 'password123', status: 'Suspended', is_admin: false },
  { first_name: 'Bob', last_name: 'Brown', email: 'bob.brown@example.com', password: 'password123', status: 'Banned', is_admin: false },
  { first_name: 'John', last_name: 'Jones', email: 'admin@myquotes.com', password: 'admin123', status: 'Active', is_admin: true },
  { first_name: 'Vincent', last_name: 'Brown', email: 'vinceb@myemail.com', password: 'vince123', status: 'Active', is_admin: false }
])

Philosopher.create([
  { first_name: 'Socrates', last_name: '', birth_year: -470, death_year: -399, biography: 'An ancient Greek philosopher who is credited as one of the founders of Western philosophy.' },
  { first_name: 'Aristotle', last_name: '', birth_year: -384, death_year: -322, biography: 'A Greek philosopher and polymath during the Classical period in Ancient Greece.' },
  { first_name: 'Immanuel', last_name: 'Kant', birth_year: 1724, death_year: 1804, biography: 'A German philosopher who is a central figure in modern philosophy.' }
])

Category.create([
  { category_name: 'Metaphysics' },
  { category_name: 'Epistemology' },
  { category_name: 'Ethics' },
  { category_name: 'Aesthetics' },
  { category_name: 'Political Philosophy' }
])

Quote.create([
  { text: 'The unexamined life is not worth living.', publication_year: -399, is_public: true, user_id: 1, philosopher_id: 1, comment: 'Socrates said this during his trial.' },
  { text: 'Knowing yourself is the beginning of all wisdom.', publication_year: -322, is_public: true, user_id: 2, philosopher_id: 2, comment: 'A quote on self-awareness and wisdom.' },
  { text: 'Act only according to that maxim whereby you can, at the same time, will that it should become a universal law.', publication_year: 1785, is_public: true, user_id: 1, philosopher_id: 3, comment: 'Kant\'s categorical imperative.' }
])

QuoteCategory.create([
  { quote_id: 1, category_id: 1 },
  { quote_id: 2, category_id: 2 },
  { quote_id: 3, category_id: 3 }
])
