<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/style.css">
    <title>Bunny Details - ${bunny.name!''}</title>
</head>

<body>
    <div class="topnav">
        <a href="/bunnies">Home</a>
        <a class="active" href="#">Details</a>
        <a href="/about">About</a>
        <a href="/bunnies/new">New Animal Form</a>
    </div>

    <div class="pageTitle">
        <h1>${bunny.name!''}</h1>
    </div>

    <div class="wrapper">
        <div class="image-div">
            <#if bunny.imagePath??>
                <img style="width: 100%;" src="${bunny.imagePath}" alt="${bunny.name}">
            <#else>
                <img style="width: 100%;" src="/Pictures/placeholder.jpg" alt="No image available">
            </#if>

            <h1 style="padding-left: 20px;">Details</h1>
            <h3 style="padding-left: 20px; padding-right: 20px;">
                ${bunny.description!''}
            </h3>
            <p style="padding-left: 20px;">Age: ${bunny.age?if_exists!''}</p>
            <p style="padding-left: 20px;">Last updated: ${bunny.lastUpdated?if_exists!''}</p>

            <a href="/bunnies/edit/${bunny.bunnyId}">
                <button class="blueButton">Edit</button>
            </a>
            <a href="/bunnies/delete/${bunny.bunnyId}" onclick="return confirm('Delete this bunny?');">
                <button class="redButton">Remove</button>
            </a>
        </div>
    </div>

</body>

</html>
