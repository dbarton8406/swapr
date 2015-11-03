## Swapr

A simple file sharing service. 

## API

### Registering an Account

#### POST `/signup`

**Params**:

`email`: An email address, must be unique.
`username`: A username, must be unique.
`password`: A password.

**Response**:

If the user was created succesfully,

..... Status Code and JSON

If the user could not be created,

..... Status Code and JSON

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
