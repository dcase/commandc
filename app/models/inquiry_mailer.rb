class InquiryMailer < ActionMailer::Base
  

  def inquiry(inquiry)
    subject    proc { inquiry.is_spam ? '**SPAM** inquiry from commandc.com' : 'new inquiry from commandc.com' }
    recipients 'case_darren@yahoo.com'
    from       'COMMAND C inquiry <inquiries@commandc.com>'
    content_type 'text/html'
    sent_on    Time.now
    
    body       :inquiry => inquiry
  end

  def confirm(inquiry)
    subject    'InquiryMailer#confirm'
    recipients ''
    from       ''
    sent_on    Time.now
    
    body       :inquiry => inquiry
  end

end
