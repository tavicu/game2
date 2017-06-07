<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Emag extends CI_Controller
{

    public function index()
    {
        echo 'No access here';
    }

    public function status()
    {
        header('Content-Type: application/json');
        header('Access-Control-Allow-Origin: *');
        $this->load->model('emag_model');
        $highscore = $this->emag_model->getLeaderBoard();
        echo json_encode($highscore);
        exit;
    }


    public function registerUser()
    {
        header('Content-Type: application/json');
        header('Access-Control-Allow-Origin: *');
        $user = $this->input->post('user');
        $this->load->model('emag_model');

        if(ctype_alpha($user)){
            if($this->emag_model->getUserExistance($user) == 0){
                echo json_encode(array('id'=>$this->emag_model->insertUser($user), 'user'=>$user));
                exit;
            } else {
                echo json_encode(array('Error: User already exists'));
                exit;
            }
        } else {
            echo json_encode(array('Error: User must be only letters'));
            exit;
        }
    }


    public function getQuestions(int $gameId)
    {
        header('Content-Type: application/json');
        header('Access-Control-Allow-Origin: *');
        if(!is_int($gameId) || $gameId < 0 || $gameId > 6){
            echo json_encode(array('Error: No game for this id'));
            exit;
        }

        $this->load->model('emag_model');

        switch ($gameId){
            case 1:
                $questions = $this->emag_model->getQuestions($gameId, array('id', 'game_id', 'title', 'code', 'option1', 'option2', 'option3', 'option4', 'answer'));
                break;
            case 2:
                $questions = $this->emag_model->getQuestions($gameId, array('id', 'game_id', 'title', 'option1', 'option2', 'option3', 'option4', 'answer'));
                break;
            case 3:
                $questions = $this->emag_model->getQuestions($gameId, array('id', 'game_id', 'title', 'code', 'option1', 'option2', 'option3', 'option4', 'answer'));
                break;
            case 4:
                $questions = $this->emag_model->getQuestions($gameId, array('id', 'game_id', 'title', 'code'));
                break;
            case 5:
                $questions = $this->emag_model->getQuestions($gameId, array('id', 'game_id', 'title', 'option1', 'option2', 'option3', 'answer'));
                break;
            case 6:
                $questions = $this->emag_model->getQuestions($gameId, array('id', 'game_id', 'title', 'option1', 'option2', 'option3', 'answer'));
                break;
        }

        echo json_encode($questions);
        exit;
    }


    public function updateScore()
    {
        header('Content-Type: application/json');
        header('Access-Control-Allow-Origin: *');
        $userId = $this->input->post('id');
        $this->load->model('emag_model');
        $this->emag_model->updateUser($userId);
        $ret = $this->emag_model->getUserScore($userId);

        echo json_encode($ret);
        exit;
    }

    public function sendPHPAnswer()
    {
        header('Content-Type: application/json');
        header('Access-Control-Allow-Origin: *');
        $id = (int)$this->input->post('id');
        $code = $this->input->post('code');

        $this->load->model('emag_model');
        $question = $this->emag_model->getPHPQuestion($id);

        $runCodeResult = $this->_runCode($code);

        $ret = $runCodeResult == $question[0]['run_code_answer'] ? 'success' : 'fail';

        echo json_encode(array($ret));
    }

    private function _runCode($code)
    {
        $patterns = array('/unlink/i', '/fopen/i', '/fwrite/i', '/eval/i',
            '/curl/i', '/exec/i', '/ini_set/i', '/query/i', '/socket/i', '/include/i',
            '/require/i', '/chmod/i', '/chown/i', '/delete/i', '/copy/i',
            '/this->/i', '/mysql/i', '/rmdir/i', '/dirname/i', '/ini_/i',
            '/set_/i', '/ftp_/i', '/mkdir/i', '/file/i', '/fsockopen/i',
            '/file_get_contents/i', '/base64/i', '/system/i', '/rm -rf/i',
            '/touch/i', '/allow_url_fopen/i', '/allow_url_include/i', '/shell/i',
            '/passthru/i', '/popen/i', '/stream_select/i', '/image/i',
            '/proc_open/i', '/parse_ini_file/i', '/show_source/i', '/readfile/i',
            '/posix_mkfifo/i', '/pg_lo_import/i', '/dbmopen/i', '/dbase_open/i',
            '/chgrp/i', '/symlink/i', '/pcntl_exec/i', '/apache_child_terminate/i',
            '/apache_setenv/i', '/define_syslog_variables/i', '/posix/i', '/proc_/i',
            '/pclose/i', '/proc_nice/i', '/proc_terminate/i', '/shell_exec/i',
            '/phpinfo/i', '/gzinflate/i', '/cp/i', '/chdir/i');
        $code = preg_replace($patterns, '', $code);

        $code = 'set_time_limit(3); ' . $code;
        ob_start();
        @eval($code);
        $response = ob_get_contents();
        ob_end_clean();

        if (error_get_last()) {
            $response = 'fail';
        }
        return $response;
    }

}

