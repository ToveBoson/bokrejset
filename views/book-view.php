<?php 

class BookView{
    
    public function renderAllBooksAsList(array $books):void{
        echo "<ul>";
        foreach($books as $book){
            echo "<li>{$book["title"]} {$book["year"]}</li>"; 
        }
        echo "</ul>";

    }

    public function renderBooksWithAuthor(array $books): void{
        echo "<ul>";
        foreach($books as $book){
        echo "<li>{$book["title"]} {$book["year"]} {$book["genre"]} av {$book["first_name"]} {$book["last_name"]}</li>";    
        }
        echo "</ul>";
    }

}

?>