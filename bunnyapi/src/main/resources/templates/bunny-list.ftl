<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/style.css">
    <title>Home - Adopt a Flop</title>
</head>

<body>
    <div class="topnav">
        <a class="active" href="/bunnies">Home</a>
        <a href="#">Details</a>
        <a href="/about">About</a>
        <a href="/bunnies/new">New Animal Form</a>
    </div>

    <div class="pageTitle">
        <h1>Welcome to the Adopt a Flop gallery</h1>
        <h4>Bringing you the cutest floppity loppities around!</h4>
    </div>

    <div class="topWrapper">
        <form action="/bunnies/search" method="get" class="text-div">
            <input type="text" name="name" placeholder="Search by name..">
        </form>
        <div class="button-div">
            <button class="button" onclick="document.forms[0].submit();">Search</button>
        </div>
    </div>

    <div class="wrapper">
        <#list bunnyList as bunny>
            <div class="image-div">
                <#if bunny.imagePath??>
                    <img style="width: 100%;" src="${bunny.imagePath}" alt="${bunny.name}">
                <#else>
                    <img style="width: 100%;" src="/Pictures/placeholder.jpg" alt="No image available">
                </#if>
                <h1 style="padding-left: 20px;">${bunny.name}</h1>
                <a href="/bunnies/${bunny.bunnyId}">
                    <button class="imageButton"><h3>Details</h3></button>
                </a>
            </div>
        </#list>
    </div>

</body>

</html>
