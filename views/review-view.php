<?php 

require_once "classes/review-model.php";



class ReviewView{

    public function renderAllReviews(array $reviews): void{

    echo "<ul>";
        foreach($reviews as $review){

            echo "<li> <a href= 'reviewInfo.php?id={$review["id"]}'> {$review["title"]} recenseras av {$review["name"]} </a> </li>";
        }
        echo "</ul>";

    }
}


?>