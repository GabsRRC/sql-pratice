CREATE TABLE states (
	id SERIAL PRIMARY KEY,
	name TEXT VARCHAR(50) UNIQUE NOT NULL
)

CREATE TABLE cities (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL VARCHAR(50) UNIQUE
	"stateId" INTEGER NOT NULL REFERENCES "state"("id")
)

CREATE TABLE customerPhones (
	id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customer"("id")
    number TEXT VARCHAR(12)
    type ENUM('landline', 'mobile') --landline or mobile
)

CREATE TABLE customerAddresses ( -- user so pode ter um endereço
	id SERIAL PRIMARY KEY,
	"customerId" INTEGER UNIQUE NOT NULL REFERENCES "customer"("id")
    street TEXT 
    number TEXT VARCHAR(12)
    complement TEXT
    "postalCode" TEXT VARCHAR(12)
    "cityId" INTEGER NOT NULL REFERENCES "cities"("id")
)

CREATE TABLE customers (
	id SERIAL PRIMARY KEY,
	"fullName" TEXT
    cpf VARCHAR(12)
    email TEXT
    password TEXT
)

CREATE TABLE bankAccount (
	id SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES "customer"("id")
    "accountNumber" INTEGER
    agency INTEGER
    "openDate" DATE
    "closeDate" DATE
)

CREATE TABLE transactions (
	id SERIAL PRIMARY KEY,
	"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id")
    amount NUMERIC
    type ENUM('deposit', 'withdraw') --deposit or withdraw
    time TIMESTAMP
    description TEXT
    cancelled BOOLEAN 
)

CREATE TABLE creditCards (
	id SERIAL PRIMARY KEY,
	"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id")
    name TEXT
    number INTEGER
    "securityCode" INTEGER
    "expirationMonth" DATE
    "expirationYear" DATE
    password TEXT
    limit NUMERIC
)