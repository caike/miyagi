# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Miyagi_session',
  :secret      => '3845892f2cd3db14a424675905ade9b782724b40d90ab3c6ac2e6446a15b39cf4a2fd962e6fb57eadfe233af5f10d593743d037db5c5d9c2331c49a4a6563278'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
