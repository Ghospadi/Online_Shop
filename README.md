# Web Site Setup
This is a simple guide on how to prepare the web site.

# Prerequisites
Before getting started, you will need to have the following software installed on your system:
Node.js
MySQL

# Installation
To prepare the web site, follow these steps:

- Download the repository by cloning it from the GitHub repository.

- Navigate to the backend folder in the terminal and "run yarn" or "npm install" to install all the required dependencies.

- Create database with output_file that located at DB folder.

- Create a new .env file in the root directory of the backend folder and add the following two fields:
    > DATABASE_URL = "your MySQL connection string".
    > JWT_SECRET = "your JWT secret key".

- Start the server by running the command "yarn start" or "npm run start" in the terminal.

- Navigate to the frontend folder in the terminal and run yarn or npm install to install all the required dependencies.

- Create a new .env file in the root directory of the frontend folder and add the following field:
    > VITE_MYIP = "http:// your IP address"
  
- Start the application by running the command "yarn dev" or "npm run dev" in the terminal.

# And that's it! You should now have the web site up and running.
