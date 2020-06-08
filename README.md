# Simple LinkedIn-style social network database
Project made for Data Bases I class at my Computer Science major

## Overview
I focused on basic functionality. Database allow to add **users**, **connections** between them, as well as **companies**.
Companies have **managers** (users) who are responsible for managing the page.
Both users and companies can add **posts**, but only users can **comment** or **like** them (and **like comments** also).
Post can be assigned to multiple **tags**, and every user can follow any number of tags. 
The user's profile can be **viewed** by another user, which is stored in database (like in real LinkedIn).

The user's profile contains also his personal **work experience**, where is stored his proffesional history (where he/she worked, when, on which position), e-mail address and website.

The company's profile contains information about it's **management**, city of residence and industry.

## ER Diagram

## Relational Diagram

## Triggers
There are 3 triggers:
* Correcting data after deleting user - changing authorship of posts and comments to specially created ghost user (I don't know if LinkedIn uses this mechanisms, but I copied that from Facebook) or deleting some data that don't make sense without user.
* The other 2 triggers delete the likes of post on comments after making changes to it's text (also here I don't know if it's the case in LinkedIn, but I personaly feel it makes sense - users don't know if they still agree with changed content of comment or post)

## Functions
There are 2 functions:
* max_likes function returns maximum number of likes that got given user (in post or comment)
* working_time function prints list of every user's working time (in any job registered on the site) and returns joint working time of all users

## Procedures
There are 2 procedures, and both serve printing the profile of user or company.

## Limitations
* With large number of users the working_time function doesn't make sense (return value will be just huge, as well as users list)
* There is no functionality of looking for a job, which is a big part of LinkedIn.
* There is no functionality of observing the company by user.
* There is no functionality of commenting or liking posts by the company.
* Maybe even connecting the normal account and company account will make some sense, but there are a lot of restrictions to be implemented in this case (for example to prevent user to work in other user). 
* The users can register working only in companies also registers on the site, which (maybe?) can make sense on real LinkedIn (but it's not the case there regardlessly), but not on small network.
* There is no mechanism dealing with administrating the company's page after deleting the manager's account (but this is a problem also on other big social networks as Facebook for example - you have to contact with support to repair that manually).

## Potential
I think this database can be implemented into basic web application. Possible next steps to finish this project will be:
* dealing with multimedia data as profile photos, photos and videos on posts
* following the herd, adding more type of reactions (what can be made easily)
* adding more triggers, e.g. for companies, which posts will disappear after page deletion (but that kind of make sense)
* better managing indexes to provide faster service

## Conclusions
Designing databases is fun, but also pain.






