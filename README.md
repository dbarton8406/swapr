## Swapr

A simple file sharing service. 

## API

**Authentication Notes**:

To make an authenticated request in any case other than registering
or deleting an account, you must supply an `Access-Token` header with
a valid access token. Otherwise, you'll receive a 401 Forbidden error.

### Registering an Account

#### POST `/signup`

**Params**:

`email`: An email address, must be unique.
`username`: A username, must be unique.
`password`: A password.

**Response**:

If the user was created successfully, you should receive status code 201 and ...

```
{
  "user": {
    "id": 8,
    "username": "apifan",
    "email": "such@api.wow.com",
    "access_token": "9f5b8ebf876121c3fc4c0fa18a511e16"
  }
}
```

If the user could not be created, you should receive status code 422 and ...

```
{
  "errors": [
    "Email has already been taken",
    "Username has already been taken"
  ]
}
```

### Deleting an Account

#### DELETE `/signup`

**Params**:

`email`: Your user account's email address.
`password`: Your user account's password.

**Response**:

If successful:

.... status code and JSON

Otherwise:

not logged in

.... status code and JSON

### Logging In

#### POST `/login`

**Params**:

`username`: String
`password`: String 

**Response**:

If the user was created successfully, you should receive status code 201 and ...

```
{
  "user": {
    "id": 8,
    "username": "apifan",
    "email": "such@api.wow.com",
    "access_token": "9f5b8ebf876121c3fc4c0fa18a511e16"
  }
}
```

If the user could not be created, you should receive status code 422 and ...

```
{
  "errors": [
    "Email has already been taken",
    "Username has already been taken"
  ]
}
```
