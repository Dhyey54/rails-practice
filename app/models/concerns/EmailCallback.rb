module EmailCallback
  def email_callback
    self.email = "ror_demo_#{email}" unless email.include? 'ror_demo'
  end
end
