<?php

require "classes/author-model.php";
require "views/author-view.php";

$pdo = require "partials/connect.php";

$authorModel = new AuthorModel($pdo);
$authorView = new AuthorView();

include "partials/header.php";
include "partials/nav.php";


$authorView->renderAllAuthors($authorModel->getAllAuthors());


// $authors = $authorModel->getAllAuthors();
// $authorView->renderAllAuthors($authors);

?>

<form  method="post">
    <input type="text" name="first_name" id="first_name" placeholder="Förnamn"><br>
    <input type="text" name="last_name" id="last_name" placeholder="Efternamn"><br>

    <button type="submit">Lägg till författare</button>

</form>

<?php
include "partials/footer.php"; 
?>