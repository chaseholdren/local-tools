```powershell
mkcert -install
mkcert --cert-file ssl/proxy-cert.pem --key-file ssl/proxy-cert-key.pem localhost 127.0.0.1 ::1

choco install openssl
openssl dhparam -out nginx-config/dhparams.pem 2048
```