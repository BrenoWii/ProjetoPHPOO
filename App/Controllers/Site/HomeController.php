<?php


namespace App\Controllers\Site;

use App\Controllers\BaseController;

class HomeController extends BaseController
{
    public function index(){
        
        $dados = [
            'titulo'=>'Curso PHPOO | Loja Virtual',
            'nome'=>'Breno William'
            ];
        
        $template =$this->twig->loadTemplate('site_home.html');
        $template->display($dados);
    }
}
