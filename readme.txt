Simple sample for iOS push notification.

Usage:
* Create cer file and pem files.
* Create provisioning files on iOS dev center.
* Build the application.
* Copy cer and pem files to ruby/ directory. 
* Write device token displayed by NSLog into ruby/push_notification.rb 
* $ ruby ruby/push_notification.rb

How to make pem files from p12:
$ openssl pkcs12 -clcerts -nokeys -out apns-dev-cert.pem -in apns-dev-cert.p12
$ openssl pkcs12 -nocerts -out apns-dev-key.pem -in apns-dev-key.p12
$ openssl rsa -in apns-dev-key.pem -out apns-dev-key-noenc.pem
$ cat apns-dev-cert.pem apns-dev-key-noenc.pem > apns-dev.pem

Reference:
* http://developer.apple.com/jp/devcenter/ios/library/documentation/RemoteNotificationsPG.pdf
* http://iphone.longearth.net/2009/09/01/%E3%80%90iphone%E3%80%91push-notification%E3%81%AE%E5%AE%9F%E8%A3%85%E6%96%B9%E6%B3%95/
thanks!

