INSERT INTO mechanic (
    first_name,
    last_name
) VALUES (
    'Tyler',
    'Durden'
), (
    'Rogelio',
    'Rincon'
),(
    'Hammer',
    'Belnades'
)

INSERT INTO car(
    car_make,
    car_model,
    car_year
) VALUES (
    'Audi',
    'E-tron',
    2003
), (
    'Rolls Royce',
    'Phantom Viii',
    2017
), (
    'Skoda',
    'Rapid',
    2022
);

INSERT INTO service (
    car_id
) VALUES (1);

INSERT INTO service_mechanic (
    mechanic_id,
    service_ticket
) VALUES (1,1);

INSERT INTO service_history (
    car_id,
    service_ticket
) VALUES (1,1);

INSERT INTO customers (
    first_name,
    last_name
) VALUES (
    'David',
    'Rincon'
), (
    'Rogelio',
    'Rincon'
), (
    'Elvia', 
    'Rincon'
);

INSERT INTO customers (
    car_id
) VALUES (1);

INSERT INTO saleperson (
    first_name,
    last_name
) VALUES (
    'Aethe',
    'Lowenthal'
), (
    'Lex',
    'Luthor'
), (
    'Juan',
    'Debiedma'
);

INSERT INTO saleperson (
    customer_id
) VALUES (1);

INSERT INTO invoice (
    saleperson_id,
    car_id,
    customer_id
) VALUES (1,1,1);

CREATE OR REPLACE FUNCTION  add_customer_and_car (
    _car_make VARCHAR(45),
    _car_model VARCHAR(45),
    _car_year INTEGER,
    _first_name  VARCHAR(45),
    _last_name VARCHAR(45)
    )
RETURNS VOID
LANGUAGE plpgsql
AS $MAIN$
BEGIN
    --add the code block here
    INSERT INTO car(
        car_make,
        car_model,
        car_year)
    VALUES (_car_make, _car_model, _car_year);

    INSERT INTO customers(
        first_name, last_name
    ) 
    VALUES (_first_name, _last_name);

        -- commit the above statement inside of a transaction
END
$MAIN$;


SELECT add_customer_and_car('Toyota','Urban Cruiser',2005, 'Celeste', 'Montenegro')

SELECT add_customer_and_car('Hyundai', 'I20 N Line', 2004, 'Eric', 'Walker`')

