namespace :store do
    desc "delete all of books and database and store.json"
    task :drop do
        ShareBook.drop_books
        ShareBook.drop_db
        ShareBook.drop_json
    end
end