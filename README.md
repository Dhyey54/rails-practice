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

### Active Record Basics

CRUD operations is done using actice record basics.
It is done in rails console.

###### Instantiation the table
It can be done by calling any methods like Product.connection, Product.new, Product.last

Screenshot from 2023-03-02 15-11-41.png

Instantion using new method

Screenshot from 2023-03-02 15-12-19.png

###### Creating Record in table

Record can be created using many methods some of them are

* New with adding values seperately
* Screenshot from 2023-03-02 15-13-41.png

After using new object is instantiated but not saved in the table.
It is done using .save method

* Screenshot from 2023-03-02 15-14-16.png

* Adding values in a single line
* Screenshot from 2023-03-02 15-16-06.png
* Screenshot from 2023-03-02 15-16-23.png

* Values can be instantiated and saved using a single method which is .create method
* Screenshot from 2023-03-02 15-17-59.png

* Values can be added using loop.
* Screenshot from 2023-03-02 15-19-59.png

###### Reading the values

* All the records can be displayed using .all method
* Screenshot from 2023-03-02 15-21-13.png

* Reading the last value can be done using .last method
* Screenshot from 2023-03-02 15-25-21.png

* Reading the first value can be done using .first method
* Screenshot from 2023-03-02 15-25-58.png

* Record can be found using .find which will take id to find the record
* Screenshot from 2023-03-02 15-26-18.png

* Record can be found if you want value of some specific column
* Screenshot from 2023-03-02 15-27-42.png

* Record can be found using .where method which is similar to Where query of DQl
* Screenshot from 2023-03-02 15-36-01.png

###### Updating the record

* Record can be updated using .update method where you specify the new values for the record
* Screenshot from 2023-03-02 15-39-30.png

* Record can be stored in some variable and than update.
* Screenshot from 2023-03-02 15-42-10.png

* All the values of a column can be upated by using .update_all method
* Screenshot from 2023-03-02 16-06-57.png
* Screenshot from 2023-03-02 16-07-20.png

* Screenshot from 2023-03-02 16-08-09.png

* ALl the values can also be updated from .update method using :all
* Screenshot from 2023-03-02 16-08-09.png

###### Deletion of record

* Record can be deleted using .destroy method
* Screenshot from 2023-03-02 17-42-00.png
* Record can be deleted using .delete method where you specify the id of the record.
* Screenshot from 2023-03-02 19-02-36.png
* All the record from the table can be deleted using .delete_all method

* Deleting specific record can be done using .destroy_by method
* Screenshot from 2023-03-02 17-43-12.png

###### Validation

* Validation is done using validates and the column name, and the validation you want to do.
* Custom validation can also be added using validate and method name
* Screenshot from 2023-03-02 18-56-56.png
* Screenshot from 2023-03-02 18-59-11.png
* Screenshot from 2023-03-02 17-25-47.png
* Screenshot from 2023-03-02 17-26-09.png
* Screenshot from 2023-03-02 17-26-40.png

###### Callbacks

Callbacks are used to run some specific method when some event occurs
* Screenshot from 2023-03-02 19-04-54.png
* Screenshot from 2023-03-02 17-34-26.png

###### View of index.html file
Screenshot from 2023-03-02 19-07-51.png

###### View of show.html file
Screenshot from 2023-03-02 19-08-50.png