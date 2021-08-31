## Getting Started

Normal setup for db. Make sure to run the seed.

Run `EDITOR="mate --wait" bin/rails credentials:edit`

Add this this in the credentials

```
jws_token:
  hmac_secret: your_secret_shhh
  algorith: your_algorithm_here
```

## Helpful Curl Commands

Created a user
`curl --header "Content-Type: application/json" --request POST --data '{ "user": { "username": "bob", "password": "1234" } }' localhost:3000/users`

Authenticate user
`curl --header "Content-Type: application/json" --request POST --data '{ "authenticate": { "username": "bob", "password": "1234" } }' localhost:3000/authenticate`

Pass token and url to debigulate
`curl --header "Authorization: Bearer < token goes here >" --header "Content-Type: application/json" --request POST --data '{ "url": "https://amazon.com" }' localhost:3000/link`
