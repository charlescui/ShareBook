namespace :book do
    desc "add a book. rake book:add path= and [name=]"
    task :add do
        raise ArgumentError, "Need a book path= and [name=]." if !ENV["path"]
        book = ShareBook::Models::Book.generate_with_file(ENV["path"], ENV["name"])
    end
end