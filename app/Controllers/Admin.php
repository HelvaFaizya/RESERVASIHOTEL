<?php

namespace App\Controllers;

use App\Controllers\BaseController;

class Admin extends BaseController
{
    public function index()
    {
        return view('admin/login');
    }
    public function login()
    {
        $usernya        = $this->request->getPost('txtUser');
        $passwordnya    = md5($this->request->getPost('txtPass'));
        //aray untuk menentukan syarat siapa yang login
        $syarat=[
        'username'=>$usernya,
        'password'=>$passwordnya
    ];
    //mencari user berdasarkan syarat diatas
    $queryUser =$this->Admin->where($syarat)->find();
    // membuktikan apakah ada user atau tidak
    //var_dump($queryUser);
    if(count($queryUser)==1){
        //membuat session
        $dataSession=[
            'user' =>$queryUser[0]['username'],
            'nama' =>$queryUser[0]['namauser'],
            'level' =>$queryUser[0]['leveluser'],
            'sudahkahLogin'=>true
        ];
        session()->set($dataSession);
        
        //jika sukses login arahkan ke dashboard
        return redirect()->to (site_url('/dashboard'));
    }else {
        //mengembalikan ke halaman login
        return redirect()->to(site_url('/login'))->with('info','<div style="color:blue;font-size:20px">Gagal Login</div>');
    }
}
    public function logout(){
        //menghapus session
        session()->destroy();
        return redirect()->to(site_url('/login'));
    }
}
