<?php 

require_once "classes/author-model.php";

class AuthorView{


    public function renderAllAuthors(array $authors): void{
        echo "<ul>";
        foreach($authors as $author) {
            echo "<li> {$author["first_name"]} {$author["last_name"]} </li>";
        }
        echo "</ul>";
    }

    public function renderAuthor(array $authors): void{
        echo "<ul>";
        foreach($authors as $a) {
            echo "<li> {$a["first_name"]} {$a["last_name"]} </li>";
        }
        echo "</ul>";
    }
}

?>