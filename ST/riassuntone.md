# network traffic
- eavesdropping: listen conversation
- replay: send collected data back
- spoofing: mimic as if data came from one of the parties
- tampering: modifying data on the network
- hijacking: cut one party out, continue conversation with the other

problem: the network protocol used by the application is not secure (no SSL) and the attacker can intercept, understand and change the data communicated over the network, including authentication and sensitive data.



use secure protocols such as SSL/TLS
don't pass potentially import data from the web app to the client hoping the user dont see it or modify it (hidden form fields)


# hidden form field and magic URLs
problem: a web application relies on hidden form fields or magic URL parameters to transmit sensitive information.

- read from a form or a URL
- data used to make security, trust, or authentication decision
- the communication was via insecure or untrusted channel

fix: 
- use https
- use hashed message authentication code (HMAC) to protect the integrity of hidden field values with a key stored on the server.

summary:
problem: a web application relies on hidden form fields or magic URL parameters to transmit sensitive information.
- use a secure channel(https) to exchange sensitive information
- add a hashed message authentication code (HMAC)to protect the integrity of hidden field values.

# improper use of SSL and TLS
- certificate not valid, signature not verified, wrong time, certificate revocated, not proper certificate.
problem: while authentication checks are mandatory in the https protocol, if programmers use low level SSL/TLS libraries directly, they might forget some important authentication check, eventually accepting invalid certificates form malicious users.

summary: 
problem: programmers useing low level SSL/TLS libraries directly might forget some important authentication checks:
- validate the certification authority
- verify the integrity of the certification authority signature
- check the time validity of the certificate 
- check the domain name in the certificate
- consult the certificate revocation list

# weak password
>care about the response time 

problem: the sytem does not adopt all appropriate measures to ensure password are not easily stolen or guessed.

fix: 
- use PBKDF2 as defined in the public key cryptography standard (PKC5) to hash the password into the persistently stored value (validator)
- iterate password hashing to increase response time, enforce strong passwords
- raise barriers to password reset
- manage login attempets, increase response time when more login failures occur
- blacklist IP addresses and alert the user
- use multifactor authentication, use one-time passwords

summary:

problem: the sytem does not adopt all appropriate measures to ensure password are not easily stolen or guessed.
- enforce strong passwords
- use secure channel and protocol
- adopt strong password-reset procedures
- restrict the login attempts without denying the service
- store encrypted passwords, in secure persisten memory
- consider strong protection for critical applications.

# data storage
wrong read/write permissions granted to
- executables
- configuration files
- database files

if sensitive data are hardcoded then attackers accessing the code can 
easily reverse engineer them (even from binaries)

problem: attackers get access to sensitive data stored with wrong permissions or embedded in the code.

fix: use Data Protection API or Apple Keychain, apache store sensitive
data outside the webspace.

summary:
problem: attackers get access to sensitive data stored with wrong permissions or embedded in the code.
- set permissions properly 
- do not embed sensitive data in the code; store it securely, outside the web space
- scrub the memory once secret data is no longer needed


# information leakage
- time: time measures can leak information
- error messages: username correctness, version information
- stack information: C error contain the stack error.

problem: the attacker gains access to information about the target system, which makes his job easier.

fix: 
- use **cryptographic implementations** hardened against timing attacks
- ensure sensitive data are processed in a **time independent** way
- check that information is not leaked through **error messages**
- **check parameter passing** involving functions with a variable parameter list (format functions)
- perform **output validation** (symmetric to input validation), to ensure that no information leakage occurs.
- use data encryption to avoid communicating sensitive data in clear **over the network**
- display sensitive information only to users having the **necessary privileges** and/or connected locally

summary:
problem: the attacker gains access to leaked information.
- process sensitive data in a time independent way
- check error messages 
- check parameters passing
- perform output validation
- use data encryption
- display sensitive information only to privileged users.


# file access
concurrency problem
denial of service in case of error
directory traversal

problem: attackers take advantage of **race conditions** to delete or replace files, provide **device names** where file names are expected or **traverse directories** to access files without permission.
- never use a filename for more than one operation. Use a file handle instead. (it means use a pointer to the file instead than the name.)
- keep application files in safe directiories, not accessible publicly. To increase security, create a new user to run the application.
- Resolve the path (../ or symlink) before validating it.
- to increase security, lock files explicitly when first accessed.
- if a file is known to be zero size, truncate it to avoid perpopulation.
- check if a file is a real file, not a device, a symlink or a pipe.

summary:
problem: attackers delete or replace files, provide device names, or traverse directories.
- use handles for file operations
- keep application files in safe directories
- resolve the path before validating it (../)
- check the file type (disk file, device, pipe)


# network name resolution
problem: the application relies on a DNS for network name resolution, but the communication with the DNS can be spoofed.
- use cryptography (DNS certificate)
- when applicable, use DNS over HTTPS (DoH)


# race conditions
problem: the application crashed by concurrent code that is allowed to accesss data not protected through mutual exclusion.
- time of check and time of use (TOCTOU) should be within a protected time interval.
- use locks/mutual exclusion to protect data that may be accessed concurrently; write reentrat code.

summary:
problem: the application is crashed by concurrent code accessing unprotected data.
- time of check and time of use should be within a protected time interval
- use locks/mutual exclusion (mutex)
- write reentrant code
- use private stores for tmp files and dirs.

# unauthenticated keys
problem: a man-in-the-middle intercepts the keys exchanged to start an encrypted communication.
- key exchange alone is not secure.
- every party should be strongly authenticated before key exchange occurs.
- use off-the-shelf, well tested solutios for authentication and key exchange.

summary:///////// slide 40
