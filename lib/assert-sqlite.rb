require 'assert/result'
require 'assert/suite'
require 'assert/test'
require "sqlite3"

require "assert-sqlite/version"


module AssertSqlite

  DB_NAME = 'assert-sqlite-tests.sqlite3'

    # # Open a database
    # db = SQLite3::Database.new "test.db"

    # # Create a database
    # rows = db.execute <<-SQL
    #   create table numbers (
    #     name varchar(30),
    #     val int
    #   );
    # SQL

    # # Execute a few inserts
    # {
    #   "one" => 1,
    #   "two" => 2,
    # }.each do |pair|
    #   db.execute "insert into numbers values ( ?, ? )", pair
    # end

    # # Execute inserts with parameter markers
    # db.execute("INSERT INTO students (name, email, grade, blog)
    #             VALUES (?, ?, ?, ?)", [@name, @email, @grade, @blog])

    # # Find a few rows
    # db.execute( "select * from numbers" ) do |row|
    #   p row
    # end

  # This is a custom suite that stores test/result data in a sqlite db and
  # clears the data from memory

  class Suite < Assert::Suite

    def initialize(config)
      super(config)
      reset_db!
    end

    def reset_db!
      @assert_sqlite_db = SQLite3::Database.new(DB_NAME)
    end

    # Test data

    def ordered_tests
      DB.list_tests_by_order_asc(@assert_sqlite_db).map do |row|
        assert_sqlite_build_test(row)
      end
    end

    def reversed_tests
      DB.list_tests_by_order_desc(@assert_sqlite_db).map do |row|
        assert_sqlite_build_test(row)
      end
    end

    def ordered_tests_by_run_time
      DB.list_tests_by_run_time_asc(@assert_sqlite_db).map do |row|
        assert_sqlite_build_test(row)
      end
    end

    def reversed_tests_by_run_time
      DB.list_tests_by_run_time_desc(@assert_sqlite_db).map do |row|
        assert_sqlite_build_test(row)
      end
    end

    def test_count
      DB.count_tests(@assert_sqlite_db)
    end

    # Result data

    def ordered_results
      DB.list_results_by_order_asc(@assert_sqlite_db).map do |row|
        assert_sqlite_build_result(row)
      end
    end

    def reversed_results
      DB.list_results_by_order_desc(@assert_sqlite_db).map do |row|
        assert_sqlite_build_result(row)
      end
    end

    def ordered_results_for_dump
      DB.list_dump_results_by_order_asc(@assert_sqlite_db).map do |row|
        assert_sqlite_build_result(row)
      end
    end

    def reversed_results_for_dump
      DB.list_dump_results_by_order_desc(@assert_sqlite_db).map do |row|
        assert_sqlite_build_result(row)
      end
    end

    def result_count(type = nil)
      DB.count_results(@assert_sqlite_db, type)
    end

    # Callbacks

    def on_start
      DB.create_schema(@assert_sqlite_db)
    end

    def after_test(test)
      DB.insert_test(@assert_sqlite_db, test)
      DB.batch_insert_results(@assert_sqlite_db, test.results)
      # test.results.clear # TODO
    end

    def on_finish
      # self.tests.clear # TODO
    end

    private

    def assert_sqlite_build_test(row)
      Assert::Test.new({}) # TODO
    end

    def assert_sqlite_build_result(row)
      Assert::Result.new({}) # TODO
    end

  end

  module DB

    # manage db

    def self.create_schema(db)
      # TODO
    end

    def self.drop_db(db)
      # TODO
    end

    # save data

    def self.insert_test(db, test)
      # TODO: insert test run data into the db
    end

    def self.batch_insert_results(db, results)
      # TODO: batch insert test results into the db
    end

    # list data

    def self.list_tests_by_order_asc(db)
      # TODO
    end

    def self.list_tests_by_order_desc(db)
      # TODO
    end

    def self.list_tests_by_run_time_asc(db)
      # TODO
    end

    def self.list_tests_by_run_time_desc(db)
      # TODO
    end

    def self.list_results_by_order_asc(db)
      # TODO
    end

    def self.list_results_by_order_desc(db)
      # TODO
    end

    # dump results are failed or errored results OR
    # skipped or ignored results if they have a message
    def self.list_dump_results_by_order_asc(db)
      # TODO
    end

    def self.list_dump_results_by_order_desc(db)
      # TODO
    end

    # count data

    def self.count_tests(db)
      # TODO
    end

    def self.count_results(db, type)
      # TODO
    end

  end

end
