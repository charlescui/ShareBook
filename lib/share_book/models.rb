require "data_mapper"
require "uri"

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{ShareBook::DBPATH}/store.sqlite3")

require "digest/md5"

module ShareBook::Models
    class Book
        include DataMapper::Resource  
        property :id, Serial
        property :name, String, :required => true, :length => 256
        property :ext, String, :required => true, :length => 8
        property :md5, String, :required => true, :length => 32
        property :created_at, DateTime, :required => true, :default => lambda{|r, p| Time.now.to_datetime }

        before :save do
        end

        def file_name
            "#{self.name}#{self.ext}"
        end

        def path
            File.join(ShareBook::BOOKPATH, self.created_at.strftime("%Y-%m-%d"), self.id.to_s, self.file_name)
        end

        def uri
            File.join(ShareBook::BOOKDIR, self.created_at.strftime("%Y-%m-%d"), self.id.to_s, URI.escape(self.file_name))
        end

        def compute_md5(path)
            self.md5 = Digest::MD5.file(path).hexdigest
        end

        def to_hash
            {
                uri: self.uri,
                md5: self.md5,
                name: self.name
            }
        end

        def self.generate_with_file(path, name = nil)
            book = Book.new
            if name
                book.name = name
            else
                arr = File.basename(path).split('.')
                arr.pop
                book.name = arr.join('.')
            end
            book.ext = File.extname(path)

            book.compute_md5(path)
            book.save

            FileUtils.mkdir_p(File.dirname(book.path))
            FileUtils.cp(path, book.path)

            book
        end
    end
end

DataMapper.auto_upgrade!