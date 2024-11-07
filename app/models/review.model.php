<?php

class ReviewsModel {
    private $db;

    public function __construct() {
       $this->db = new PDO('mysql:host=localhost;dbname=db_songs;charset=utf8', 'root', '');
    }
 
    public function getReviews(){
        $sql = 'SELECT * FROM review';
        // 2. Ejecuto la consulta
        $query = $this->db->prepare($sql);
        $query->execute();
      
        // 3. Obtengo los datos en un arreglo de objetos
        $reviews = $query->fetchAll(PDO::FETCH_ASSOC); 
      
        return $reviews;
    }
    public function getReview($id_review) {    
        $query = $this->db->prepare('SELECT * FROM review WHERE id_review = ?');
        $query->execute([$id_review]);   
    
        $review = $query->fetch(PDO::FETCH_OBJ);
    
        return $review;
    }


}