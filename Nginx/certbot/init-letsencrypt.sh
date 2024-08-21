# nginx/certbot/init-letsencrypt.sh
#!/bin/bash

domains=(your_domain www.your_domain)
rsa_key_size=4096
data_path="./nginx/certbot"
email="your_email@example.com"
staging=0 # Set to 1 for testing

# Add certbot commands and hooks here
