require 'test_helper'

class InquiryMailerTest < ActionMailer::TestCase
  tests InquiryMailer
  def test_inquiry
    @expected.subject = 'InquiryMailer#inquiry'
    @expected.body    = read_fixture('inquiry')
    @expected.date    = Time.now

    assert_equal @expected.encoded, InquiryMailer.create_inquiry(@expected.date).encoded
  end

  def test_confirm
    @expected.subject = 'InquiryMailer#confirm'
    @expected.body    = read_fixture('confirm')
    @expected.date    = Time.now

    assert_equal @expected.encoded, InquiryMailer.create_confirm(@expected.date).encoded
  end

end
