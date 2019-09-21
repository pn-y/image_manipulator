require 'test_helper'

class ImageManipulationServiceTest < Minitest::Test
  def test_manipulate
    image = File.open(Rails.root.join('test/fixtures/files/ruby.jpg'))
    manipulations = { rotate: '-90', flip: nil }

    result = ImageManipulationService.manipulate(image.path, manipulations)
    result_md5 = Digest::MD5.hexdigest(File.read(result))
    expected_md5 = Digest::MD5.hexdigest(File.read(Rails.root.join('test/fixtures/files/ruby_rotated_fliped.jpg')))

    assert_equal(result_md5, expected_md5)
  end
end
