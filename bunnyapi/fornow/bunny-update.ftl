<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Bunny</title>
</head>
<body>
    <h1>Update Bunny</h1>
    <form action="/bunnies/update" method="post">
        <label>ID: <input name="bunnyId" value="${bunny.bunnyId}" readonly></label><br>
        <label>Name: <input name="name" value="${bunny.name}" required></label><br>
        <label>Breed: <input name="breed" value="${bunny.breed}"></label><br>
        <label>Age: <input name="age" type="number" value="${bunny.age}"></label><br>
        <label>Description:<br>
            <textarea name="description">${bunny.description!''}</textarea>
        </label><br>
        <button type="submit">Save</button>
    </form>
    <a href="/bunnies/${bunny.bunnyId}">Cancel</a>
</body>
</html>
