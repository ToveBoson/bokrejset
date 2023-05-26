<?php

require_once "views/review-view.php";
require_once "classes/review-model.php";

$pdo = require "partials/connect.php";

$reviewModel = new ReviewModel($pdo);
$reviewView = new ReviewView();


include "partials/header.php";
include "partials/nav.php";


$reviewView->renderAllReviews($reviewModel->getAllReviewsByUser());

include "partials/footer.php";