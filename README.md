A simple e-commerce website built with React (frontend) and ASP.NET Core Web API (backend) using MySQL.

## Folder Structure
- react-app/ — React frontend
- asp.net-web-api/ — ASP.NET Core Web API backend

## Features
- User registration and login
- Browse products
- Place orders
- View order history

## Technologies Used
- React
- ASP.NET Core Web API
- MySQL

## Getting Started

Requirements:
- Node.js and npm
- .NET 9 SDK
- MySQL Server
- Git

1. Clone the repository:
   - git clone https://github.com/vasili-salikov/Watersports-Shop.git

2. Create and populate the MySQL database using the createDb.sql script from the root folder.
   
3. Install dependencies for React app:
   - cd react-app
   - npm install

4. Configure your MySQL connection string in `asp.net-web-api/appsettings.json`.

5. Build and run the ASP.NET Core Web API:
   - cd ../asp.net-web-api
   - dotnet build
   - dotnet run

6. Start the React app:
   - cd ../react-app
   - npm start
   
   
