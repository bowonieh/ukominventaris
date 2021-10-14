<?php
namespace App\Controllers;
use App\Controllers\UserController;
use App\Models\UserModel;

class AuthController extends UserController{
    protected $session;
    public function __construct()
    {
        $this->session = session();
    }
    public function formlogin(){
        $data = [

        ];

        return view('login/formlogin',$data);
    }
    public function check(){
        $username = $this->request->getVar('username');
        $password = $this->request->getVar('password');
        $check = new UserModel();
        $d = $check->where(
                    array(
                        'username' => $username,
                        'password' => $password
                    )
                )->first();
        if($d > 0){
            $sess_data = [
                'IS_LOGGED_IN' => true,
                'id_user'      => $d['id_user'],
                'level'        => $d['level']
            ];
            $this->session->set($sess_data);
            return $this->response->setJson($sess_data);
            //echo "login berhasil";
        }else{
            echo "login Gagal";
        }
        

    }
    public function logout(){

    }
}