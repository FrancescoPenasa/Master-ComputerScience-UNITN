
```
		      travis
			^
			|
apiary 	-> 	     github 	-> heroku
			^
			|
		      local
```
# travis
con travis fai i test e se i test passano va direttamente su heroku

> travis-ci.com

per fare testing usiamo il framework `jest`
npm install --save-dev jest

in `package.json` change
```
"scripts":{
	"test": "jest"
}
```
and add

```
"jest": {

  "verbose": true,

  "collectCoverage": true
},
```


scrivo un insieme di casi di test per testare le funzionalità, con differenti input


```
npm test
```
*prende tutti i file * .test.js e li testa con jest*


``` expect.assertion(n) ```
n -> numero di expect nella funzione


scrivere casi di test prima (o dopo) e vanno fatti per ogni file.


a questo punto ci attacchiamo a travis
oltre a collegare account va aggiunto il file
#### .travis.yml
```
language: node_js
node_js:
- "8"
```

per le cose un po' segrete tipo le keys si può usare 
```process.env.def``` nel codice e copiare la key su heroku

key mapquest = TEk64IAYCLwiOukbMn3UC878UMWRHxJD