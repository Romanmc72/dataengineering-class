#!/usr/bin/env python3
"""
Generates some VALUES arguments for inserting random sales data to the
schema for this database.
"""
from random import choice, random
from datetime import datetime, timedelta

products_list = [
    (1, 500.0,  10),
    (2, 2500.0, 1),
    (3, 25.0,   1),
    (4, 0.50,   3),
    (5, 0.50,   3),
    (6, 40.0,   1),
    (7, 10.0,   2),
    (8, 15.0,   1),
    (9, 95.0,   2),
    (10, 30.0,   1),
    (11, 25.0,   1),
    (12, 25.0,   1),
    (13, 40.0,   1),
    (14, 40.0,   1),
    (15, 40.0,   1)
]
customers_list = [1,2,3,4,5,6,7,8]
states = ["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", 
          "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", 
          "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", 
          "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", 
          "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]
dt = datetime(2021, 1, 1)


def fake_data(days_worth: int = 365) -> str:
    """Generator function to yield random insert strings."""
    for i in range(days_worth):
        p = choice(products_list)
        pid = p[0]
        puc = p[1]
        pmoq = p[2]
        c = choice(customers_list)
        d = dt + timedelta(days=i)
        ds = d.strftime("%Y-%m-%d %H:%M:%S")
        yield f"({pmoq + int(random() * 10)}, {puc * (1 + (random() - 0.5)):.2f}, '{ds}', '{choice(states)}', {pid}, {c}),\n"


if __name__ == "__main__":
    print("Writing Fake Data to a file...")
    with open('values.sql', 'w') as values:
        values.writelines(fake_data())
    print("Done!")
