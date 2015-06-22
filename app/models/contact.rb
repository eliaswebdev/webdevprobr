class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "não é um formato de e-mail válido")
    end
  end
end

class Contact < ActiveRecord::Base
    # t.string   "name",       limit: 255
    # t.string   "email",      limit: 255
    # t.string   "subject",    limit: 255
    # t.string   "phone",      limit: 255
    # t.string   "mobile",     limit: 255
    # t.text     "message",    limit: 65535
    # t.integer  "status",     limit: 4	

    validates :name, :subject, :mobile, :message, presence: true
    validates :email, presence: true, email: true
    validates :name, length: { minimum: 3 }
    validates :message, length: { maximum: 140 }
end

