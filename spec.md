# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
        Sinatra was used in the production of this app
- [x] Use ActiveRecord for storing information in a database
        All models and controllers inherit from / use ActiveRecord
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
        App uses three model classes: User, Garage, and Car
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)
        The User class has_many Garages and has_many Cars through Garages. Garages has_many Cars
- [x] Include user accounts
        App allows user acccounts to be created and persisted, and contains signup and login features/routes
- [x] Ensure that users can't modify content created by other users
        Users are unable to modify content created by other users. HTML elements for modifying content are only shown on pages that contain the current user's content
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
        Both Garages (which belong_to User) and Cars (which belong_to Garages) have CRUD routes
- [x] Include user input validations
        User input validations for this program include: 
            - Accounts cannot be created with a blank username and/or password
            - Garages and Cars cannot be created with missing information (see class file for details)
            - Cars cannot be added to or moved to Garages that are already at full capacity
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new)
        Validation failgures are communicated to the user through Flash messages (red font)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
