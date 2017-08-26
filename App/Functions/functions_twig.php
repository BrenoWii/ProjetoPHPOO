<?php

use App\Repositories\Site\CategoriaRepostory;
use App\Repositories\Site\ProdutoRepository;
use App\Classes\BreadCrumb;

$site_url = new \Twig_SimpleFunction('site_url', function(){
    return 'http://'.$_SERVER['SERVER_NAME'];
 
});

$categorias= new \Twig_SimpleFunction('categorias', function(){
    $categoriaRepository = new CategoriaRepostory;
    return$categoriaRepository->listarCategorias() ;
   
});

$novidade= new \Twig_SimpleFunction('novidade', function(){
    $produto = new ProdutoRepository;
    return $produto->ultimoProdutoAdicionado() ;
   
});
//Listar produto em promoção
$promocao= new \Twig_SimpleFunction('promocao', function(){
    $produto = new ProdutoRepository;
    return $produto->produtosEmPromocao(1) ;
   
});

//migalhas de pao
$breadCrumb= new \Twig_SimpleFunction('breadCrumb', function(){
  $breadCrumb = new BreadCrumb();
  return $breadCrumb->createBreadCrumb();
});


