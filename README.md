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

##### Active Record Migration
Migrations are a convenient way to alter your database schema over time in a consistent way. They use a Ruby DSL so that you don't have to write SQL by hand, allowing your schema and changes to be database independent.

Migration is created using folling command:
```
rails generate migration migration_name
```
this will create migartion file of that name. Which will change method in it. Using which we can alter our table.

If the migration name is of the form "AddColumnToTable" or "RemoveColumnFromTable" and is followed by a list of column names and types then a migration containing the appropriate add_column and remove_column statements will be created. Methods used are:
```
add_column :table_name, :column_name, :datatype
remove_column :table_name, :column_name, :datatype
```

If the migration name is of the form "CreateXXX" then it will create the table with list of column provided.
Example:
```
rails generate migration CreateProducts name:string part_number:string
```
It uses create_join_table method.
Example:
```
create_join_table :products, :categories
```
To customize the name of the table, provide a :table_name option.

Migration generates db/migrate/YYYYMMDDHHMMSS_migration_name file.

Reference can be added using add_reference call. Example:
```
rails generate migration AddUserRefToProducts user:references
```

Two tables can be joined using JoinTable. Example:
```
rails generate migration CreateJoinTableCustomerProduct customer product
```

There is also change_table which is similar to create_table but it's yield block provide more method like:
Example:
```
change_table :products do |t|
  t.remove :description, :name
  t.string :part_number
  t.index :part_number
  t.rename :upccode, :upc_code
end
```

#### Column modifiers

Modifiers available are:
* comment
* collation
* default
* limit
* null
* precision
* scale

#### Foreign Keys

Foreign keys can be added using add_foreign_key method.
Example
```
add_foreign_key :articles, :authors
```
If you want specific column as reference, it can be done using column: option.

#### Reversible

Complex migrations may require processing that Active Record doesn't know how to reverse. You can use reversible to specify what to do when running a migration and what else to do when reverting it.

#### Up/Down Method

You can also use up and down methods instead of the change method. The up method should describe the transformation you'd like to make to your schema, and the down method of your migration should revert the transformations done by the up method.

#### Reverting Previous Migration

You can use Active Record's ability to rollback migrations using the revert method

#### Running migartions

You can run migration for all the file using
```
rails db:migrate
```

You can up some specific version using
```
rails db:migrate:up VERSION=version_d
```

#### Rollback

You can rollback latest migration using following command:
```
rails db:rollback
```

If you want to rollback specific migration. It can be done using:
```
rails db:migrate:down VERSION=version_id
```

#### Database Setup

The ```rails db:setup``` command will create the database, load the schema, and initialize it with the seed data.

#### Databse Reset

The ```rails db:reset``` command will drop the database and set it up again. This is functionally equivalent to bin/rails db:drop db:setup.

#### Seeds

To add initial data after a database is created, Rails has a built-in 'seeds' feature that speeds up the process. Seed data is written in db/seeds.rb  file.

### Validation

Validations are used to ensure that only valid data is saved into your database.Model-level validations are the best way to ensure that only valid data is saved into your database. They are database agnostic, cannot be bypassed by end users, and are convenient to test and maintain. Rails makes them easy to use, provides built-in helpers for common needs, and allows you to create your own validation methods as well.

The following methods trigger validations, and will save the object to the database only if the object is valid:

* create
* create!
* save
* save!
* update
* update!

###### valid? and invalid?
To verify whether or not an object is valid, Rails uses the valid? method. 
invalid? is simply the inverse of valid?. It triggers your validations, returning true if any errors were found in the object, and false otherwise.

#### Validation Helpers

* acceptance:
  
  This method validates that a checkbox on the user interface was checked when a form was submitted. This is typically used when the user needs to agree to your application's terms of service, confirm reading some text, or any similar concept.
  ```
  validates :terms_of_service, acceptance: true
  ```
* validates_associated:
  
  You should use this helper when your model has associations with other models and they also need to be validated.
  ```
  validates_associated :books
  ```
* confirmation:

  You should use this helper when you have two text fields that should receive exactly the same content.
  ```
  :email, confirmation: true
  ```
* exclusion:

  This helper validates that the attributes' values are not included in a given set. This set can be any enumerable object.
  ```
  validates :subdomain, exclusion: { in: %w(www us ca jp), message: "%{value} is reserved." }
  ```
* format:

  This helper validates the attributes' values by testing whether they match a given regular expression, which is specified using the :with option.
  ```
   validates :legacy_code, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  ```
