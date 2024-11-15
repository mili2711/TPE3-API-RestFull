<?php
require_once 'config.php';

class ReviewsModel
{
    private $db;

    public function __construct()
    {
        $this->db = new PDO('mysql:host=' . MYSQL_HOST . ';dbname=' . MYSQL_DB . ';charset=utf8', MYSQL_USER, '');
    }

    public function getReview($id_review)
    {
        $query = $this->db->prepare("SELECT `id_review`, `song_name`, `rating`, `comment` 
            FROM `review` 
            JOIN `song` ON review.song_id = song.song_id
            WHERE `id_review`= ?");

        $query->execute([$id_review]);

        $review = $query->fetch(PDO::FETCH_OBJ);

        return $review;
    }

    public function getReviews($offs = null, $lim = null, $_orderBy, $_mode)
    {
        $allowedColumns = ['id_review', 'song_name', 'rating', 'comment'];
        $allowedModes = ['ASC', 'DESC'];

        if (in_array($_orderBy, $allowedColumns)) {
            $orderBy = $_orderBy;
        } else {
            $orderBy = 'id_review';
        }

        if (in_array($_mode, $allowedModes)) {
            $mode = $_mode;
        } else {
            $mode = 'ASC';
        }

        $basicQuery =
            "SELECT `id_review`, `song_name`, `rating`, `comment` 
            FROM `review` JOIN `song` ON review.song_id = song.song_id
            ORDER BY $orderBy $mode ";

        if (isset($offs) && isset($lim)) {
            $query = $this->db->prepare($basicQuery . "LIMIT :lim OFFSET :offs");
            $query->bindValue(':lim', (int) $lim, PDO::PARAM_INT);
            $query->bindValue(':offs', (int) $offs, PDO::PARAM_INT);
        } else {
            $query = $this->db->prepare($basicQuery);
        }
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    public function isColumn($colName)
    {
        $query = $this->db->prepare("SELECT EXISTS(
            SELECT 1 
            FROM INFORMATION_SCHEMA.COLUMNS 
            WHERE TABLE_SCHEMA = '" . MYSQL_DB . "' 
              AND TABLE_NAME = 'review' 
              AND COLUMN_NAME = :name
        );");
        $query->bindParam(':name', $colName);
        $query->execute();
        return (bool) $query->fetchColumn();
    }

    public function updateReview($id, $rating, $comment)
    {
        $query = $this->db->prepare("UPDATE `review` SET rating = :newRating, comment = :newComment WHERE id_review = :id");
        $query->bindParam(':newRating', $rating);
        $query->bindParam(':newComment', $comment);
        $query->bindParam(':id', $id);
        $query->execute();
    }

    public function countEntries()
    {
        $query = $this->db->prepare("SELECT COUNT(*) AS 'totalEntries' FROM `review`");
        $query->execute();
        return $query->fetchColumn();
    }

}