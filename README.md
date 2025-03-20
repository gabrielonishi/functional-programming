# Insper: Programação Funcional

### Symmetric Encryption (Password Only)

To encrypt:
```bash
gpg --symmetric --cipher-algo AES256 myfile.pdf
``` 

To decrypt:

``` 
gpg --decrypt myfile.pdf.gpg > myfile.pdf
``` 

This method does not require a GPG key, just the password.