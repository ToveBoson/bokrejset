<?php 

require "../classes/author-model.php";
require "../views/author-view.php";

$authorModel = new AuthorModel(require "../partials/connect.php");
$authorView = new AuthorView();


if(isset($_POST["first_name"], $_POST["last_name"])) {
    $first_name = filter_var($_POST["first_name"], FILTER_SANITIZE_SPECIAL_CHARS);
    $last_name = filter_var($_POST["last_name"], FILTER_SANITIZE_SPECIAL_CHARS);


    $authorModel->addAuthor($first_name, $last_name);

    $lastInsertedId  =$authorModel->getLastInsertedId();

    if (!$lastInsertedId) {
        echo "Fel: Kunde inte hämta senast infogat ID.";
        exit;
    }

    $newAuthor = $authorModel->getAuthorById($lastInsertedId);

    if (!$newAuthor) {
        echo "Fel: Kunde inte hämta den nya författaren.";
        exit;
    }

    $authorView->renderAuthor($newAuthor);

}

?>