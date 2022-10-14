ALTER DATABASE demo SET bookings.lang = en;


-- los 3 aeropuertos con mas vuelos 
SELECT ad.airport_name, count(f.departure_airport) AS total_flights FROM flights f    
INNER JOIN airports_data ad  ON f.departure_airport = ad.airport_code
GROUP BY airport_name ORDER BY total_flights DESC LIMIT 3;

-- los 3 aeropuertos con menos vuelos 
SELECT ad.airport_name, count(f.departure_airport) AS total_flights FROM flights f    
INNER JOIN airports_data ad  ON f.departure_airport = ad.airport_code
GROUP BY airport_name ORDER BY total_flights ASC  LIMIT 3;


-- mostrar el valor promedio de ticket por avion 

SELECT f.aircraft_code, avg(tf.amount) as average_amount FROM flights f 
inner join ticket_flights tf ON f.flight_id = tf.flight_id 
inner join aircrafts_data ad ON f.aircraft_code = ad.aircraft_code
group by f.aircraft_code ORDER BY average_amount DESC 