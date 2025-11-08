<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/style.css">
    <title>Add a New Bunny</title>
</head>

<body>
    <div class="topnav">
        <a href="/bunnies">Home</a>
        <a href="#">Details</a>
        <a href="/about">About</a>
        <a class="active" href="/bunnies/new">New Animal Form</a>
    </div>

    <div class="pageTitle">
        <h1>Add a New Animal</h1>
    </div>

    <div class="colWrapper">
        <form action="/bunnies/new" method="post" enctype="multipart/form-data">
            <h3 class="addAnimalh3">Name</h3>
            <input class="addAnimalInput" name="name" value="${bunny.name!''}" placeholder="Enter animal name" required>

            <h3 class="addAnimalh3">Breed</h3>
            <input class="addAnimalInput" name="breed" value="${bunny.breed!''}" placeholder="Enter animal breed">

            <h3 class="addAnimalh3">Age</h3>
            <input class="addAnimalInput" type="number" name="age" step="0.1" placeholder="Enter age in years">

            <h3 class="addAnimalh3">Photo</h3>
            <input class="addAnimalInput" type="file" name="photo" accept="image/*">

            <h3 class="addAnimalh3">Description</h3>
            <textarea class="addAnimalInput" name="description" style="height: 100px; background-color: rgb(72, 192, 152);" placeholder="Describe the animal">${bunny.description!''}</textarea>

            <button type="submit" class="blueButton">Add Animal</button>
        </form>
    </div>

</body>

</html>
