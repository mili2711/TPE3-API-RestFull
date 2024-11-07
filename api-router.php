<?php
require_once 'config.php';
require_once './libs/router.php';
require_once './app/controllers/review.controller.php';

//crea el router
$router = new Router();

//tabla de ruteo
$router->addRoute('reviews', 'GET', 'ReviewsController', 'showAllReviews');
$router->addRoute('reviews/:ID', 'GET', 'ReviewsController', 'showReviewById');
$router->addRoute('reviews/:ID', 'DELETE', 'ReviewsController', 'deleteReview');

//captura la parte de la URL que necesitas
$router->route($_GET['resource'], $_SERVER['REQUEST_METHOD']);

