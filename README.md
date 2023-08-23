# GOTHAM - TIME MANAGER 

## Goal of the project : 

The goal of the project is to create a web application that allows users to manage their time.

## Tech Stack : 

> VueJS

> Elixir

> TailwindCSS

> Cordova
 
## Getting Started :

> Development server
```
git clone git@github.com:EpitechMscProPromo2024/T-POO-700-PAR_6.git
cd T-POO-700-PAR_6/
make front
make back
```

> Deployed server
https://time-manager-205db.web.app/


## Technical Documentation: 

> The api call to /users/login with email and password of the user returns a JWT token from joken with the user info attached to it.
<img width="1015" alt="Screenshot 2022-11-13 at 10 46 41 PM" src="https://user-images.githubusercontent.com/90610832/201534854-b5a0326e-f08d-49e4-a6ac-3056fa71f213.png">


> The api call to /users/signup with userinfo creates the user.
<img width="327" alt="Screenshot 2022-11-13 at 10 49 41 PM" src="https://user-images.githubusercontent.com/90610832/201534993-808ce75f-0b38-4c33-a543-df95097eb7b2.png">


> When creating a user if a username or email already exists, it will return an error.
<img width="250" alt="Screenshot 2022-11-13 at 10 51 27 PM" src="https://user-images.githubusercontent.com/90610832/201535063-e4a12698-ee78-4113-95de-963b2378b880.png">


> Passwords are hashed with bcrypt and are not displayed in the database since its virtual.
<img width="1015" alt="Screenshot 2022-11-13 at 11 23 24 PM" src="https://user-images.githubusercontent.com/90610832/201536635-5a531106-39d0-492a-be99-a96f11e872bc.png">

> All the routes available.
<img width="477" alt="Screenshot 2022-11-13 at 11 29 14 PM" src="https://user-images.githubusercontent.com/90610832/201536920-39bdb84b-2174-4a73-9967-8312a1be032c.png">

> Middleware active, requests cannot be made without the JWT token.
<img width="261" alt="Screenshot 2022-11-13 at 11 32 21 PM" src="https://user-images.githubusercontent.com/90610832/201537049-9b26602c-2897-47b6-82a2-db06c71478b3.png">
<img width="233" alt="Screenshot 2022-11-13 at 11 32 44 PM" src="https://user-images.githubusercontent.com/90610832/201537064-fd785c29-0343-456b-a8bb-6d413b7cb89a.png">

> Middleware also differentiaties requests from a user of an employee role and from a higher role, say admin.
<img width="453" alt="Screenshot 2022-11-13 at 11 35 09 PM" src="https://user-images.githubusercontent.com/90610832/201537153-d8576a76-ae8f-4b38-bacd-e46421a9ad6f.png">


## User Documentation: 

> The whole web app has high contrast colors (Solved issue for employees with visual challenges).

> User can sign in from the signin page. 
<img width="528" alt="Screenshot 2022-11-13 at 11 36 23 PM" src="https://user-images.githubusercontent.com/90610832/201537224-3e56030c-441d-4767-b962-1d1cbdcc9cfc.png">

> User can clock in and see their current working time from the navbar, available everywhere on the app.
<img width="1512" alt="Screenshot 2022-11-13 at 11 37 04 PM" src="https://user-images.githubusercontent.com/90610832/201537258-ea6ebd6d-729c-4b39-bc67-0397fca5b76b.png">

> User can navigate through the app and see their profile info from the sidebar.
<img width="256" alt="Screenshot 2022-11-13 at 11 38 23 PM" src="https://user-images.githubusercontent.com/90610832/201537317-65c2a6aa-15f6-4de7-83f0-4995ee2ae6d4.png">

> User dashboard is available.
<img width="1261" alt="Screenshot 2022-11-13 at 11 39 08 PM" src="https://user-images.githubusercontent.com/90610832/201537335-d71721dd-f580-463a-8414-1832ad335189.png">

> Admin can create, edit, add, delete, update, promote, clock a user and add a add working time for a user (Solves issue for the employees with visual challenges as admin or general-manager can clock them in or update their info) (Solves issue for the employees concerned about the managers abusing their power in the form of corruption).
<img width="1258" alt="Screenshot 2022-11-13 at 11 39 50 PM" src="https://user-images.githubusercontent.com/90610832/201537377-b1ec57ee-2686-4d94-9c7d-0fbccc02f9e4.png">

> Teams are avaibable (Whole team can be clocked in, solves issue of the manager asking to clock his whole team at once as they start and end at the same time).
<img width="1259" alt="Screenshot 2022-11-13 at 11 41 30 PM" src="https://user-images.githubusercontent.com/90610832/201537439-5edffdd6-b596-4e18-bf1e-64f878bbe114.png">

> A mobile app is available for the user (Solved issue of employees not having a laptop to access the web app). 
<img width="353" alt="Screenshot 2022-11-13 at 11 49 55 PM" src="https://user-images.githubusercontent.com/90610832/201537731-fd305017-e57a-4e44-b1c9-b7645bb96714.png">

> User can navigate the app by the sidebar.
<img width="352" alt="Screenshot 2022-11-13 at 11 50 36 PM" src="https://user-images.githubusercontent.com/90610832/201537760-1fe23810-f9a3-48c6-bd52-88207a0aa02e.png">

> User can clock themselves in via the mobile app.
<img width="353" alt="Screenshot 2022-11-13 at 11 51 48 PM" src="https://user-images.githubusercontent.com/90610832/201537800-383dbbb0-b4ef-43ed-8af0-3f5e85a06973.png">

> User can edit their profile info via the mobile app.
<img width="355" alt="Screenshot 2022-11-13 at 11 52 18 PM" src="https://user-images.githubusercontent.com/90610832/201537828-2fa3df12-1e64-4838-95ac-354cc2bb9017.png">

