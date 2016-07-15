#!/usr/bin/env ruby

require 'securerandom'
require 'tempfile'
require 'test/unit'

TEMP_PREFIX = 'svfs-test'

class TestIntegration < Test::Unit::TestCase

  def setup
    @mountpoint = ENV['TEST_MOUNTPOINT']
    @container = ENV['TEST_CONTAINER']
    @old_name = "#{@mountpoint}/#{@container}/#{TEMP_PREFIX}.#{SecureRandom.hex}"
    @new_name = "#{@mountpoint}/#{@container}/#{TEMP_PREFIX}.#{SecureRandom.hex}"
  end

  # This test :
  # - creates an empty file using a unique name
  # - closes this file
  # - renames this file to somehting else (random)
  # - removes the new named file
  def test_empty_file
    file = File.open(@old_name, "w")
    file.close()
    File.rename(@old_name, @new_name)
    File.delete(@new_name)
  end

  # This test :
  # - creates an empty file using a unique name
  # - writes TEST_NSEG_SIZE * 1MB of data in it
  # - closes this file
  # - renames this file to somehting else (random)
  # - removes the new named file
  def test_standard_file
    File.open(@old_name, "w") do |f|
      ENV['TEST_NSEG_SIZE'].to_i.times do |iter|
        f.write(SecureRandom.random_bytes(2**20))
      end
      assert_equal(f.size, (2**20)*ENV['TEST_NSEG_SIZE'].to_i, "Wrong file size")
    end

    File.rename(@old_name, @new_name)
    File.delete(@new_name)
  end

  # This test :
  # - creates an empty file using a unique name
  # - writes TEST_SEG_SIZE * 1MB of data in it
  # - closes this file
  # - renames this file to somehting else (random)
  # - removes the new named file
  def test_segment
    File.open(@old_name, "w") do |f|
      ENV['TEST_SEG_SIZE'].to_i.times do |iter|
        f.write(SecureRandom.random_bytes(2**20))
      end
      assert_equal(f.size, (2**20)*ENV['TEST_SEG_SIZE'].to_i, "Wrong file size")
    end

    sleep 5
    File.rename(@old_name, @new_name)
    File.delete(@new_name)
  end

  # This test :
  # - creates an empty directory with a random name
  # - removes it
  def test_directory
    Dir.mkdir(@new_name)
    Dir.rmdir(@new_name)
  end

end
