# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_osp_session',
  :secret      => '8d6db6e480106376d60588450bdfa1dfe8c77efc660645afd53a2835f26f61e23c1d084c065abdce004de5459e05c4640f70c77029e4c65d889ad240bf0384d3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store
