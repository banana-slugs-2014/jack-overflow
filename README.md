# Jack Overflow  
####[App Site](http://jackoverflow.herokuapp.com)

The purpose of this project is to create a stackoverflow clone while practicing good web design principles.

### User Stories

As a user I can ask a question.  
As a user I can reply to a question.  
As a user I can comment on questions or replies (posts).  
As a user I can vote on posts.
As a user I can view a graph of the votes of each question.

### Core Learnings

Replies and Questions are similar. Create a post abstract class and use Single Table Inheritance.  
A self join can be leveraged to associate replies to specific questions. All questions will not have a parent foreign id.  
d3.js is a thought-provoking and exciting library for data visualization.

### App Hosting

The app is hosted at jackoverflow.herokuapp.com. It may take a moment to load. Please check it out and submit a pull request to extend the app or patch a feature if you would like to contribute!

### License

[MIT License](http://opensource.org/licenses/MIT)