* inclusion:

  This helper validates that the attributes' values are included in a given set. This set can be any enumerable object.
  ```
  validates :size, inclusion: { in: %w(small medium large), message: "%{value} is not a valid size" }
  ```
* length:
  This helper validates the length of the attributes' values. It provides a variety of options:

  * :minimum - The attribute cannot have less than the specified length.
  * :maximum - The attribute cannot have more than the specified length.
  * :in (or :within) - The attribute length must be included in a given interval. The value for this option must be a range.
  * :is - The attribute length must be equal to the given value.
* numericality:

  This helper validates that your attributes have only numeric values. By default, it will match an optional sign followed by an integral or floating point number. To specify that only integral numbers are allowed set :only_integer to true.

  Besides :only_integer, this helper also accepts the following options to add constraints to acceptable values:
  * :greater_than
  * :greater_than_or_equal_to
  * :equal_to
  * :less_than
  * :less_than_or_equal_to
  * :odd
  * :even

* presence:
  This helper validates that the specified attributes are not empty. It uses the blank? method to check if the value is either nil or a blank string.
  ```
  validates :name, :login, :email, presence: true
  ```
* absence:
  This helper validates that the specified attributes are absent. It uses the present? method to check if the value is not either nil or a blank string.
  ```
  validates :name, :login, :email, absence: true
  ```
* uniqueness:
  This helper validates that the attribute's value is unique right before the object gets saved.
  ```
  validates :email, uniqueness: true
  ```
* validates_with:
  This helper passes the record to a separate class for validation
  ```
  class GoodnessValidator < ActiveModel::Validator
    def validate(record)
      if record.first_name == "Evil"
        record.errors[:base] << "This person is evil"
      end
    end
  end
  ```
* validates_each:
  This helper validates attributes against a block. It doesn't have a predefined validation function. You should create one using a block, and every attribute passed to validates_each will be tested against it.
  ```
  class Person < ActiveRecord::Base
    validates_each :name, :surname do |record, attr, value|
      record.errors.add(attr, 'must start with upper case') if value =~ /\A[a-z]/
    end
  end
  ```
#### Common Validation Options

* :allow_nil : The :allow_nil option skips the validation when the value being validated is nil.
* :allow_blank : The :allow_blank option is similar to the :allow_nil option. This option will let validation pass if the attribute's value is blank?, like nil or an empty string
* :message : The :message option lets you specify the message that will be added to the errors collection when validation fails.
* :on : The :on option lets you specify when the validation should happen. The default behavior for all the built-in validation helpers is to be run on save (both when you're creating a new record and when you're updating it). If you want to change it, you can use on: :create to run the validation only when a new record is created or on: :update to run the validation only when a record is updated.

#### Conditional Validation

* :if : You may use the :if option when you want to specify when the validation should happen. 
* :unless : If you want to specify when the validation should not happen, then you may use the :unless option.
* Grouping Conditional validations : Sometimes it is useful to have multiple validations use one condition, it can be easily achieved using with_options.
* Combining Validation Conditions : when multiple conditions define whether or not a validation should happen, an Array can be used.
  ```
  validates :mouse, presence: true, if: ["market.retail?", :desktop?], unless: Proc.new { |c| c.trackpad.present? }
  ```

#### Performing Custom Validations

* Custom Validators : Custom validators are classes that extend ActiveModel::Validator. These classes must implement a validate method which takes a record as an argument and performs the validation on it. The custom validator is called using the validates_with method.

* Custom Methods : You can also create methods that verify the state of your models and add messages to the errors collection when they are invalid. You must then register these methods by using the validate class method, passing in the symbols for the validation methods' names.

### Working with Validation Errors

* errors : Returns an instance of the class ActiveModel::Errors containing all errors. Each key is the attribute name and the value is an array of strings with all   errors.
* errors[] : errors[] is used when you want to check the error messages for a specific attribute. It returns an array of strings with all error messages for the given attribute, each string with one error message. If there are no errors related to the attribute, it returns an empty array.
* errors.add : The add method lets you manually add messages that are related to particular attributes. You can use the errors.full_messages or errors.to_a methods to view the messages in the form they might be displayed to a user.
* errors[:base] : You can add error messages that are related to the object's state as a whole, instead of being related to a specific attribute. You can use this method when you want to say that the object is invalid, no matter the values of its attributes. Since errors[:base] is an array, you can simply add a string to it and it will be used as an error message.
* errors.clear : The clear method is used when you intentionally want to clear all the messages in the errors collection.
* errors.size : The size method returns the total number of error messages for the object.
