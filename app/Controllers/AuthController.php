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
        //inisiasi usermodel
        $check = new UserModel();
        $d = $check->where(
                    array(
                        'username' => $username,
                        'password' => $password
                    )
                )->first();
        if($d > 0){
            $sess_data = [
                'status'       => true,
                'IS_LOGGED_IN' => true,
                'id_user'      => $d['id_user'],
                'level'        => $d['level'],
                'pesan'         => "Anda Berhasil Login"
            ];
            $this->session->set($sess_data);
            return $this->response->setJson($sess_data);
            //echo "login berhasil";
        }else{
            $msg = [
                'status'    => false,
                'pesan'     => 'Login Gagal'
            ];
            return $this->response->setJson($msg);
        }
        

    }
    public function logout(){

    }
}