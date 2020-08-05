#2018/09/12

#links
https://drive.google.com/drive/folders/1NCA_DdUeFNfMYVX6JQw_QHspi3sunlIP
tinyurl.com/trentose2
tinyurl.com/trentose2git
https://github.com/mbaezpy/trentose2018-nodejs/tree/master/day1

### 2018/09/12

# nodejs, rest API
process  			--> variabile globale
process.argv[]  	--> argomento
module 							--> libreria
var fs = require("fs"); 		--> load module
isNaN(numvber)    --> isNaN

# Blocking / synchronous call
var data = fs.readFileSync(fileName, "utf8");

# Non-blocking calls (with callback function)
fs.readFile(fileName, "utf8", function(error, data) {
  console.log(data);
});

# Interacting with online services
var https = require('https')
https.get()
GET e POST   	--> http verb
404 , 500 		--> server state

JSON
http://json.parser.online.fr/
per fare il parsing json

# Blocking / synchronous call
var data = fs.readFileSync(fileName, "utf8");


# Non-Blocking / synchronous call
fs.readFile(fileName, "utf8", function(error, data) {
  console.log(data);
});


$ node
> 1+1
2
> console.log(a)
undefined

$ node hello.js 	--> esegue hello.js