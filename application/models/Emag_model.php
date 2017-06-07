<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Emag_model extends CI_Model
{
    public function getLeaderBoard()
    {
        $this->db->select('*');
        $this->db->order_by('highscore', 'desc');
        $this->db->limit(10);
        $query = $this->db->get('leaderboard');
        return $query->result_array();
    }

    public function getUserExistance($user)
    {
        $this->db->select('*');
        $this->db->where('name', $user);
        $query = $this->db->get('leaderboard');
        return $query->num_rows();
    }

    public function insertUser($name)
    {
        $data = array(
            'name' => $name,
            'highscore' => 0,
        );
        $this->db->insert('leaderboard', $data);

        return $this->db->insert_id();
    }

    public function updateUser($userId)
    {
        $this->db->where('id', $userId);
        $this->db->set('highscore', 'highscore+10', FALSE);
        $this->db->update('leaderboard');
    }

    public function getUserScore($userId)
    {
        $this->db->select('*');
        $this->db->where('id', $userId);
        $query = $this->db->get('leaderboard');
        return $query->result_array();
    }

    public function getQuestions($gameId, $fields)
    {
        $this->db->select(implode($fields, ','));
        $this->db->where('game_id', $gameId);
        $query = $this->db->get('questions');
        return $query->result_array();

    }

    public function getPHPQuestion($questionId)
    {
        $this->db->select('run_code_answer');
        $this->db->where('id', $questionId);
        $query = $this->db->get('questions');
        return $query->result_array();
    }
}
