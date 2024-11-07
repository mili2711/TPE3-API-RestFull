<?php
require_once './app/models/review.model.php';
require_once './app/views/api.view.php';

class ReviewsController{
    private $model;
    private $view;
    private $data;

    public function __construct() {
        $this->model = new ReviewsModel();
        $this->view = new ApiView();
        $this->data = file_get_contents("php://input");
    }

    public function getData() {
        return json_decode($this->data);
    }

    //api/reviews
    public function showAllReviews(){
        $reviews = $this->model->getReviews();
        // Verifica si la consulta devolvió datos
        if (empty($reviews)) {
            $this->view->response(['message' => 'No reviews found'], 404); // No encontró reseñas
        } else {
            // Devolver las reseñas en formato JSON
            return $this->view->response($reviews);
        }
    }
    //api/reviews/:id
    public function showReviewById($params){
        $id_review = $params[':ID']; 
        // obtengo el id de la tarea desde la ruta

        // obtengo la tarea de la DB
        $review = $this->model->getReview($id_review);

        if (!$review) {
            return $this->view->response("La tarea no existe con ese id", 404);
        }

        // mando la tarea a la vista
        return $this->view->response($review);
    }
}
