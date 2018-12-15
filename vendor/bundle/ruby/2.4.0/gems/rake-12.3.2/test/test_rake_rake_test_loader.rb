# frozen_string_literal: true
require File.expand_path("../helper", __FILE__)

class TestRakeRakeTestLoader < Rake::TestCase # :nodoc:

  def setup
    super

    @loader = File.join @rake_lib, "rake/rake_test_loader.rb"
  end

  def test_pattern
    orig_loaded_features = $:.dup
    FileUtils.touch "foo.rb"
    FileUtils.touch "test_a.rb"
    FileUtils.touch "test_b.rb"

    ARGV.replace %w[foo.rb test_*.rb -v]

    load @loader

    assert_equal %w[-v], ARGV
  ensure
    $:.replace orig_loaded_features
  end

  def test_load_error_from_require
    out, err = capture_io do
      ARGV.replace %w[no_such_test_file.rb]

      assert_raises SystemExit do
        load @loader
      end
    end

    assert_empty out

    no_such_path = File.join @tempdir, "no_such_test_file"

    expected =
      /\A\n
       File\ does\ not\ exist:\ #{no_such_path}(\.rb)? # JRuby is different
       \n\n\Z/x

    assert_match expected, err
  end

  def test_load_error_raised_explicitly
    File.write("error_test.rb", "raise LoadError, 'explicitly raised'")
    out, err = capture_io do
      ARGV.replace %w[error_test.rb]

      exc = assert_raises(LoadError) do
        load @loader
      end
      assert_equal "explicitly raised", exc.message
    end
    assert_empty out
    assert_empty err
  end
end
