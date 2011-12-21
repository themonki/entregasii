Hola

Explorando casi que toda la mañana y parte de la tarde esto fue lo que logre hacer , me base mucho en el diagrama E-R 
que ya se ha planteado y puse algunas dudas en la lista de google docs.

1. Pueden ver el modelo de datos abriendo index.htm sugiero que lo hagan con firefox no me abrio con chrome en mi caso
2. Use Enterprise arquitect para generar el sQL tuve bastante cuidado con esas llaves foraneas y la creacion de las tablas pero igualemente se me
pudo haber pasado algo sugiero una revisadita (Monki compañero de trabajo en esto xD a los demas almenos verlo)

Saludos.

Yerminson 

--correcciones modelo 
--solucion ambiguedades modelo datos dsii
--1. se modela que auxiliar vendio la tarjeta, se deja o se quita?   --- ------------MUERE SE QUITA xD ... se agrega entonces como atributos el costo de la targeta vendida, la fecha en que fue vendida y colocar una relacion de targeta ---- vendida en ------estacion

-- 2. en el gdocs de requrimientos dice 3.1.6 Colocar la fecha en que se hace la recarga y la estacion, esto no esta modelado ¿se hace una nueva relacion para esto que tenga, el valor de la recarga, auxiliar que recibe, pin, fecha, hora y estacion? -------------- va, pero se quita auxiliar

--3. se debe de mantener la fecha y hora de asignacion de un empleado a una estacion? si esto se hace las demas relaciones que impliquen guardar auxilair y estacion solo se guardaria auxiliar y de ahi se saca la estacion, o al contrario, se guarda estacion y se saca auxiliar ------------ se supone que nunca cambian de estacion

-- 4. para el credito se debe de guardar la fecha y la hora?? ---------no se guarda ninguno se cambia requerimiento

-- 5. cuando se asigna un bus a una ruta se guarda la fecha y la hora? ---------- si

