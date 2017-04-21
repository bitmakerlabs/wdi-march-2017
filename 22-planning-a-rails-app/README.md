# Analyzing and planning a new Rails app

Today we will be looking at how to go about planning and thinking through a Rails application. We will be talking about some of the things that need to be done before you start coding.

## Agenda
After this lesson, you will know:

  * User Stories
  * Planning
  * Mockups
  * Modelling


## User Stories

As a ...
I want ...
So that...

- Who are the users?
- What do they need to do?
- Why do they need it? What is the goal they're trying to accomplish?







### EXAMPLES
- As a user, I want to be able to filter by cuisine, location, price, etc.
- As a user, I want links to the restaurant home page and menu
- As a user, I want to be able to read reviews of each restaurant
- As an owner, I want to be able to read reviews about my restaurant
- As a user, I want to modify my reservation
- As a user, I want to be able to rate a restaurant
- As a user, I want to be able to bookmark favourite restaurants
- As a user, I want to be able to recommend restaurants to other users
- As a user, I want to be able to notify my party about the reservation
- As an owner, I want to be able to reply to reviews about my restaurant
- As a user, I want to be able to add photos of my food
- As an owner, I want to be able to promote specials
- As a user, I want to know how far in advance I should book a particular restaurant
- As an owner, I want to be able to promote my restaurant
- As an owner, I want to be notified when people make a reservation








## Prioritize
1. NEED TO HAVE
- As a user, I want to be able to see a list of restaurants
- As a user, I want to be able to make a reservation at a restaurant
- As a user, I want to be able to specify the number of guests
- As a user, I want to be able to select a time for my reservation
- As an owner, I want to be able to see the list of reservations
- As an owner, I want to be able to add my restaurant
- As a user, I want to be able to see the info (hours, location, etc.) of a restaurant

2. NICE TO HAVE
- As a user, I want to be able to login / logout

3. HAPPY TO HAVE









## Define our key words
Reservation
- Time
- Date
- Party Size
- Restaurant
- User

User
- Diner
- Owner




## Tough decisions about making a reservation
- "out-of-band" reservations (email, phone calls, walk-ins)
- sharing the reservation information with party
- table layouts
- no-shows
- overlapping reservations






## Planning
- Make assumptions
  - reservations last 1 hour!
  - seats, not tables
  - everyone books online AND shows up
  - reservations start on the hour

- Simplify!
  - Users vs Owners and Diners

- Make mockups












## Modelling
- Pen and paper / Whiteboard
- Create models
- Draw relationships
