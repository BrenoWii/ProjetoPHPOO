<?php


namespace App\Controllers\Site;

use App\Controllers\BaseController;
use App\Repositories\Site\ProdutoRepository;

class HomeController extends BaseController {

    public function index() {

      
        $produtoRepository = new ProdutoRepository;
        $produtosDestaque =$produtoRepository-> listarProdutosOrdenadosComLimite(6);
        
        $produtosEmPromocao = $produtoRepository->produtosEmPromocao(6);
        
        
        
           
        
        

        $dados = [
            'titulo' => 'Curso PHPOO | Loja Virtual',
            'produtos' => $produtosDestaque,
            'produtosEmPromocao' => $produtosEmPromocao
        ]; 

        $template = $this->twig->loadTemplate('site_home.html');
        $template->display($dados);
    }

}
