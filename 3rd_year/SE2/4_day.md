#test
se cambi il codice e fai switch ad una branch git si arrabbia.

git remote -v
git remote add <url>

git push origin master --> spedire i file sul rep centralizzato
git push esse3 syllabus
git push <nameremote> <namebranch>

git pull --> stessa roba

pull = fetch + merge

git branch -a --> mostra anche le branch remote

dopo il fetch puoi andare a ispezionare il codice con git checkout in un
branch che trovi in gi t branch -a

git reset --> sposta il puntatore master 

git stash		-->		
git stash pop 	-->


# MERGING.
git checkout master
git merge featurebranch

# REBASING
git checkout master
git rebase feature

git rebase -i --> comprimere i commit

#git workflow