# sici4030-final

Final project for SICI 4030 Term C21 (Databases Course) at the University of Puerto Rico - Bayamon Campus. For this project we were asked to develop a relational database for a client given a <a href="./problem_description.pdf" target="_blank">problem description</a>. In this case, our client was a veterinary clinic looking to expand to additional locations. Given the need for a system to track all of the patient files and employee records, we were tasked to design and implement a relational database for them.

## Database Requirements
These are the attributes that we need to collect from the different entities that will be included in the database. To see how these entities relate to each other check out the database <a href="./matrix.xlsx">matrix object</a> or the complete <a href="./erd.png" target="_blank">ERD</a>.
<ul>
  <li>Owner (Dueño) 👩‍🦱</li>
    <ul>
      <li>Identification number</li>
      <li>Full name</li>
      <li>Home address</li>
      <li>Phone number</li>
      <li>Email</li>
    </ul>
  <br>
  
  <li>Pet (Mascota) 🐕</li>
    <ul>
      <li>Identification number</li>
      <li>Name</li>
      <li>Date of Birth</li>
      <li>Breed</li>
    </ul>
    <br>
  
  <li>Animal (Animal) 🐴</li>
    <ul>
      <li>Unique code</li>
      <li>Name</li>
      <li>Description</li>
    </ul>
    <br>
  
  <li>Object (Objeto) 🥎</li>
    <ul>
      <li>Unique code</li>
      <li>Name</li>
      <li>Pet it belongs to</li>
    </ul>
    <br>
  
  <li>Food (Comida) 🥫</li>
    <ul>
      <li>Unique Number</li>
      <li>Name</li>
      <li>Unit of measurement</li>
    </ul>
    <br>
  
  <li>Condition (Condiciones) ⚕</li>
    <ul>
      <li>Code</li>
      <li>Name</li>
      <li>Brief description</li>
    </ul>
    <br>
  
  <li>Reservation (Reservación) 🗄️</li>
    <ul>
      <li>Number</li>
      <li>Start date</li>
      <li>End date</li>
    </ul>
    <br>
  
  <li>Space (Encasillado) 🛌</li>
    <ul>
      <li>Unique ID</li>
      <li>Brief description</li>
    </ul>
    <br>
  
  <li>Clinic (Clínica) 🏥</li>
    <ul>
      <li>ID</li>
      <li>Phone number</li>
      <li>Email</li>
      <li>Address</li>
    </ul>
    <br>
  
  <li>Employee (Empleado) 👨‍⚕️</li>
    <ul>
      <li>Name</li>
      <li>Home address</li>
      <li>Phone number</li>
      <li>Date of Birth</li>
      <li>Email</li>
      <li>Type</li>
    </ul>
<br>
  
  <li>Office (Oficina) 🏢</li>
    <ul>
      <li>ID</li>
      <li>Phone Number</li>
      <li>Email</li>
      <li>Address</li>
    </ul>
    <br>

  <li>Department (Departamento) 🧑‍🤝‍🧑</li>
    <ul>
      <li>Unique Code</li>
      <li>Name</li>
      <li>Brief Description</li>
    </ul>
    <br>
    
  <li>Address (Dirección)</li>
    <ul>
      <li>Artifical ID</li>
      <li>Adress Line 1</li>
      <li>Address Line 2</li>
      <li>Neighbourhood</li>
      <li>City</li>
      <li>State</li>
      <li>Zip Code</li>
    </ul>
    <br>

## Problem Description 

Note: This description is translated from Spanish to English from the <a href="./problem_description.pdf">original</a> problem description.

The database system that was implemented in one of the locations of this veterinary firm was a success and they want to expand it to all their locations throughout the island. They would also like to include new features, like managing employees who work in the different stores and at the headquarters. First, the information of the pet and its owner must be saved. An identification number, full name, residential address, cell phone number and email address are obtained from the owner. The pet has a unique identification number, its name, date of birth and the breed to which it belongs. For the purposes of the system, even if a couple has pets, only one owner can be placed in charge of each pet. If they have more than one, they can be divided or you can be assigned to only one person (which can even be the children, but then they must be registered as owners)
Since the pets we are going to host are different types of animals, we need to be clear about that since the place where they are going to stay depends largely on the type of animal it is (but, cat, parrot, snake, etc.). etc.). Therefore, information about the animal must be stored using some type of code, the name and a description of the nature of the animal (e.g. the snake is long and crawls, eats mice and bugs, so it cannot be placed near the animal). of them, etc.) one animal can describe many pets, but each pet only falls under one type of animal only.
Another important piece of information that you want to store for the purpose of hosting a pet is the objects or belongings that you take with you from those animals (e.g. collar, bed, shampoo, combing brush, hair brush, stuffed animal, etc.). Therefore, you must have a unique identifier for each object, the name of the object and you must know which pet it belongs to. A pet can have many objects and several objects
Common may be that more than one pet has them (e.g. Collar). Food is another entity that we want to have information about since the owners are responsible for providing food to their pets while they are staying. Therefore, each food is assigned a unique number, the name of what it is (canned food, dry food in a xx pound bag, etc.) and the unit of measurement it has (e.g. 15 oz, 50 lbs, etc.). Each meal can be for more than one pet (the owner may have taken two dogs to care for) and each pet can be assigned more than one meal. In addition, you should know about that food. Which was the owner who bought and delivered it. Other information to consider are the conditions that a pet has (allergies, epilepsy, mange, etc.). Therefore, the conditions must be recorded with an artificial PK, the name of the condition and a brief description about that condition. A pet can have more than one condition and each condition can be had by more than one pet. Finally, information about the reservation is saved. You must have a unique number, the initial date and the final date of the reservation and of course you must know which pet has reserved it. Finally, the areas where the pets will stay overnight are separated. We will call these areas boxes and they will have a unique ID and a brief description of what that box has (e.g. bed for dog or cat, branches for the snake to climb, cage for monkey or mouse, etc.) Each reservation must have a separate box (for a given time) and each box can be used for more than one reservation. This information is sufficient to be able to create a database that meets the needs of the veterinary clinic users.
Since the hosting system was so successful in the clinic where it was installed, the company wants to expand that system to the other clinics and include basic information from employees and the central office. The first thing to register is the clinic and you will have its ID, telephone number, email address and physical address. Each clinic sees a number of pets and each pet is (usually) seen at the same clinic. For employees, we want to store their employee number, name, address, cell phone, date of birth and email. An employee may be working in a clinic or may be under a department at headquarters (exclusive relationship). It is very important to indicate that we have 3 types of employees in the company, salaried employees who have a fixed monthly salary, contract employees who need to store their contract number and the amount of that contract and finally those who work by hour who need have your hourly wage and how many hours you work per week.
Before, clinics were not registered since the system was only used in one of them, but now the clinic must be stored with a unique ID, telephone number, email address and address. In the same way, the administrative offices are dispersed in various places on the island (by region). For each office we have its ID, telephone number, email address and address. Each office can have one or more departments and each department belongs to one and only one office. For each department there is a unique code, the name of the department and a brief description of the function performed by said office. Each department (or clinic) can have one or more employees assigned to it and each employee belongs to only one department or clinic (exclusive). Finally, as an advanced standardization measure, the address is shared between offices, employees and clinics. What this address entity must have is an artificial ID, two address lines, urbanization or neighborhood, town, state and zip code.
