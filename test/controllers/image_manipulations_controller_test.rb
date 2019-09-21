require 'test_helper'

class ImageManipulationsControllerTest < ActionDispatch::IntegrationTest
  test 'POST #create' do
    file = fixture_file_upload('files/ruby.jpg')
    post image_manipulation_path, params: { manipulations: { rotate: '-90', flip: nil }, image: file }

    assert_response :success
    expected_md5 = Digest::MD5.hexdigest(File.read(Rails.root.join('test/fixtures/files/ruby_rotated_fliped.jpg')))
    assert_equal(Digest::MD5.hexdigest(response.body), expected_md5)
  end
end
