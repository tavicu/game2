<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Emag extends CI_Controller
{

    private $notRepeatebleQuestions = 3;

    public function index()
    {
        $this->load->view('emag_index');
    }

    public function status()
    {
        $this->load->view('status_question');
    }

    public function leaderboard()
    {
        $this->load->view('leaderboard');
    }

    public function getQuestion($id = 0)
    {
        $this->load->model('emag_model');
        $question = $this->emag_model->getQuestion($id);
        $this->_setPrevQuestions($question[0]['id']);
        echo json_encode($question[0]);
    }

    public function sendAnswer()
    {
        $id = (int)$this->input->post('id');
        $code = $this->input->post('code');

        $this->load->model('emag_model');
        $question = $this->emag_model->getQuestion($id);
        $this->emag_model->saveAnswers($id, $code);
        $runCodeResult = $this->_runCode($code);

        $ret = $runCodeResult == $question[0]['answer_return'] ? 'done' : 'fail';

        echo json_encode($ret);
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

    private function _setPrevQuestions($id)
    {
        if (empty($_SESSION['prev_questions'])) {
            $_SESSION['prev_questions'][] = $id;
        } else {
            $_SESSION['prev_questions'][] = $id;
            $reversedSes = array_reverse($_SESSION['prev_questions']);
            $output = array_slice($reversedSes, 0, $this->notRepeatebleQuestions);
            $_SESSION['prev_questions'] = array_reverse($output);
        }
    }
}

