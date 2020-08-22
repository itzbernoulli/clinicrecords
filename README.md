# HOTR CLINIC APP

This Electronic Medical Records(EMR) application maps out how the process of patience response flows in the clinic and the software fits into that pattern.

[Link](http://hotrclinic.herokuapp.com/)

There are 5 sections starting from the front desk

Username: frontdesk@demo.com
Password: frontdesk@demo.com

Data entry starts here and front desk personnels and admins are the only ones able to add patient records.

After creating a record, nurses can then see these records and add their own data to it.

Username: nurse@demo.com
Password: nurse@demo.com

After nurses update, It becomes available to doctors

Username: doctor@demo.com
Password: doctor@demo.com

Then pharmacist

Username: pharmacist@demo.com
Password: pharmacist@demo.com

The Admin has access to all the data and can create credentials for all other members of the department and put them in their representative units within the department.

Username: admin@demo.com
Password: admin@demo.com


## To run this locally on your machine
 
 - clone the repo

 - cd into the folder and run `bundle install`

 - run `rails db:create db:migrate db:seed`

 - During the seeding process, the WHO OCD-10 data is loaded into the database so as to allow the correct classification of diseases

 -