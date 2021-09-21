# Endpoints

Okay now we can actually talk about creating and running the API itself. An API has "endpoints". Endpoints are essentially just distinct paths you can visit on the API itself. Typically each endpoint is represented much like you would see various pages on a website represented. Wondering what that exactly means...? No problem. So let's break that down a little further.

Have you ever looked at the URL in the top of your browser as you navigate around a website? Most probably have not, but take a look for example at [youtube.com](https://www.youtube.com/watch?v=dQw4w9WgXcQ). Open that link and let's look at the URL.

So there are some interesting things to note. Everything in the URL means something. Here are some of those pieces:

- `https://` indicates the "protocol" you are about to communicate with. HTTPS stands for Hyper Text Transfer Protocol Secure, which is how almost all website traffic communicates nowadays.
- `www.youtube.com` is the domain. A domain is just a human-readable way to represent another computer. Computers are actually located via "IP Addresses" (Internet Protocol Address) and those are displayed in 4 numbers from 0-255 separated by a period `.` (IPv4) or 8 hexadecimal numbers separated by a colon `:` (IPv6). You can find out what IP is behind a domain by using command line tools like `nslookup`. For youtube, `nslookup` says the following:

```bash
$ nslookup youtube.com
Server:		75.75.75.75
Address:	75.75.75.75#53

Non-authoritative answer:
Name:	youtube.com
Address: 142.250.190.78
Name:	youtube.com
Address: 2607:f8b0:4009:806::200e
```

> - Try to go to https://142.250.190.78/ instead of youtube.com directly. Does it work?

- `/watch` is the actual "endpoint" on `www.youtube.com` that we are hitting. In this case it returns HTML content for the web page.
- `?` denotes that we are adding a query to the endpoint we are requesting
- `v=dQw4w9WgXcQ` represents the query parameters we passed in. (Most likely `v` stands for `video` and `dQw4w9WgXcQ` represents the specific video we are asking for). If we had more parameters we would separate them with an ampersand `&`.

And that is one type of request we make to that endpoint at youtube.com. This request method is called a `GET` because we are "GET"ting that web page from the youtube server. This does not make youtube.com and API though... API's are a part of the picture but they really only return data not webpages. Usually that data is either [JSON](https://www.json.org/json-en.html) (JavaScript Object Notation) or [XML](https://en.wikipedia.org/wiki/XML) (eXtensible Markup Language) though sometimes can be other things as well.

A lot of modern web applications have something of a web server that generates the pages, but bundled with the web pages are pieces of code that execute as soon as your browser receives the web page. Those pieces of code are typically written in some flavor of JavaScript and will call out to an API to get the particular data points relevant to populate portions of the web page dynamically. i.e. you get a fill-in-the-blank type template for the website you go to and API calls retrieve the data to fill in those blanks based on who you are logged in as so that your visit to youtube.com is different than someone else's.

Some of the benefits of this pattern are that it allows websites to load more quickly as there is less delay in displaying the web page to you (the data can load a few milliseconds later) _and_ you can interact with the API's directly to get the data whenever you need it, not having to worry about any of the details of where the data is stored, how it is stored, and all of that jazz. Essentially it simplifies the interface for interacting with the data you need no matter who you are.

## Goal of this section

We will create an API! The API we create will have 1 endpoint that supports 3 request methods, `GET` `POST` and `DELETE`. This API endpoint will both accept and return JSON data.

Follow these steps and you can have a fully functioning API in just a few lines of code.

1. Create a file here which will hold the python code for your API. perhaps name it `api.py`. The exact file name is not important, you could honestly name it `snails_are_trash_animals.py` as long as it ends in `.py` you're good.
2. Open it in the code editor and let's get started writing!
    - Like before we will add the shebang to the file on line 1 to indicate to the interpreter that we are working with Python here.

    ```Python
    #!/usr/bin/env python3
    ```

    - Something courteous to do at the top of a Python file after the shebang is to add a docstring essentially letting other folks know what the heck this program exists for. That is accomplished by adding a multi-line comment which starts and ends with triple-double-quotes (3 of these `"`) So:

    ```Python
    #!/usr/bin/env python3
    """
    This is a simple API.

    It will support 1 endpoint for GET POST and DELETE requests.
    """
    ```

3. Now to actually write the program.
    - We will import the flask library so we can use it, then we will initialize the application.

    ```Python
    #!/usr/bin/env python3
    """
    This is a simple API.

    It will support 1 endpoint for GET POST and DELETE requests.
    """
    from flask import Flask

    app = Flask(__name__)
    ```

    - Now let's define our endpoint (called a `route` in Flask) and have it return `"Hello World!"` for now...

    ```Python
    #!/usr/bin/env python3
    """
    This is a simple API.

    It will support 1 endpoint for GET POST and DELETE requests.
    """
    from flask import Flask

    app = Flask(__name__)


    @app.route('/')
    def my_endpoint():
        return "Hello World!"
    ```

    - Then finally to make this program execute when we call it, let's add the 2 lines at the bottom which indicate what this program is to do when executed directly.

    ```Python
    #!/usr/bin/env python3
    """
    This is a simple API.

    It will support 1 endpoint for GET POST and DELETE requests.
    """
    from flask import Flask

    app = Flask(__name__)


    @app.route('/')
    def my_endpoint():
        return "Hello World!"


    if __name__ == "__main__":
        app.run()

    ```

    - And that is literally all you need to do to create a minimal Flask API. Now let's run it to see if it actually works.

4. To run this program, you will need to do 2 things.
    1. Set the environment variable for the location of your flask application. If your terminal session is currently sitting in the same folder as the Python file you created then you will just need to declare it like so (assuming you named it `api.py`, if you named it something else use that name instead)

    ```bash
    export FLASK_APP=./api.py
    ```

    2. Then once you have set the location of you app, run it with this command

    ```bash
    flask run
    ```

    And then you should see an output similar to this if there are no errors in your code.:

    ```bash
    $ flask run
    * Serving Flask app './api.py' (lazy loading)
    * Environment: production
    WARNING: This is a development server. Do not use it in a production deployment.
    Use a production WSGI server instead.
    * Debug mode: off
    * Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)
    ```

5. Now go to your web browser and type in the following to see if it worked. http://localhost:5000/. You should see just the text "Hello World!" or whatever you put in that `return` statement... Once you come back to the terminal where you started the flask app from, you should see a new line appear:

```bash
127.0.0.1 - - [21/Sep/2021 09:26:22] "GET / HTTP/1.1" 200 -
```

This line indicates that the API returned a successful response (which is what 200 means). Flask logs all requests that it receives so you can always go back and see if things worked and if they broke it should tell you where that happened as well. Pretty easy huh? 7 lines of actual code plus a few comments and some whitespace.

6. Another way to interact with your API is to use a command line tool called `curl` which comes installed in mac and linux usually. Not too sure on windows...
Anyway, try this on the terminal and see if it does anything:

```bash
curl localhost:5000
```

It should give you the "Hello World!" text as well and likewise generate another line on the logs where you launched the API from.