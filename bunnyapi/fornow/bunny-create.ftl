<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Bunny</title>
</head>
<body>
    <h1>Create Bunny</h1>
    <form action="/bunnies/new" method="post" enctype="multipart/form-data">
        <label>Name: <input name="name" value="${bunny.name!''}" required></label><br>
        <label>Breed: <input name="breed" value="${bunny.breed!''}"></label><br>
        <label>Age: <input name="age" type="number" value="${bunny.age!''}"></label><br>
        <label>Description:<br>
            <textarea name="description">${bunny.description!''}</textarea>
        </label><br>
        <label>Photo: <input type="file" name="photo" accept="image/*"></label><br>
        <button type="submit">Create</button>
    </form>
    <a href="/bunnies">Cancel</a>
</body>
</html>
