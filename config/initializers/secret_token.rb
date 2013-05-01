# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Guild::Application.config.secret_key_base = 'ce7c90d944f41e09563ff2512f18248f2315455c37a2c449c0e5401c3fc621b30d57c989f1e7e8de59f7bd83dcd16d0991d40037430759ed79bdd21b774f31ec'
