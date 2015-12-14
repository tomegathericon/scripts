#!/usr/bin/python
import time,boto,rsa
from boto import cloudfront
from boto.cloudfront import distribution

#AWS_ACCESS_KEY_ID="your access key"
#AWS_SECRET_ACCESS_KEY="your secret access key"


#conn = boto.cloudfront.CloudFrontConnection(AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY)
conn = boto.connect_cloudfront()
dist = conn.get_all_distributions()
a=dist[0].get_distribution()
#Set parameters for URL
key_pair_id = "APKAIRRGIEK5TQBHQ3SA" #cloudfront security key
priv_key_file = "/home/tomegathericon/cloudfront/pk-APKAIRRGIEK5TQBHQ3SA.pem" #cloudfront private keypair file
expires = int(time.time()) + 36400 #1 min
#url="http://dho8xtt9qy0ph.cloudfront.net"
url="https://dho8xtt9qy0ph.cloudfront.net"
print dist
signed_url = a.create_signed_url(url, key_pair_id, expires, private_key_file=priv_key_file)

print signed_url

