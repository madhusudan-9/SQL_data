create database sql_p;
use sql_p;

select * from automobile_data;

-- 1 What are Maximum price and body style with respect to different car maker?
select make, body_style, price from automobile_data where (make, price) in (select make, max(price) from automobile_data group by make);

/*:Obsevation:
- Mercedes benz with hardtop body_style has the highest price and no of max price for various makers lies in Sedan body_style

:Insights:
- Sedan Handle better due to lower center of gravity, due to this less pressure on tyres and other components.
- Mercedes benz uses innovative technology and makes most of its parts in Germany due to which it increases it price and also its maintanence cost.
*/

-- 2 What are No. of Makers for different driving_wheels?
select make, drive_wheels, count(make) as no_of_cars from automobile_data group by drive_wheels, make;

/*:Observation:
- Toyota has most no of forward driving and rear driving wheels

:Insights:
- Forward wheel driving offers much more safety than rare wheel drive as it is safer for car to off road frontwards than sideways and FWD offers much more fuel
economy than rwd. FWD are cheaper to build
- Toyotas are much more comfortable, quiet, good both on - off road and is much more durable so more no of cars are of Toyota*/

-- 3 What are the No. of makers with respect to different fuel type? 
select make, fuel_type, count(make) as no_of_cars from automobile_data group by fuel_type, make;

/*:Observations:
- Toyota and Nissan has most no of cars in gasoline, Merc has most no of cars in diesel
- Mainly car makers have focused on Gasoline driven cars.alter

:Insights:
- Gasoline is much more refined and thinner in density than diesel
- Gasoline burns faster and therefore it produces more power
- Diesel motors can prefer more load, so pickup trucks SUVs and Modern Convertibles are prefered with Diesel motors.*/

-- 4 What are No. of makers with respect to body_style?
select make, body_style, count(make) as no_of_cars from automobile_data group by body_style, make;

/*:Observation:
- In Hatchback, sedan, hardtop, wagon Toyota has most no of cars
- Alfa romero has most no of cars in convertible
- Mainly car makers focus more on hatchback, sedan and wagon

:Insights:
- Car makers usually focus more on user friendly body type which attainable by Hatchback and sedan type cars
- Hatchbacks are mainly more affordable and fuel efficient, smaller engine which leads to better mileage*/

-- 5 What is the Max Dimension with respect maker and no of doors in it?
select make, num_of_doors, max(wheel_base) as max_wheel_base, max(length) as max_length, max(width) as max_width, max(height) as max_height
	from automobile_data 
	group by make, num_of_doors;
    
 /*:Observations:
 - no of cars having two doors is one more than four doors
 - Merc with 4 doors and max wheel base and length, and with 2 doors max_width
 - Max height is dodge car maker 
 
 :Insights:
 - User friendly cars have mainly four doors 
 - Two doors hatchbacks are also available but are lesser compared to four doors*/
 
-- 6 What is Max horsepower and rpm with respect to maker and body style?
with Max_HP
as (select make, body_style, horsepower,peak_rpm from automobile_data where horsepower = (select max(horsepower) from automobile_data)),
Max_peak_rpm
as (select make, body_style, horsepower, peak_rpm from automobile_data where peak_rpm = (select max(peak_rpm) from automobile_data))
select * from Max_HP
union all
select * from Max_peak_rpm;
/*:Observations:
- Jaguar sedan type has max horsepower but it doesn't have max rpm
- Toyota has two car type with max rpms but it doesn't have max horsepower

:Insights:
- Jaguar's are mainy into sports car which are mainly of sedan type which has higher HP compared to other cars
- Toyotas are more user frienly due to that it has max rpm in sean as well as hatchback and has lesser HP*/

-- 7 What is the Maximum City and Highway MPG with respect engine type and car maker?
select make as Maker, engine_type, highway_mpg, city_mpg from automobile_data where (highway_mpg, city_mpg, engine_type) in 
	(select max(highway_mpg), max(city_mpg), engine_type from automobile_data group by engine_type); 

/*:Observaion:
- Honda has max city and highway miles per galon with OHC enginees
- mainly ohc and ohv engine types have higher mpg compared to dohc 

:Insights: 
- OHC engines have better performance, including higher RPM, better fuel efficiency, and more precise valve timing. 
- They also have a larger cylinder head to accommodate the camshaft, which allows for more flexibility in optimizing the intake and exhaust ports.
- Highway mpg is more compared to City mpg as in city more stop-and-start-driving is happening
*/

-- 8 What are the Losses, body type and aspirations with respect to car maker?
select make, normal_losses, body_style, aspiration from automobile_data where (normal_losses, make) in
	(select max(normal_losses), make from automobile_data group by make);
    
  /*:Observations:
  - Mainly car makers prefer standard aspirations other than turbo aspirations
  - Nissan has most losses associated with body style Hatchback
  
  :Insights:
  - Std aspiration makers have more normalised losses 
  - Std aspirations are more common than turbo as turbo cars have more air intake in combusition chambers and std has lesser
  - Standard air intake car engines are much more common due to which da to day losses in car makers of it are more*/      

-- 9 What is Max curb weight, make, no of cylinders with respect to body_style?
select make, curb_weight, num_of_cylinders, body_style from automobile_data where (curb_weight, body_style) in 
	(select max(curb_weight), body_style from automobile_data group by body_style);

/*:Observations:
- Jaguar has max curb weight with six num of cylinders aving sedan body style
- nissan has the least curb weight with six cylinders and hatchbak body style

:Insights:
- Curb weight is vehicle heaviness without passengers and standard equipments in it
- lighter weight leads to better handling, quicker, and better performance handling
- Nissan has better handling compared to other other makers
- Lesser advantage of higher curb weights, they protect the occupants much better than than ligher vehicles, and they do have greater HP*/

-- 10 What is the Max City mpg of maker with respect to fuel system of it?
select make, city_mpg, fuel_system from automobile_data where (city_mpg, fuel_system) in
	(select max(city_mpg), fuel_system from automobile_data group by fuel_system);

/*:Observations:
- Honda has the max city_mpg with 1bbl fuel system
- Dodge has least city_mpg with mfi fuel system

:Insights:
- Due to old cars more cars are of 2bbl fuel system
- Single barrel is much preferred than 2 barrel, due to better fuel efficiency
- idi has quieter fuel combustion, and combustion system that is more ameable to high speed operation
- as 2 barrel delivers more fuel but it does not equate to higher mpg*/

-- 11 What are the symbolings with respect to max normal losses?
select make, normal_losses, symboling from automobile_data where (normal_losses, make) in
	(select max(normal_losses), make from automobile_data group by make);
    
 /*:Observtions:
 - Alfa has the symboling of 3 which referes to more risky auto 
 - More car makers are in the rating of 0 symboling
 - Volvos have more cars in safer auto
 
 :Insights:
 - Volvos are much strongly build which leads to high safety for the passengers
 - 1 and 2 symboling are lesser prone to risk than 3, which are more of lighter vehicles and much more speedy compared to other makers
 - Toyota has most 0 symboling vehicles which is in middle of safe and risky.
 */   