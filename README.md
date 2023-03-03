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

* ![Screenshot from 2023-03-02 15-11-41](https://user-images.githubusercontent.com/125340521/222445455-7bef4ced-cf5a-4c2e-9b11-0f1d1cfa52cb.png)

Instantion using new method

* ![Screenshot from 2023-03-02 15-12-19](https://user-images.githubusercontent.com/125340521/222445496-bb96b419-2187-4d96-b6e1-8653430800a2.png)

###### Creating Record in table

Record can be created using many methods some of them are

* New with adding values seperately
* ![Screenshot from 2023-03-02 15-13-41](https://user-images.githubusercontent.com/125340521/222445526-4afe397f-abde-4692-8057-2b63e8d88edf.png)

After using new object is instantiated but not saved in the table.
It is done using .save method

* ![Screenshot from 2023-03-02 15-14-16](https://user-images.githubusercontent.com/125340521/222445598-8feb8cff-39ab-4ac1-ad18-8541a3d910f5.png)

* Adding values in a single line
* ![Screenshot from 2023-03-02 15-16-06](https://user-images.githubusercontent.com/125340521/222445621-a34399b5-0fbd-411b-af98-e4da1f66ea0d.png)
* ![Screenshot from 2023-03-02 15-16-23](https://user-images.githubusercontent.com/125340521/222445665-8aaba3ae-53b4-4cc5-a013-7a4a03e2bb34.png)

* Values can be instantiated and saved using a single method which is .create method
* ![Screenshot from 2023-03-02 15-17-59](https://user-images.githubusercontent.com/125340521/222445716-43495236-8684-48d0-9e72-e81127f9549c.png)

* Values can be added using loop.
* ![Screenshot from 2023-03-02 15-19-59](https://user-images.githubusercontent.com/125340521/222445743-218da2b5-5bad-4270-8936-200c405a2247.png)

###### Reading the values

* All the records can be displayed using .all method
* ![Screenshot from 2023-03-02 15-21-13](https://user-images.githubusercontent.com/125340521/222445786-753fdf01-118b-4be3-b34e-d5da281378da.png)

* Reading the last value can be done using .last method
* ![Screenshot from 2023-03-02 15-25-21](https://user-images.githubusercontent.com/125340521/222445806-ab43a5bd-6251-43dc-9c1f-64ead22e719c.png)

* Reading the first value can be done using .first method
* ![Screenshot from 2023-03-02 15-25-58](https://user-images.githubusercontent.com/125340521/222445825-c2563eb8-ac8e-4afc-a7e5-fe6d24be5be9.png)

* Record can be found using .find which will take id to find the record
* ![Screenshot from 2023-03-02 15-26-18](https://user-images.githubusercontent.com/125340521/222445860-4142fa26-7545-4c90-85af-f4e67a17b94e.png)

* Record can be found if you want value of some specific column
* ![Screenshot from 2023-03-02 15-27-42](https://user-images.githubusercontent.com/125340521/222445915-263c1503-fe90-4dcc-ae8b-f4afc7b4fdc9.png)

* Record can be found using .where method which is similar to Where query of DQl
* ![Screenshot from 2023-03-02 15-36-01](https://user-images.githubusercontent.com/125340521/222445956-212d7a10-51dc-4420-ae1d-7fb1cc8eff82.png)

###### Updating the record

* Record can be updated using .update method where you specify the new values for the record
* ![Screenshot from 2023-03-02 15-38-59](https://user-images.githubusercontent.com/125340521/222445992-afd3bcdc-6b66-4554-8f2d-6ef4116d4cc0.png)

* Record can be stored in some variable and than update.
* ![Screenshot from 2023-03-02 15-42-10](https://user-images.githubusercontent.com/125340521/222446187-79236587-d6a3-4e45-8fab-56a3ceea69bc.png)

* All the values of a column can be upated by using .update_all method
* ![Screenshot from 2023-03-02 16-06-57](https://user-images.githubusercontent.com/125340521/222446229-ca6c2406-63a3-47fb-93b8-13096f3e10c8.png)
 
* ALl the values can also be updated from .update method using :all
* 

###### Deletion of record

* Record can be deleted using .destroy method
* ![Screenshot from 2023-03-02 17-42-00](https://user-images.githubusercontent.com/125340521/222446778-92d18964-aee7-4db0-9505-585d6916cdbd.png)
* Record can be deleted using .delete method where you specify the id of the record.
* ![Screenshot from 2023-03-02 19-02-36](https://user-images.githubusercontent.com/125340521/222446822-bbc3babb-2ddc-4152-990b-ac73bacce9c9.png)
* All the record from the table can be deleted using .delete_all method

* Deleting specific record can be done using .destroy_by method
* ![Screenshot from 2023-03-02 17-43-12](https://user-images.githubusercontent.com/125340521/222446864-f3f589f2-e49a-4f95-bd6c-b4a80a1c5b3c.png)

###### Validation

* Validation is done using validates and the column name, and the validation you want to do.
* Custom validation can also be added using validate and method name
* ![Screenshot from 2023-03-02 18-56-56](https://user-images.githubusercontent.com/125340521/222446946-5c142160-5a13-4f65-ace3-0f2ec2eebaa4.png)
* ![Screenshot from 2023-03-02 18-59-11](https://user-images.githubusercontent.com/125340521/222446986-c02f43f1-842a-4083-aed5-90171cd6d80f.png)
* ![Screenshot from 2023-03-02 17-25-47](https://user-images.githubusercontent.com/125340521/222447032-1f2365d1-bef3-4074-8d54-498779f308c6.png)
* ![Screenshot from 2023-03-02 17-26-09](https://user-images.githubusercontent.com/125340521/222447064-3095a4db-fb18-4235-ac90-6138e2a6dc5a.png)
* ![Screenshot from 2023-03-02 17-26-40](https://user-images.githubusercontent.com/125340521/222447113-66ce2f6b-bb4f-44f1-a3a3-015c65d94282.png)

###### Callbacks

Callbacks are used to run some specific method when some event occurs
* ![Screenshot from 2023-03-02 19-04-54](https://user-images.githubusercontent.com/125340521/222447205-d7191b4f-7047-456e-937e-148a5291d468.png)
* ![Screenshot from 2023-03-02 17-34-26](https://user-images.githubusercontent.com/125340521/222447150-3cbf603e-6da0-4d90-9f7e-3463fd5f3aed.png)

###### View of index.html file
* ![Screenshot from 2023-03-02 19-07-51](https://user-images.githubusercontent.com/125340521/222447293-3d837dcf-2621-4048-b810-c3b5c59b2a61.png)

###### View of show.html file
* ![Screenshot from 2023-03-02 19-08-50](https://user-images.githubusercontent.com/125340521/222447348-db3f8d00-22e1-40ff-8897-af004c629a40.png)
