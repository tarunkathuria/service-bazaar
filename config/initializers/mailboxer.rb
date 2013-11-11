Mailboxer.setup do |config|

  #Configures if you applications uses or no the email sending for Notifications and Messages
  config.uses_emails = false

  #Configures the default from for the email sent for Messages and Notifications of Mailboxer
  config.default_from = "no-reply@mailboxer.com"

  #Configures the methods needed by mailboxer
  config.email_method = :email
  config.name_method = :name

  #Configures if you use or not a search engine and which one are you using
  #Supported engines: [:solr,:sphinx]
  config.search_enabled = false
  config.search_engine = :solr
end
