# SQL

Here we come to my favorite and really my first love in programming, SQL. SQL stands for Structured Query Language and it is meant to be read from top to bottom and to be almost like reading a sentence of sorts. SQL is used any time you interact with a relational database. It is either you running SQL directly or it is some program running SQL on your behalf.

## The Goal Here

Unfortunately you cannot really run SQL if there is not database to run it against. So here we have a few bash scripts. One will launch the database and the other will tear it down. Once the database is up and running you will be provided with a window in your browser to view through which you can write SQL. The database should be pre-populated with some data so we will log in and run a few simple queries to get down the basics of what it is and how it works.

### Running the code

In a terminal run `./up.sh` to create the database and open the browser window.

Log into the PostgreSQL database with the provided username and password, and try to answer a few questions about the data.

In order to actually answer these questions though, you will need to know some SQL!

Click into the database named `app` and then on the lefthand side of the browser window you should be able to see the button for `SQL Command`. Click that and let's dive into some SQL basics!

### SQL Fundamentals

There are a lot of things you can do with SQL. You can create complex databases and dependencies, model data and relationships between data points, and most importantly you can "query" the data in the database. Querying the data is asking a question of a database and receiving an answer in return. For certain questions you need many data points, sometimes you just need one number or sometimes maybe you need everything. 

[W3 schools](https://www.w3schools.com/sql/default.asp) has a great intro into using SQL so honestly I will not repeat that stuff here.

Here I will focus mostly on the querying and leave the other parts of SQL for another day. Go ahead and try to answer some of the question below. I will give a few hints, but try to figure it out and honestly Google it. Google is the great equalizer and without Google I would be completely unable to do my job today.

### The Questions

1. How many customers do we have?
    - In the `SQL Command` window, type `SELECT * FROM customers` and then click `Execute`. What happened?
    - `SELECT` is what you are asking the database to give you and `FROM` is where you get that selection from, and `*` is shorthand for "everything". Easy enough. Play around with some variations of it.
    - Try `SELECT COUNT(*) FROM customers`, what happens now?
    - How about `SELECT MAX(id) FROM customers`?
2. Which product id sold the most units?
    - Take a look at `SUM()` and `GROUP BY` 
3. Which month did we sell the most product by dollars in 2021?
    - You might need to do a calculation on the `units` and `price`.
4. Which month did we sell the most product by units in 2021?
    - Try out the `ORDER BY` clause to sort results.
5. What is our most profitable product?
    - In this case you might need to use a `JOIN` to get the product cost along with the sales.
6. What is our most profitable category?
7. Which category manager brought in the most dollars?
