# animalsAPI
Simple CRUD API for Bunny Objects with JPA (Hibernate)

### Demo
[Demo](https://1drv.ms/v/c/9f325ed1dd1295b3/EX3wGv6m7uRDpIYsiYZMGtEBQfhZ1r-J7-lu5McKRKMbag)

[Integrated Demo](https://uncg-my.sharepoint.com/:v:/g/personal/e_spiering_uncg_edu/EbzMVRiKP-VHkaWNFDe7LpkBczE4n6npdgPjIkzE9oGKOg?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=egggjJ")

### Version
1.0.0

## Installation
- Get the project
    - clone
        ```
      git clone https://github.com/BvnnyGaming/animalsAPI.git
        ```
    - OR download zip.
- Open the project in VS Code.
- This project is built to run with jdk 17.
- [Dependencies](https://github.com/BvnnyGaming/animalsAPI/blob/c5e86eb94fdb845d064b8e9e1a5dccc363836416/bunnyapi/pom.xml) to JPA and Postgres in addition to the usual Spring Web. JPA handles the persistence, Postgresql is the database to be used.
- [`/src/main/resources/application.properties`][(https://github.com/csc340-uncg/f25-jpa-crud-api/blob/6b2860c4ad01ca46b6b62852ca966bfadc8dfc6a/src/main/resources/application.properties)](https://github.com/BvnnyGaming/animalsAPI/blob/c5e86eb94fdb845d064b8e9e1a5dccc363836416/bunnyapi/src/main/resources/application.properties) This file has the configuration for the PostgreSQL database to use for the API.
  - You MUST have the database up and running before running the project!
    - Login to your neon.tech account.
    - Locate your database project.
    - On the project dashboard, click on "Connect" and select Java.
    - Copy the connection string provided.
    - Paste it as a value for the property `spring.datasource.url`. No quotation marks.
- Build and run the main class. You should see a new table created in the Neon database.
### Bunny Java classes have different purposes: Separation of concerns!

- [Entity](https://github.com/BvnnyGaming/animalsAPI/blob/c5e86eb94fdb845d064b8e9e1a5dccc363836416/bunnyapi/src/main/java/com/example/bunnyapi/model/Bunny.java)
  - The Bunny class is annotated as an `@Entity `. This is used to map class attributes to database tables and SQL types.
  - Any Entity must have at least one attribute that is annotated as an `@Id`. In our case it's conveniently the `bunnyId` attribute which also would serve as a primary key in our database system.
  - An Entity must have a no-argument constructor.
- [Repository](https://github.com/BvnnyGaming/animalsAPI/blob/c5e86eb94fdb845d064b8e9e1a5dccc363836416/bunnyapi/src/main/java/com/example/bunnyapi/repository/BunnyRepository.java)
  - We are using an extension of the JPA Repository that comes with prebuilt database operations such as select all, select by id, select by any other reference, insert, delete, etc.
  - Annotate it as a `@Repository`.
  - We parametrize this using our object and its ID type.
- [Service](https://github.com/csc340-uncg/f25-jpa-crud-api/blob/6b2860c4ad01ca46b6b62852ca966bfadc8dfc6a/src/main/java/com/csc340/crud_jpa_demo/student/StudentService.java)
  - Annotated as a `@Service`.
  - It is the go-between from controller to database. In here we define what functions we need from the repository. A lot of the functions are default functions that our repository inherits from JPA (save, delete, findAll, findByX), some of them are custom made (findByBreed, findByNameContaining).
  - It asks the repository to perform SQL queries.
  - The Repository class is [`@Autowired`](https://github.com/BvnnyGaming/animalsAPI/blob/c5e86eb94fdb845d064b8e9e1a5dccc363836416/bunnyapi/src/main/java/com/example/bunnyapi/service/BunnyService.java)  This is for managing the dependency to the repository. Do not use a constructor to make a Repository object, you will get errors.
- [Rest Controller](https://github.com/BvnnyGaming/animalsAPI/blob/c5e86eb94fdb845d064b8e9e1a5dccc363836416/bunnyapi/src/main/java/com/example/bunnyapi/Controller/BunnyController.java#L10)
  - Annotated as a `@RestController`.
  - It asks the Service class to perform data access functions.
  - The Service class is [`@Autowired`](https://github.com/BvnnyGaming/animalsAPI/blob/c5e86eb94fdb845d064b8e9e1a5dccc363836416/bunnyapi/src/main/java/com/example/bunnyapi/service/BunnyService.java) here as well :)

## API Endpoints
Base URL: [`http://localhost:8080/bunnies`](http://localhost:8080/bunnies)


1. ### [`/`](http://localhost:8080/bunnies) (GET)
Gets a list of all bunnies in the database.

#### Response - A JSON array of Bunny objects.

 ```
[
  {
    "bunnyId": 11,
    "name": "Snowball",
    "description": "White rabbit with soft fur.",
    "breed": "Angora",
    "age": 5.0,
    "favoriteFood": "Corn",
    "arrivalDate": "2024-10-10"
  },
  {
    "bunnyId": 12,
    "name": "Flopsy",
    "description": "A very friendly bunny",
    "breed": "Lop",
    "age": 2.0,
    "favoriteFood": "Carrots",
    "arrivalDate": "2025-10-10"
  }
]
```

2. ### [`/{bunnyId}`](http://localhost:8080/bunnies/1) (GET)
Gets an individual bunny in the system. Each Bunny is identified by a numeric `bunnyId`

#### Parameters
- Path Variable: `bunnyId` &lt;Long &gt; - REQUIRED

#### Response - A single Bunny

```
  {
    "bunnyId": 1,
    "name": "Flopsy",
    "description": "A very friendly bunny",
    "breed": "Lop",
    "age": 2.0,
    "favoriteFood": "Carrots",
    "arrivalDate": "2025-10-10"
  }
```

3. ### [`/search`](http://localhost:8080/bunnies/search?name=Thum) (GET)
Gets a list of bunnies with a name that contains the given string.

#### Parameters
- query parameter: `search` &lt; String &gt; - REQUIRED

#### Response - A JSON array of Bunny objects.

```
[
  {
    "bunnyId": 9,
    "name": "Thumper",
    "description": "Gray rabbit who loves carrots.",
    "breed": "Dutch",
    "age": 0.0,
    "favoriteFood": "Blue Berries",
    "arrivalDate": "2023-07-01"
  }
]
```

4. ### [`/category/{breed}`](http://localhost:8080/bunnies/category/lop) (GET)
Gets a list of bunnies for a named breed.

#### Parameters
- path variable: `breed` &lt; String &gt; - REQUIRED

#### Response - A JSON array of bunny objects.

```
[
  {
    "bunnyId": 12,
    "name": "Flopsy",
    "description": "A very friendly bunny",
    "breed": "Lop",
    "age": 2.0,
    "favoriteFood": "Carrots",
    "arrivalDate": "2025-10-10"
  }
]
```
6. ### [`/`](http://localhost:8080/bunnies) (POST)
Create  a new Student entry

#### Request Body
A bunny object. Note the object does not include an ID as this is autogenerated.
```
{
  "name": "Thumper",
  "description": "Gray rabbit who loves carrots.",
  "breed": "Dutch",
  "weight": 2.4,
  "age": 3,
  "birthDate": "2022-05-10",
  "favoriteFood": "Blue Berries",
  "arrivalDate": "2023-07-02"
}
```
#### Response - The newly created bunny.

```
{
  "bunnyId": 12,
  "name": "Thumper",
  "description": "Gray rabbit who loves carrots.",
  "breed": "Dutch",
  "age": 3.0,
  "favoriteFood": "Blue Berries",
  "arrivalDate": "2023-07-02"
}
```

7. ### [`/{bunnyId}`](http://localhost:8080/bunnies/12) (PUT)
Update an existing bunny.

#### Parameters
- Path Variable: `bunnyId` &lt;long&gt; - REQUIRED

#### Request Body
A bunny object with the updates.
```
{
  "name": "Flopsy",
  "description": "A very friendly bunny",
  "breed": "Lop",
  "weight": 3.1,
  "age": 2,
  "birthDate": "2023-5-23",
  "favoriteFood": "Carrots",
  "arrivalDate": "2025-10-10"
}
```
#### Response - the updated bunny object.
```
{
  "bunnyId": 12,
  "name": "Flopsy",
  "description": "A very friendly bunny",
  "breed": "Lop",
  "age": 2.0,
  "favoriteFood": "Carrots",
  "arrivalDate": "2025-10-10"
}
```

8. ### [`/{bunnyId}`](http://localhost:8080/bunnies/8) (DELETE)
Delete an existing bunny.

#### Parameters
- Path Variable: `bunnyId` &lt;long&gt; - REQUIRED

#### Response - the updated list of bunnies.
```
[
  {
    "bunnyId": 9,
    "name": "Thumper",
    "description": "Gray rabbit who loves carrots.",
    "breed": "Dutch",
    "age": 0.0,
    "favoriteFood": "Blue Berries",
    "arrivalDate": "2023-07-01"
  },
  {
    "bunnyId": 10,
    "name": "Snowball",
    "description": "White rabbit with soft fur.",
    "breed": "Angora",
    "age": 0.0,
    "favoriteFood": "Corn",
    "arrivalDate": "2024-10-09"
  },
]
```
