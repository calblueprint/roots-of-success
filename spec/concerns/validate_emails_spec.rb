require "spec_helper"

RSpec.describe ValidateEmails do
  describe "#emails" do
    let(:emails) { "test@test.com\nsam@sam.com" }
    let(:email_validator) { ValidateEmails.new emails }

    it "returns array of inputted emails" do
      expect(email_validator.emails).to eql %w(test@test.com sam@sam.com)
    end
  end

  context "with all valid emails" do
    let(:emails) { "hello@hello.com sam@sam.com world@world.com" }
    let(:email_validator) { ValidateEmails.new emails }

    describe "#valid_emails" do
      it "returns array of valid emails" do
        expect(email_validator.valid_emails).to eql %w(hello@hello.com sam@sam.com world@world.com)
      end
    end

    describe "#invalid_emails" do
      it "returns empty array" do
        expect(email_validator.invalid_emails).to eql []
      end
    end

    describe "#all_valid?" do
      it "returns true" do
        expect(email_validator.all_valid?).to be true
      end
    end
  end

  context "with invalid and valid emails" do
    let(:emails) { "hello@hello.com sam.com world@world.com" }
    let(:email_validator) { ValidateEmails.new emails }

    describe "#valid_emails" do
      it "returns array of valid emails" do
        expect(email_validator.valid_emails).to eql %w(hello@hello.com world@world.com)
      end
    end

    describe "#invalid_emails" do
      it "returns array of invalid emails" do
        expect(email_validator.invalid_emails).to eql %w(sam.com)
      end
    end

    describe "#all_valid?" do
      it "returns false" do
        expect(email_validator.all_valid?).to be false
      end
    end
  end
end
