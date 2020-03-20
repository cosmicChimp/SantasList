# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database **Used ActiveRecord Migrations to build database tables**
- [x] Include more than one model class (e.g. User, Post, Category) **User Model and Wishlist Model, future letters Model**
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) **User has a has_many Wishlists relationship**
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) **Wishlist has a belongs_to User relationship**
- [x] Include user accounts with unique login attribute (username or email) **I have a login controller that validates uniqueness in the User Model**
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying **The belongs_to resource Wishlists has all necessary routes. See Wishlist controller.** 
- [x] Ensure that users can't modify content created by other users **I have session verifaction in all user_id routes**
- [x] Include user input validations **I have content validation for both User and Wishlist Models.**
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message
