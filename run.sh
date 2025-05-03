  sudo docker run -it \
  --rm \
  --name dev-env-container \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  --privileged \
  sql    
  
#   SQL LAB
# 1. Identify real world problem and develop the problem statement. Design an Entity-Relationship (ER) /
# Extended Entity-Relationship (EER) Model.
# 2. Mapping ER/EER to Relational schema model.
# 3. Create a database using DDL and apply integrity constraints.
# 4. Perform data manipulations operations on populated database.
# 5. Perform Authorization using Grant and Revoke.
# 6. Implement Basic and complex SQL queries.7. Implementation of Views and Triggers.
# 8. Demonstrate database connectivity using JDBC.
# 9. Execute TCL commands.
# 10. Implement functions and procedures in SQL
# 11. Implementation of Cursor.
# 12. Implementation and demonstration of Transaction and Concurrency control techniques using locks.

# (Required Tools : MySQL Compiler, Eclipse IDE, PostgreSQL, JDK, JDBC Driver, Dia Diagram Editor
# 0.97.2,vscode, Text editor,browser )
 
#   steps for testing the image 

#   MySQL Compiler - sudo service mysql start
#   sudo mysql -u root
#   SHOW DATABASES;


#  Eclipse IDE - 
#  ./eclipse-installer/eclipse-inst

  
#   PostgreSQL- 
#   sudo service postgresql start
#   sudo -u postgres psql

#   test - CREATE DATABASE testdb;
#   \c testdb
#   CREATE TABLE test_table (id SERIAL PRIMARY KEY, name VARCHAR(100));
#   INSERT INTO test_table (name) VALUES ('Test');
#   SELECT * FROM test_table;
  
#    exit -\q
  
#   JDK, JDBC Driver - 
#   java -version
#   javac -version

#   Dia Diagram Editor- dia
#   vscode - code .
#   Text editor - gedit
#   browser - google-chrome





