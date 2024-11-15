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
            if (substr($req->query->resource, 0, 12) == 'reviews/page'){ //reviews paginadas
                $page = 1; //pagina por defecto
                if (isset($req->params->pagNum)) {$page = $req->params->pagNum;}
                $rvwList = $this->getRvwsByPage($page);
            }else{ //lista de reviews completa
                $rvwList = $this->model->getReviews();
            }
            $this->processReviews($rvwList, $req->query);
            $this->view->response($rvwList);
        }else{
            $this->view->response("There are no reviews in the system", 204);
        }
    }

    private function getRvwsByPage(int $pageInput){ 
        define('RANGE', 4); //cuantas reviews muestro por pagina
        define('MAX_PAGES', ceil($this->model->countEntries()/RANGE));
        $offset = 0;
        if (($pageInput <= MAX_PAGES) && ($pageInput > 0)){
            $offset = (($pageInput-1)*RANGE);
        }
        return $this->model->getReviews($offset, RANGE);
    }

    private function processReviews(&$rvws, $queries){
        $sortVal = 'id_review'; //criterio de ordenamiento por defecto
        if (!empty($queries->sortby) && ($this->model->isColumn($queries->sortby) || ($queries->sortby == 'song_name')))
            {$sortVal = $queries->sortby;}

        $order = 'asc'; //orden por defecto
        if (isset($queries->order) && $queries->order == 'desc') 
            $order = 'desc';

        usort($rvws, function($rvw1, $rvw2) use ($sortVal, $order){
            return $this->comparator($rvw1, $rvw2, $sortVal, $order);}
        );
    }

    /*funcion que compara un objeto con otro, dado un criterio, y retorna 1, 0 ó -1 en caso 
    de ser mayor, igual, o menor, respectivamente */
    private function comparator($a, $b, $value, $order){ 
        if ($a->$value > $b->$value) $output = 1;
        if ($a->$value == $b->$value) $output = 0;
        if ($a->$value < $b->$value) $output = -1;
        if ($order == 'desc') return -$output;
        return $output;
    }


    public function editReview($req){
        if ($this->model->getReview($req->params->id) == NULL){
            $this->view->response("No such review for that id", 404);
            return;
        }
        if (empty($req->body->rating) || empty($req->body->comment)){ 
            $this->view->response("There are empty fields that need to be completed", 400);
            return;
        }

        //por cuestiones de integridad de la bdd no se pueden modificar ni el id ni el nombre de la cancion
        $id = (int) ($req->params->id);
        $newRating = (int) $req->body->rating;
        $newComment = htmlspecialchars($req->body->comment);
        $this->model->updateReview($id, $newRating, $newComment);

        $updatedRvw = $this->model->getReview($id);
        $this->view->response($updatedRvw);
    }

    
    
}
