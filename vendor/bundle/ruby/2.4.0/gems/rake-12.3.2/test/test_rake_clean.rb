# frozen_string_literal: true
require File.expand_path("../helper", __FILE__)
require "rake/clean"

class TestRakeClean < Rake::TestCase # :nodoc:
  def test_clean
    load "rake/clean.rb", true

    assert Rake::Task["clean"], "Should define clean"
    assert Rake::Task["clobber"], "Should define clobber"
    assert Rake::Task["clobber"].prerequisites.include?("clean"),
      "Clobber should require clean"
  end

  def test_cleanup
    file_name = create_undeletable_file

    out, _ = capture_io do
      Rake::Cleaner.cleanup(file_name, verbose: false)
    end
    assert_match(/failed to remove/i, out)

  ensure
    remove_undeletable_file
  end

  def test_cleanup_ignores_missing_files
    file_name = File.join(@tempdir, "missing_directory", "no_such_file")

    out, _ = capture_io do
      Rake::Cleaner.cleanup(file_name, verbose: false)
    end
    refute_match(/failed to remove/i, out)
  end

  def test_cleanup_trace
    file_name = create_file

    assert_output "", "rm -r #{file_name}\n" do
      with_trace true do
        Rake::Cleaner.cleanup(file_name)
      end
    end
  end

  def test_cleanup_without_trace
    file_name = create_file

    assert_output "", "" do
      with_trace false do
        Rake::Cleaner.cleanup(file_name)
      end
    end
  end

  def test_cleanup_opt_overrides_trace_silent
    file_name = create_file

    assert_output "", "" do
      with_trace true do
        Rake::Cleaner.cleanup(file_name, verbose: false)
      end
    end
  end

  def test_cleanup_opt_overrides_trace_verbose
    file_name = create_file

    assert_output "", "rm -r #{file_name}\n" do
      with_trace false do
        Rake::Cleaner.cleanup(file_name, verbose: true)
      end
    end
  end

  private

  def create_file
    dir_name = File.join(@tempdir, "deletedir")
    file_name = File.join(dir_name, "deleteme")
    FileUtils.mkdir(dir_name)
    FileUtils.touch(file_name)
    file_name
  end

  def create_undeletable_file
    dir_name = File.join(@tempdir, "deletedir")
    file_name = File.join(dir_name, "deleteme")
    FileUtils.mkdir(dir_name)
    FileUtils.touch(file_name)
    FileUtils.chmod(0, file_name)
    FileUtils.chmod(0, dir_name)
    begin
      FileUtils.chmod(0644, file_name)
    rescue
      file_name
    else
      skip "Permission to delete files is different on this system"
    end
  end

  def remove_undeletable_file
    dir_name = File.join(@tempdir, "deletedir")
    file_name = File.join(dir_name, "deleteme")
    FileUtils.chmod(0777, dir_name)
    FileUtils.chmod(0777, file_name)
    Rake::Cleaner.cleanup(file_name, verbose: false)
    Rake::Cleaner.cleanup(dir_name, verbose: false)
  end

  def with_trace(value)
    old, Rake.application.options.trace =
      Rake.application.options.trace, value

    # FileUtils caches the $stderr object, which breaks capture_io et. al.
    # We hack it here where it's convenient to do so.
    Rake::Cleaner.instance_variable_set :@fileutils_output, nil
    yield
  ensure
    Rake.application.options.trace = old
  end
end
