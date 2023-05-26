<?php

require_once "views/expandedReview.php";
require_once "classes/review-model.php";

$pdo = require "partials/connect.php";

$reviewModel = new ReviewModel($pdo);
$expanded = new ExpandedReviewView($pdo);


include "partials/header.php";
include "partials/nav.php";


$id = $_GET["id"];
$separateReviews = $reviewModel->getReview($id);


$expanded->renderExpandedReview($separateReviews);

include "partials/footer.php";




?>
