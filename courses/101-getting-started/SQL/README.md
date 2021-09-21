# SQL

Here we come to my favorite and really my first love in programming, SQL. SQL stands for Structured Query Language and it is meant to be read from top to bottom and to be almost like reading a sentence of sorts. SQL is used any time you interact with a relational database. It is either you running SQL directly or it is some program running SQL on your behalf.

## The Goal Here

Unfortunately you cannot really run SQL if there is not a database to run it against (except maybe on [db-fiddle](https://www.db-fiddle.com/)). So here we have a few bash scripts. One will launch the database and the other will tear it down. Once the database is up and running you will be provided with a window in your browser to view through which you can write SQL. The database should be pre-populated with some data so we will log in and run a few simple queries to get down the basics of what it is and how it works.

### Running the code

In a terminal run `./up.sh` to create the database and open the browser window.

Log into the PostgreSQL database with the provided username and password, and try to answer a few questions about the data.

In order to actually answer these questions though, you will need to know some SQL!

Click into the database named `app` and then on the left hand side of the browser window you should be able to see the button for `SQL Command`. Click that and let's dive into some SQL basics!

Run the `./down.sh` script when you're all done to tear down the database.

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


### Helpful Concepts

#### JOINs

If you are coming from an Excel background and are used to rows, columns, cells, pivot tables, formulas, and `VLOOKUP()`s then you should be able to comfortably translate that conceptual know-how into the world of SQL and relational databases. In a relational database (which is the kind we have here) we have tables. Excel also has a concept of tables, where you can name a column and then refer to it in formulas on other tabs or sheets. With SQL we refer to tables by their names and then the columns of those tables by their names. We do not actually refer to rows explicitly but we can refer to certain columns which may contain unique values or something called a `PRIMARY KEY` which indicates the unique identifier for a particular row that other tables can refer to in their own data.

A `JOIN` in SQL is _kind of_ like a `VLOOKUP()` but there are some key differences. First, here are the similarities:

1. They allow you to pull data from another table into the one you are looking at now

The differences:

1. `VLOOKUP()` will return only the first match (searching top to bottom) whereas a `JOIN` returns any and all matches. When many rows are matched on the `JOIN` condition, it will result in a duplication of rows in your output.
2. `VLOOKUP()` can only refer to one column as the column to key off of (when you need several usually you `CONCATENATE()` in Excel), but in SQL you can `JOIN` on as many criteria as you want using `AND` as well as `OR` to specify exactly what conditions need to be met.
3. When `VLOOKUP()` does not find a match in the other table, then you get the infamous `#N/A` error in your cell. When a `JOIN` does not find a match, you get to tell it what happens. There are several types of `JOIN`s and it is helpful to think of those in terms of a venn diagram. For a `LEFT JOIN`, if no match is found it returns `NULL` or the empty value. For an `INNER JOIN` (or just the default `JOIN` keyword) then if nothing is matched, then the source table row is omitted entirely from the result set. There are a few other types of `JOIN`s so take a look at them ![here for that venn diagram view](https://www.securesolutions.no/wp-content/uploads/2014/07/joins-1.jpg).

#### Aggregations

Aggregating things in SQL using functions like `SUM()`, `COUNT()`, `MIN()`, `MAX()`, `AVG()`, etc... requires "grouping" in order to be displayed along with the actual values that you are aggregating against. Think of this as working pretty much exactly like a pivot table works, just without the cross-tab capabilities. So if you are getting a `SUM()` of `sales` over certain `dates` values, you can `SUM(sales)` but you cannot simultaneously display the `dates` unless you use the `GROUP BY` to "group" those `sales` aggregates byt the `dates`.