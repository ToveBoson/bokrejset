<?php 

require_once "db.php";

class ReviewModel extends DB {

        protected $table = "reviews";

        public function getAllReviews() {

            return $this->getAllData($this->table);
        }


        public function getAllReviewsByUser() {
           $query = "SELECT reviews.title, users.name, reviews.id, books.title AS booktitle FROM reviews 
            JOIN users ON reviews.user_id = users.id
            JOIN books ON reviews.book_id = books.id";       
            $statement = $this->pdo->prepare($query);
            $statement->execute();
            
            return $statement->fetchAll(PDO::FETCH_ASSOC);
            
        }

        public function getReview(int $id){
            $query = "SELECT reviews.*, users.name, books.title AS booktitle FROM reviews 
            JOIN users ON reviews.user_id = users.id
            JOIN books ON reviews.book_id = books.id
            WHERE reviews.id = ?";

            $statement = $this->pdo->prepare($query);
            $statement->execute([$id]);
            
            return $statement->fetchAll(PDO::FETCH_ASSOC);
        }


}


?>