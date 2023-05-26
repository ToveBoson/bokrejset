<?php
require "classes/book-model.php";
require "views/book-view.php";

$pdo = require "partials/connect.php";

$bookModel = new BookModel($pdo);
$bookView = new BookView();

include "partials/header.php";
include "partials/nav.php";

$bookView->renderBooksWithAuthor($bookModel->getAllBooksWithAuthors());



include "partials/footer.php";

?>