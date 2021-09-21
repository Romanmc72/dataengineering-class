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

#### Celebrate

You did a good thing. Take a break, you deserve it. Go tell your mom, she will be so proud. I know I am.

#### Moving On

We have a single API endpoint that works, it returns plain text (not JSON) and responds to a `GET` request (though not `POST` or `DELETE` yet). So  let's add the JSON part.
    
1. JSON data is supported natively in Python and interfaces very naturally with some of the base data types like strings, floats, lists, dicts and more. For now we will just change the return line so that it spits out the following JSON data:

    ```JSON
    {
        "data": ["Hello World!"]
    }
    ```

    - To do that we will add a new line importing the JSON library in python:

    ```Python
    import json
    ```

    - This is part of the standard library so there is no need to `pip install` anything into the `virtualenv`. It is good practice to place standard library imports before the 3rd part library imports that had to be pip installed.
    - Then replace the `return` statement with the following:

    ```Python
    return json.dumps(
        {
            "data": ["Hello World!"]
        }
    )
    ```

    - So what this does is takes the native Python objects (the dict, i.e. a `"key" : "value"` pair inside curly braces `{}` and the list inside the square brackets `[]`) and "dumps" it or "serializes" it as a JSON string so that it can be passed to other programs that read JSON data.

    - Now to make these changes take effect on your API you will need to bring down the API (press ctrl+C) then relaunch it (with `flask run`) and see if it works now!

2. Let's add the `POST` capabilities. As opposed to `GET` which gets the data, `POST` is supposed to be used to accept incoming data and do something with it on the server side (your API at `localhost:5000` is the server here). Flask `routes` / endpoints byt default are `GET` only. To add `POST` capabilities we will need to modify the line that says `@app.route('/')` like so:

```Python
@app.route('/', methods=['GET', 'POST'])
```

- Presently if you bring down and relaunch the API, nothing has actually changed because you have not "handled" the `POST` request scenario yet. To make a `POST` request though, simply do the following in `curl` on the command line:

```bash
curl -X POST localhost:5000
```

3. So let's handle the `POST`! To do that we will import the flask request, then handle each method as we please.
    - Add this line to the list of imports at the top of the file:

    ```Python
    from flask import request
    ```

    - Then inside of the endpoint function we will modify it like so in order to be able to say hi to someone other than "World":

    ```Python
    @app.route('/', methods=['GET', 'POST'])
    def my_endpoint():
        if request.method == 'GET':
            return json.dumps(
                {
                    "data": ["Hello World!"]
                }
            )
        elif request.method == 'POST':
            return json.dumps(
                {
                    "data": [
                        "Hello World!",
                        f"Hello {request.data.decode()}!"
                    ]
                }
            )
    ```
    - So we just threw in a handler for the scenario where somebody does a `POST` to our API and they throw some data at us. In this case we will add whatever data they pass in as another thing in the JSON payload, and essentially say "Hello {data}!" for whatever the data is. Now hit that endpoint with `curl` like so:

    ```bash
    curl \
        -X POST \
        -H 'Content-Type: text/plain' \
        -d 'dumbass' \
        localhost:5000 
    ```

    - This `curl` is a little different than before. So what was added here were the "Header" for the request specifying what the Flask endpoint should expect our data to contain plain text. That is what `-H 'Content-Type: text/plain'` means. Then teh actual data in our plain text is stored in the `-d` argument `-d 'dumbass'`. So if that works you should see the API return something like so:
    
    ```JSON
    {
        "data": [
            "Hello World!",
            "Hello dumbass!"
        ]
    }
    ```

    - "Hello dumbass!"... Has a nice ring to it. Let's clean up the code a little. Typically if you end up repeating yourself in your code it means you should introduce a variable or a function to control that repeated code all in one place. In this case we are rewriting the data our API spits back twice. Ew. Let's try it this way:

    ```Python
    @app.route('/', methods=['GET', 'POST'])
    def my_endpoint():
        default_response = {
            "data": ["Hello World!"]
        }
        if request.method == 'GET':
            return json.dumps(default_response)
        elif request.method == 'POST':
            default_response['data'].append(f"Hello {request.data.decode()}!")
            return json.dumps(default_response)
    ```

    - A little better IMHOP. Now toy around switching between a `GET` and a `POST` request on the `curl` command.

