<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bunnies</title>
</head>
<body>
    <h1>All Bunnies</h1>
    <a href="/bunnies/new">Create New Bunny</a>
    <#if filter?has_content>
        <p>${filter}</p>
    </#if>

    <#if bunnyList?size == 0>
        <p>No bunnies found.</p>
    <#else>
        <table border="1" cellpadding="6">
            <thead>
                <tr>
                    <th>ID</th><th>Name</th><th>Breed</th><th>Photo</th><th>Actions</th>
                </tr>
            </thead>
            <tbody>
            <#list bunnyList as bunny>
                <tr>
                    <td><a href="/bunnies/${bunny.bunnyId}">${bunny.bunnyId}</a></td>
                    <td>${bunny.name}</td>
                    <td>${bunny.breed}</td>
                    <td>
                        <#if bunny.imagePath??>
                            <img src="${bunny.imagePath}" alt="Photo of ${bunny.name}" width="100">
                        <#else>
                            No photo
                        </#if>
                    </td>
                    <td>
                        <a href="/bunnies/${bunny.bunnyId}">View</a> |
                        <a href="/bunnies/edit/${bunny.bunnyId}">Edit</a> |
                        <a href="/bunnies/delete/${bunny.bunnyId}" onclick="return confirm('Delete?');">Delete</a>
                    </td>
                </tr>
            </#list>
            </tbody>
        </table>
    </#if>
</body>
</html>
