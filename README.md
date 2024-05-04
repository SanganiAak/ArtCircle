# TalentPalette

TalentPalette is a platform designed to bridge the gap between professional networking and social interaction, tailored for creative professionals. It blends the formal aspects of LinkedIn with the engaging social experience of Instagram.

## Table of Contents

- [Overview](#overview)
- [Technology Stack](#technology-stack)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Contributing](#contributing)
- [License](#license)

## Overview

The platform offers a unique mix of features from job listings and gig postings to social media-like user interactions with posts and profiles, all geared towards talent discovery and professional networking in the creative field.

## Technology Stack

- *MongoDB*: A document-based open source database.
- *Express.js*: A web application framework for Node.js.
- *React*: A JavaScript library for building user interfaces.
- *Node.js*: A JavaScript runtime built on Chrome's V8 JavaScript engine.

## Project Structure

The project follows a MVC-like structure divided into client and server sides:

### Client-Side

- src/
  - components/: Contains all React components.
  - pages/: React components that represent pages.
  - App.js: The root React component that contains the main application logic.
  - index.js: The entry point that renders the React application.

### Server-Side

- models/: Schemas for the database models.
- controllers/: Logic for handling requests for each model.
- routes/: Definitions of RESTful endpoints.
- server.js: The main entry point of the server application.

### Key Components

- Admin: For managing users, posts, and job listings.
- Home: Displays user lists, posts, and profiles.
- Jobs: Lists available jobs and gigs.
- UserProfile: Shows specific user profiles with posts and gigs.
- Login/Signup: Handle user authentication and registration.

## Getting Started

To get a local copy up and running, follow these simple steps.

1. Clone the repo
   ```sh
   git clone https://github.com/your_username_/Project-Name.git


Install NPM packages

npm install

Start the server

npm run start


Start the client

cd client


npm start


Run: http://3.134.245.199

# Getting Started with Create React App

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

## Available Scripts

In the project directory, you can run:

### `npm start`

Runs the app in the development mode.\
Open [http://localhost:3000](http://localhost:3000) to view it in your browser.

The page will reload when you make changes.\
You may also see any lint errors in the console.

### `npm test`

Launches the test runner in the interactive watch mode.\
See the section about [running tests](https://facebook.github.io/create-react-app/docs/running-tests) for more information.

### `npm run build`

Builds the app for production to the `build` folder.\
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.\
Your app is ready to be deployed!

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

### `npm run eject`

**Note: this is a one-way operation. Once you `eject`, you can't go back!**

If you aren't satisfied with the build tool and configuration choices, you can `eject` at any time. This command will remove the single build dependency from your project.

Instead, it will copy all the configuration files and the transitive dependencies (webpack, Babel, ESLint, etc) right into your project so you have full control over them. All of the commands except `eject` will still work, but they will point to the copied scripts so you can tweak them. At this point you're on your own.

You don't have to ever use `eject`. The curated feature set is suitable for small and middle deployments, and you shouldn't feel obligated to use this feature. However we understand that this tool wouldn't be useful if you couldn't customize it when you are ready for it.

## Learn More

You can learn more in the [Create React App documentation](https://facebook.github.io/create-react-app/docs/getting-started).

To learn React, check out the [React documentation](https://reactjs.org/).

### Code Splitting

This section has moved here: [https://facebook.github.io/create-react-app/docs/code-splitting](https://facebook.github.io/create-react-app/docs/code-splitting)

### Analyzing the Bundle Size

This section has moved here: [https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size](https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size)

### Making a Progressive Web App

This section has moved here: [https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app](https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app)

### Advanced Configuration

This section has moved here: [https://facebook.github.io/create-react-app/docs/advanced-configuration](https://facebook.github.io/create-react-app/docs/advanced-configuration)

### Deployment

This section has moved here: [https://facebook.github.io/create-react-app/docs/deployment](https://facebook.github.io/create-react-app/docs/deployment)

### `npm run build` fails to minify

This section has moved here: [https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify](https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify)
