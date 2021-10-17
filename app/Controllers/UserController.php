<?php

namespace App\Controllers;
use App\Controllers\BaseController;
use App\Models\UserModel;

class UserController extends BaseController
{
    protected $pengguna;

    public function __construct()
    
    {
        $this->pengguna = new UserModel();
    }
    public function index()
    {
        //
        //Menampilkan data user

        $a = $this->pengguna;

        return $this->response->setJson($a->findAll());

    }
}
