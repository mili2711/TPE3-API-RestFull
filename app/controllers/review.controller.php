<?php
require_once './app/models/review.model.php';
require_once './app/views/api.view.php';


class ReviewsController{
    private $model;
    private $view;

    public function __construct() {
        $this->model = new ReviewsModel();
        $this->view = new ApiView();
    }

    //api/reviews/:id
    public function showReviewById($req){
        // obtengo el id de la tarea desde la ruta
        $id_review = $req->params->ID; 

        // obtengo la tarea de la DB
        $review = $this->model->getReview($id_review);

        if (!$review) {
            return $this->view->response("La tarea no existe con ese id", 404);
        }

        // mando la tarea a la vista
        return $this->view->response($review);
    }

    public function getReviewList($req){
        if ($this->model->countEntries() > 0){
            $sortVal = 'id_review';
            if (!empty($req->query->sortby) && ($this->model->isColumn($req->query->sortby) || ($req->query->sortby == 'song_name')))
                $sortVal = $req->query->sortby;

            $order = 'asc';
            if (!empty($req->query->order) && $req->query->order == 'desc') 
                $order = 'desc';
            $order = strtoupper($order);

            if (!empty($req->query->page)){ //reviews paginadas
                $page = $req->query->page;
                $rvwList = $this->getRvwsByPage($page, $sortVal, $order);
            }else{ //lista de reviews completa
                $rvwList = $this->model->getReviews(null, null, $sortVal, $order);
            }
            $this->view->response($rvwList);
        }else{
            $this->view->response("There are no reviews in the system", 204);
        }
    }

    private function getRvwsByPage($pageInput, $sortQuery, $orderQuery){ 
        define('RANGE', 3); //cuantas reviews muestro por pagina
        define('MAX_PAGES', ceil($this->model->countEntries()/RANGE));
        
        if (($pageInput <= MAX_PAGES) && ($pageInput > 0)){
            $offset = (($pageInput-1)*RANGE);
        }else{
            $offset = 0;
        }
        return $this->model->getReviews($offset, RANGE, $sortQuery, $orderQuery);
    }

    public function editReview($req){
        if ($this->model->getReview($req->params->id) == NULL){
            $this->view->response("No such review for that id", 404);
            return;
        }
        if (!isset($req->body->rating) || !isset($req->body->comment)){ 
            $this->view->response("There are empty fields that need to be completed", 400);
            return;
        }

        if ($req->body->rating < 0 || $req->body->rating > 10){
            $this->view->response("Rating value must be between 0 and 10", 400);
            return;
        }

        $id = (int) ($req->params->id);
        $song_name = $req->body->song_name;
        $newRating = (int) $req->body->rating;
        $newComment = htmlspecialchars($req->body->comment);
        $this->model->updateReview($id, $song_name, $newRating, $newComment);

        $updatedRvw = $this->model->getReview($id);
        $this->view->response($updatedRvw);
    }

    public function createReview($req){
        if (empty($req->body->song_name) ||empty($req->body->rating) || empty ($req->body->comment)){
            return $this->view->response("Fill in the blanks", 400);
        }
        $song_name = $req->body->song_name;
        $rating = $req->body->rating;
        $comment = $req->body->comment;
        $id_review = $this->model->insertReview($song_name, $rating, $comment);

        if(!$id_review){
            return $this->view->response("Could not create review", 500);
        }
        $review = $this->model->getReview($id_review);
        return $this->view->response($review, 201);
    }

}
