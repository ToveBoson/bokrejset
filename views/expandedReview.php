<?php

require_once "classes/review-model.php";

class ExpandedReviewView extends ReviewModel {

    public function renderExpandedReview(array $separateReviews):void {

        echo "<div>";

        foreach($separateReviews as $oneReview){

                echo "<h3> {$oneReview["title"]} </h3>";
                echo "<p> {$oneReview["review"] }</p>";

                     

        }
        echo "</div>";

    }
}



?>
