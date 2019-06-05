## accessing a mysql database from python

# import needed modules
import pymysql

# open database connection
#                     server       userid     pw        db name
db = pymysql.connect("localhost","testuser", "test123", "testdb")


# prepare a cursor object using cursor() method
cursor = db.cursor()

## display information from database

# create an sql statement
sql = """select * from employee """

# build a try - exception block
try:

    # execute the sql command
    cursor.execute(sql)

    # fetch all the rows in a list of lists
    results = cursor.fetchall()
    #print header
    print("id\tfirst\tlast\tage\tsex\tincome")
    for row in results:
        emp_id = row[0] # 1st column item in current row
        fname = row[1] # 2nd column item in current row
        lname = row[2] # 3rd column
        age = row[3] # 4th
        sex = row[4]
        income = row[5]

        # let's print the current row
        print("%d\t%s\t%s\t%d\t%s\t%d" %\
              (emp_id, fname, lname, age, sex, income))
except:
    print("Error: unable to fetch data")

## insert information into database

# create the sql statement for insert
sql = """insert into employee(first_name, last_name, age, sex, income)
         values ('Minni', 'Mouse', 90, 'M', 3000)"""

try:
    # execute sql command
    cursor.execute(sql)
    # commit changes to the database
    db.commit()
except:
    # rollback in case there is any error
    db.rollback()

## update information in database

# create the sql statement for update
sql = """update employee set age = age + 2 where sex = 'M' """

try:
    # execute sql command
    cursor.execute(sql)
    # commit changes to the database
    db.commit()
except:
    # rollback in case there is any error
    db.rollback()

# disconnect from server
db.close()
