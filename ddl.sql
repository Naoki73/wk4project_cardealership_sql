CREATE TABLE mechanic (
    mechanic_id SERIAL PRIMARY KEY, 
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);

CREATE TABLE car (
    car_id SERIAL PRIMARY KEY,
    car_make VARCHAR(45),
    car_model VARCHAR(45),
    car_year VARCHAR(45)
);

CREATE TABLE service (
    service_ticket SERIAL PRIMARY KEY,
    car_id INTEGER,
    FOREIGN KEY (car_id) REFERENCES car(car_id)
);

CREATE TABLE service_mechanic (
    service_mechanic_id SERIAL PRIMARY KEY,
    mechanic_id INTEGER,
    service_ticket INTEGER,
    FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id),
    FOREIGN KEY (service_ticket) REFERENCES service(service_ticket)
);

CREATE TABLE service_history (
    service_history_id SERIAL PRIMARY KEY,
    car_id INTEGER,
    service_ticket INTEGER,
    FOREIGN KEY (car_id) REFERENCES car(car_id),
    FOREIGN KEY (service_ticket) REFERENCES service(service_ticket)
);

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    car_id INTEGER,
    FOREIGN KEY (car_id) REFERENCES car(car_id)
);

CREATE TABLE saleperson (
    saleperson_id SERIAL PRIMARY KEY,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    customer_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE invoice (
    invoice_id SERIAL PRIMARY KEY,
    saleperson_id INTEGER,
    car_id INTEGER,
    customer_id INTEGER,
    FOREIGN KEY (saleperson_id) REFERENCES saleperson(saleperson_id),
    FOREIGN KEY (car_id) REFERENCES car(car_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

SELECT * FROM saleperson 