<?php 

require_once "db.php";


class BookModel extends DB{

    protected $table = "books";

    public function getAllBooks(){
        return $this->getAllData($this->table);
    }

    public function getAllBooksWithAuthors() {
        $query = "SELECT books.title, books.year, books.genre, authors.first_name, authors.last_name FROM books JOIN authors ON books.author_id=authors.id";
        $statement = $this->pdo->prepare($query);
        $statement->execute();

        return $statement->fetchAll(PDO::FETCH_ASSOC);
    }

}

?>