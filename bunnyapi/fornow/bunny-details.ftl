<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bunny Details - ${bunny.name!''}</title>
</head>
<body>
    <a href="/bunnies">Back to list</a>
    <h1>${bunny.name}</h1>
    <p><strong>Breed:</strong> ${bunny.breed}</p>
    <p><strong>Age:</strong> ${bunny.age?if_exists!''}</p>
    <p><strong>Description:</strong> ${bunny.description!''}</p>

    <#if bunny.imagePath??>
        <img src="${bunny.imagePath}" alt="Photo of ${bunny.name}" width="100">
    <#else>
        <p>No photo available.</p>
    </#if>

    <a href="/bunnies/edit/${bunny.bunnyId}">Edit</a> |
    <a href="/bunnies/delete/${bunny.bunnyId}" onclick="return confirm('Delete this bunny?');">Delete</a>
</body>
</html>
