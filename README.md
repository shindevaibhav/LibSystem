Run rake db:seed
    #To create a default root admin


# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version : 2.3.1
* System dependencies: 
    
* Configuration
    Root Admin Details:
     Userid: root@libsys.com
     Password: root_123
* Database creation
    Heroku command:
    1)heroku rake db:migrate
    
* Database initialization
    Heroku command:
    1)heroku rake db:seed
* How to run the test suite
    
* Deployment instructions

## Application Link:
https://hpv-library-system.herokuapp.com

## Admin Credentials:
Admin Email : root@libsys.com
Admin Password : root_123

## New Admin/Member Signup:

* Password should be minimum 6 characters long
* Only Valid email addresses is allowed
* Passwords are encrypted and stored in database for security reasons

## Assumptions:

* If a Room has outstanding bookings, admin should not delete the room until it is available.
* If a library member has an outstanding room booking admin should not delete that member.
* If a room is deleted by an admin, it won't show up in any member's room list.
* If a booking is deleted by an admin, it won't show up in any member's booking list.
* If a member is deleted by an admin, he/she won't show up in any room's booking history.
* Any user (admin/member) can see the list of all rooms and search them based on Room Number, Size, building.
* Any user (admin/member) can see the list of all bookings(Admin-all/ Member-own) and search them based on Room Number, Size, building, date and slot.
* If an admin wants to assume a role of Library Member, he/she has to sign up as a library member.
* Members can release outstanding room booking from their self booking history page.
* Admins can release a room booking on behalf of a library member when viewing details of the room.
* You will not be able to edit the password of the super admin, but you edit passwords for everyone else
* The controller test file is located at LibSystem\test\controllers\sessions_controller_test.rb
* The models test file is located at LibSystem\test\models\library_member_test.rb
