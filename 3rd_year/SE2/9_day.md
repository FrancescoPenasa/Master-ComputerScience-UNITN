# come fare le cose sincrone

```k
/* meccanismo standard delle promises 
*	queste azioni vengono fatte in secuenza */
fetch ('google.com')
	.then(parametro => {
		//codice che deve venire eseguito
		return console.lot("finito")
	})
	.then(parametro2 => {
		//cosa che viene eseguita ancora dopo
		return console.log('finito anche questo')
	})
```

dalla versione 8 si può usare 'await' e 'async'

await

const response = await fetch(google.com);
//codice si ferma e aspetta l'esecuzione della fetch


fetch e response.json sono asyncrone
queste cose si possono usare solo nelle fuzioni asincrone

```
async function postBody(url, body){
	funzione asinscrona
}
```
Promise.all([parametri asincroni, spara tutte le fetch in parallelo e esegue il coddice suscessivo solo quando sono completate])


https://github.com/fabiounitn/apis/issues

# project - API rest and user stories
**user** --> 
quando l'utente fa sign up parte una post che ritornerà l'id dell'utente e lo crea nel database

/users/ lista utenti

/users/:id utente particolare.

si usa la PUT per creare account usando username
perchè PUT al contrario di POST non può creare due username uguali.


l'esame è un insieme di task, 
taskgroup -> [task, task, task] 

/tasks 	-> lo creo con un POST or PUT, potrebbe avere un attributo di tipo type /tasks?type=xy

/tasks/:id


/exams
	taskgroup; deadline; destinatari


/taskgroups `forse`


/classes `or usergroup`


/consegna


# user stories


per la prossima volta, cominciare con il gruppo a creare un repository github.com
creare API su apiary.io con il file del github
creare app vuota su heroku, (hello world) 
1 commit per ciascuno artificiale.
init github wiki
https://github.com/FrancescoPenasa/Sunrise_by_city/wiki/_new 	--> i links delle cose, con il tempo add project add issues e via come un treno.  