# rails-introduction

Rails is a web application development framework written in the Ruby programming language. 
It is designed to make programming web applications.
It allows you to write less code while accomplishing more than many other languages and frameworks.

Rails has two major guiding principles:
* Don't Repeat Yourself
* Convention Over Configuration

### Creating new rails project

###### Installing rails
```
gem install rails
```
###### Checking version of rails
```
rails --version
```
###### Creating new project
```
rails new rails-practice
```

###### Starting up a server
```
rails server
```

### Model, Routes, Controller, View

###### Model:
A model is a Ruby class that is used to represent data. 
Model is created using:
```
rails generate model Article title:string body:text
```
###### Routes:
The Rails router recognizes URLs and dispatches them to a controller's action.
Routes are added in config/routes.rb file.
###### Controller:
Controllers are Ruby classes, and their public methods are actions.
Controllers are created using:
```
rails generate controller [controller-name] index
```
###### Views:
views are templates, usually written in a mixture of HTML and Ruby.