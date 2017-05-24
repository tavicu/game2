<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Emag_model extends CI_Model
{

    public function getQuestion($id = 0)
    {
        $this->db->select('*');
        if (isset($_SESSION['prev_questions']) && $id == 0) {
            $this->db->where_not_in('id', $_SESSION['prev_questions']);
        } elseif ($id != 0) {
            $this->db->where('id', intval($id));
        }
        $this->db->order_by('id', 'RANDOM');
        $this->db->limit(1);
        $query = $this->db->get('php_elephant_questions');

        return $query->result_array();
    }

    public function saveAnswers($id, $code)
    {
        $data = array(
            'question_id' => $id,
            'answer_code' => $code,
        );

        $this->db->insert('php_elephant_answers', $data);
    }
}
