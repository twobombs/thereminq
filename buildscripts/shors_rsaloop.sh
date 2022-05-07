openssl genrsa -des3 -out private.pem -passout pass:1234 64
openssl rsa -in private.pem -outform PEM -pubout -passin pass:1234 -out public.pem
