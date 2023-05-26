<?php 

require_once "db.php";

class AuthorModel extends DB {

    protected $table = "authors";

    public function getAllAuthors(){

        return $this->getAllData($this->table);

    }


    public function addAuthor(string $first_name, string $last_name) {
        $sql = "INSERT INTO {$this->table} (first_name, last_name) VALUES (?,?)";
        $statement = $this->pdo->prepare($sql);
        $statement->execute([$first_name, $last_name]);
    }

    public function getAuthorById(int $authorId) {
        $sql = "SELECT * FROM {$this->table} WHERE id = ?";
        $statement = $this->pdo->prepare($sql);
        $statement->execute([$authorId]);
        return $statement->fetch(PDO::FETCH_ASSOC);
    }
    


    public function getLastInsertedId() {
        return $this->pdo->lastInsertId();
    }
    
}


?>