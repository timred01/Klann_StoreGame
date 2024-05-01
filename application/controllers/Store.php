<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Store extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('store_model', 'store');
    }

    public function index()
    {
        $data['title']     = 'Store';
        $data['games']        = $this->store->getAllGame();
        $data['banners']    = $this->store->getAllBanner();
        $data['page']        = 'pages/store/index';
        $this->load->view('layouts/app', $data);
    }

    public function detail($id)
    {
        $data['title'] = 'Detail Game';
        $data['game']    = $this->store->getGameById($id);
        $data['page']    = 'pages/store/detail';
        $this->load->view('layouts/app', $data);
    }
}