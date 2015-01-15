class ValidateEmails
  attr_reader :emails, :valid_emails, :invalid_emails

  def initialize(email_string)
    @emails = email_string.split
    @valid_emails = @emails.select { |email| EmailValidator.valid? email }
    @invalid_emails = @emails.select { |email| !EmailValidator.valid? email }
  end

  def all_valid?
    @invalid_emails.empty?
  end
end
