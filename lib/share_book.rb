require "share_book/version"
require "byebug"

module ShareBook
    TASKPATH = File.join(File.dirname(__FILE__), 'share_book', 'tasks')
    JSONFILE = File.join(File.dirname(__FILE__), '..', 'store.json')
    BOOKDIR = '/books'
    BOOKPATH = File.join(File.dirname(__FILE__), '..', BOOKDIR)
    DBPATH = File.join(File.dirname(__FILE__), '..', 'db' )

    # Your code goes here...
    def self.load_tasks
        Dir[File.join(TASKPATH,'*.rb')].each{|f| require f}
    end

    def self.drop_books
        Dir[File.join(BOOKPATH, '*')].each { |e| FileUtils.rm_rf e }
    end

    def self.drop_db
        ShareBook::Models::Book.destroy
    end

    def self.drop_json
        FileUtils.rm_f JSONFILE
    end
end

require "share_book/models"