#### Storing the data

Another job well done. A little further to go still. We will be throwing in the `DELETE` request here soon, but if you spent a little time fooling around with your new creation then you might notice that the data you `POST` is not actually being stored for the next `GET` request. So if you posted `-d 'dumbass'` then went and did a `GET` after that, you will notice that `"Hello dumbass!"` is gone. :(

How do we get it to stay? Well, this is where databases typically comes in. However instead of over complicating the setup (because there are a myriad of tutorials out there connecting Flask to whatever database you want) we will cheat and just store the data in memory on the flask webserver.

**Please note** that you should actually never do this in a real API. Typically these API's are launching many parallel instances and people issuing `GET` and `POST` requests are not guaranteed to hit the same thread twice in a row (meaning users of the API will experience the appearance of data loss or other unexpected behavior). As long as you have been warned, we can move forward ;)

So the workaround hack we will use is storing the data in memory on the flask `current_app` configuration. You can set up a bunch of configuration variables for a flask application that can be set as the app starts. Usually you do not change these as the app is running but that is what we will do here. So let's try it out.

1. We need to import another thing, so add this to the list of imports so we can track the context of the current app as it is running:

```Python
from flask import current_app
```

2. Then we need to set the default value for this data. Find the line where we initialized the `app` but before we added the endpoint, and right after it add the following:

```Python
default_response = {
    "data": ["Hello World!"]
}
app.config['state'] = default_response
```

3. Then inside of our endpoint function we will remove the declaration of `default_response` then replace all other occurrences of `default_response` with `current_app.config['state']`. So we should go from this:

```Python
@app.route('/', methods=['GET', 'POST'])
def my_endpoint():
    default_response = {
        "data": ["Hello World!"]
    }
    if request.method == 'GET':
        return json.dumps(default_response)
    elif request.method == 'POST':
        default_response['data'].append(f"Hello {request.data.decode()}!")
        return json.dumps(default_response)
```

To this:

```Python
@app.route('/', methods=['GET', 'POST'])
def my_endpoint():
    if request.method == 'GET':
        return json.dumps(current_app.config['state'])
    elif request.method == 'POST':
        current_app.config['state']['data'].append(
            f"Hello {request.data.decode()}!"
        )
        return json.dumps(current_app.config['state'])
```

4. Now when you `POST` with some data it should store that data and return it next time along with any other additional data points that you post each time. Try it out with curl for a little and see what it looks like. Alternate between the `GET` and the `POST` requests.

All in all the whole file should look something like this:

```Python
#!/usr/bin/env python3
"""
This is a simple API.

It will support 1 endpoint for GET POST and DELETE requests.
"""
import json

from flask import Flask
from flask import request
from flask import current_app

app = Flask(__name__)
default_response = {
    "data": ["Hello World!"]
}
app.config['state'] = default_response


@app.route('/', methods=['GET', 'POST'])
def my_endpoint():
    if request.method == 'GET':
        return json.dumps(current_app.config['state'])
    elif request.method == 'POST':
        current_app.config['state']['data'].append(f"Hello {request.data.decode()}!")
        return json.dumps(current_app.config['state'])


if __name__ == "__main__":
    app.run()

```

#### Now the DELETE

Okay so here is where we are now. In some API scenarios the `DELETE` can delete one thing or delete everything on the endpoint. Sometimes there are even different endpoints for different types of deletes. So far you have gone through this tutorial and you have:

1. Built an API from scratch
2. Added an endpoint to that API
3. Started and stopped the API between modifications
4. Handled both `GET` and `POST` requests
5. Stored data from additional requests

Now it is time for you to figure out this next part... On your own...

You can do it.

Don't be soft.

You got this.

Take a break if you get stuck and honestly Google it. One of if not _the_ most valuable skills to possess is the ability to figure it out on your own through troubleshooting, problem solving, and asking the internet for help. Knowing what to Google is sometimes half the battle. Given what you have done so far, I do not think you should need that much extra help from the internets, but try it out!

Really. Try it out. I am done helping you on this one. Just add the ability for this endpoint to handle `DELETE` requests and to essentially reset itself to where it started if somebody sends a `DELETE` request to the endpoint. The `DELETE` command for curl should work with just this:

```bash
curl -X DELETE localhost:5000
```

**GO! YOU GOT THIS!**
