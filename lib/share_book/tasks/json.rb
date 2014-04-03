require "json"

namespace :json do
    desc "generate book store json file"
    task :generate do
        books = ShareBook::Models::Book.all
        data = books.map { |e| e.to_hash }
        json = JSON.generate(data)
        File.open(ShareBook::JSONFILE, 'w+') { |f|
            f << json
        }
    end
end