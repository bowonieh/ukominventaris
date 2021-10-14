<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\UserModel;

class UserController extends BaseController
{
    protected $user;

    public function __construct()
    {
        $this->user = new UserModel();
    }
    public function index()
    {
        //
        //Menampilkan data user

        $a = $this->user;

        return $this->response->setJson($a->findAll());
    }
}
