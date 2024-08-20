// Import the necessary modules
const express = require('express');
const os = require('os'); // Import the os module
const app = express();
const port = process.env.PORT || 3000;

// Middleware to parse JSON bodies
app.use(express.json());

// Route that handles GET requests
app.get('/', (req, res) => {
    const webAppString = process.env.WEBAPP_STRING;
    const serverHostname = os.hostname(); // Get the hostname of the server
    
    // Construct the HTML response
    const htmlResponse = `
        <html>
            <head>
                <title>Environment Variable and Server Hostname</title>
            </head>
            <body>
                <p>WEBAPP_STRING Environment Variable: ${webAppString}</p>
                <p>Server Hostname: ${serverHostname}</p>
            </body>
        </html>
    `;
    
    res.send(htmlResponse);
});

// Start the server
app.listen(port, () => {
    console.log(`Server running on port ${port}`);
});
