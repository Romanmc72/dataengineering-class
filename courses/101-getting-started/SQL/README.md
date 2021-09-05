# SQL

Here we come to my favorite and really my first love in programming, SQL. SQL stands for Structured Query Language and it is meant to be read from top to bottom and to be almost like reading a sentence of sorts. SQL is used any time you interact with a relational database. It is either you running SQL directly or it is some program running SQL on your behalf.

## The Goal Here

Unfortunately you cannot really run SQL if there is not database to run it against. So here we have a few bash scripts. One will launch the database and the other will tear it down. Once the database is up and running you will be provided with a window in your browser to view through which you can write SQL. The database should be pre-populated with some data so we will log in and run a few simple queries to get down the basics of what it is and how it works.

### Running the code

In a terminal run `./up.sh` to create the database and open the browser window.

Log into thee PostgreSQL database with the provided username and password, and try to answer a few questions about the data.

1. How many customers do we have?
2. Which product sold the most units?
3. Which month did we sell the most product by dollars in 2021?
4. Which month did we sell the most product by units in 2021?
5. What is our most profitable product?
6. What is our most profitable category?
7. Which category manager bring in the most dollars?
