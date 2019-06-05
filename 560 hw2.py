import pymysql
import results as results

sakila = pymysql.connect("localhost","root","zmL1995515","sakila" )


cursor = sakila.cursor()

sql = "select first_name, last_name,title, film_id, description FROM sakila.film, sakila.actor WHERE title like '%zo%'"
try:
    cursor.execute(sql)
    results = cursor.fetchall()
    for row in results:
        first_name = row[0]
        last_name = row[1]
        film_id = row[2]
        description = row[3]

        print ("first_name = %s,last_name = %s,film_id = %s,description = %s" % (first_name, last_name, film_id, description))

except:
   print ("Error: unable to fecth data")