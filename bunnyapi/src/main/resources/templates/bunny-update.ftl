<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/style.css">
    <title>Edit Bunny</title>
</head>

<body>
    <div class="topnav">
        <a href="/bunnies">Home</a>
        <a href="/bunnies/${bunny.bunnyId}">Details</a>
        <a href="/bunnies/new">New Animal Form</a>
        <a class="active" href="/bunnies/edit/${bunny.bunnyId}">Edit Bunny</a>
    </div>

    <div class="pageTitle">
        <h1>Edit Bunny</h1>
    </div>

    <div class="colWrapper">
        <form action="/bunnies/update" method="post" enctype="multipart/form-data">
            <input type="hidden" name="bunnyId" value="${bunny.bunnyId}" />

            <h3 class="addAnimalh3">Name</h3>
            <input class="addAnimalInput" type="text" name="name" value="${bunny.name}" placeholder="Enter animal name" required>

            <h3 class="addAnimalh3">Breed</h3>
            <input class="addAnimalInput" type="text" name="breed" value="${bunny.breed}" placeholder="Enter animal breed" required>

            <h3 class="addAnimalh3">Age</h3>
            <input class="addAnimalInput" type="number" name="age" step="0.1" value="${bunny.age}" placeholder="Enter age in years" required>

            <h3 class="addAnimalh3">Photo</h3>
            <input class="addAnimalInput" type="file" name="photo" accept="image/*">
            <#if bunny.imagePath??>
                <img src="${bunny.imagePath}" alt="Current Photo" class="animal-photo-preview"/><br>
            </#if>

            <h3 class="addAnimalh3">Description</h3>
            <textarea class="addAnimalInput" name="description" placeholder="Describe the animal">${bunny.description!''}</textarea>

            <button type="submit" class="blueButton">Update Bunny</button>
        </form>
    </div>

</body>

</html>
