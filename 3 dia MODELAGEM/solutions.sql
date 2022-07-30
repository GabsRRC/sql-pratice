CREATE TABLE states (
	id SERIAL PRIMARY KEY,
	name TEXT UNIQUE NOT NULL
)

CREATE TABLE cities (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL UNIQUE,
	"stateId" integer REFERENCES states(id)
)

CREATE TABLE customerPhones (
	id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    number TEXT,
    type TEXT --landline or mobile
)

CREATE TABLE customerAddresses ( -- user so pode ter um endereço
	id SERIAL PRIMARY KEY,
	"customerId" INTEGER UNIQUE NOT NULL REFERENCES "customers"("id"),
    street TEXT,
    number TEXT, 
    complement TEXT,
    "postalCode" TEXT,
    "cityId" INTEGER NOT NULL REFERENCES "cities"("id")
)

CREATE TABLE customers (
	id SERIAL PRIMARY KEY,
	"fullName" TEXT,
    cpf TEXT,
    email TEXT,
    password TEXT
)

CREATE TABLE bankAccount (
	id SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    "accountNumber" INTEGER,
    agency INTEGER,
    "openDate" DATE,
    "closeDate" DATE
)

CREATE TABLE transactions (
	id SERIAL PRIMARY KEY,
	"bankAccountId" INTEGER NOT NULL REFERENCES bankAccount("id"),
    amount NUMERIC,
    type TEXT, --deposit or withdraw
    time TIMESTAMP,
    description TEXT,
    cancelled BOOLEAN 
)

CREATE TABLE creditCards (
	id SERIAL PRIMARY KEY,
	"bankAccountId" INTEGER NOT NULL REFERENCES bankAccount("id"),
    name TEXT,
    number INTEGER,
    "securityCode" INTEGER,
    "expirationMonth" DATE,
    "expirationYear" DATE,
    password TEXT
)