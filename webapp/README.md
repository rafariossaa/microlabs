# Webapp

## Description

This is a sample web applicacion made in JS that returns the name of the node and a string set in the environment variable  `WEBAPP_STRING`.

The purpose is to be used as test application for building and deployment.

## Enviroment variables

| Name                       | Description                       | Default Value       |
|----------------------------|-----------------------------------|---------------------|
| `WEBAPP_STRING`            | String to be returned             | `Hello world !`     |

## Building the APP

```bash
mkdir app
docker run -it --rm --name node -v $PWD/app:/app -u $(id -u):$(id -g) -p 3000:3000 bitnami/node:22 bash

npm init
npm install express --cache /app/.npm
```

Then add the `app.js` file

### Testing

Start the application by using: `node app.js`, and then get the page at `http://localhost:3000` :

```bash
have no name!@29bb37cf3051:/app$ node app.js
Server running on port 3000
```

```bash
$ curl http://localhost:3000/

        <html>
            <head>
                <title>Environment Variable and Server Hostname</title>
            </head>
            <body>
                <p>WEBAPP_STRING Environment Variable: undefined</p>
                <p>Server Hostname: 29bb37cf3051</p>
            </body>
        </html>
```

As the environment variable was not set, the vaule `undefined` is being returned. 
If a value is set, it should be returned

```bash
I have no name!@29bb37cf3051:/app$ export WEBAPP_STRING="Hello world !!"
I have no name!@29bb37cf3051:/app$ node app.js 
Server running on port 3000
```

```bash
$ curl http://localhost:3000/

        <html>
            <head>
                <title>Environment Variable and Server Hostname</title>
            </head>
            <body>
                <p>WEBAPP_STRING Environment Variable: Hello world !!</p>
                <p>Server Hostname: 29bb37cf3051</p>
            </body>
        </html>
```

