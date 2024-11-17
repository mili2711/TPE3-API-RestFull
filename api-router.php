<?php
require_once './libs/router.php';
require_once './app/controllers/review.controller.php';

$router = new Router();

//tabla de ruteo

$router->setDefaultRoute('ReviewsController', 'getReviewList');

// PARTE A 
$router->addRoute('reviews', 'GET', 'ReviewsController', 'getReviewList'); 
$router->addRoute('reviews/:id', 'PUT', 'ReviewsController', 'editReview'); 

// PARTE B
$router->addRoute('reviews/:ID', 'GET', 'ReviewsController', 'showReviewById');
$router->addRoute('reviews', 'POST', 'ReviewsController', 'createReview');

//captura la parte de la URL que necesitas
$router->route($_GET['resource'], $_SERVER['REQUEST_METHOD']);
