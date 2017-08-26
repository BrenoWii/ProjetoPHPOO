<?php

namespace App\Repositories\Site;

use App\Models\Site\ProdutoModel;

class ProdutoRepository {
    
    private $produto;
    
    public function __construct() {
        $this->produto = new ProdutoModel;
    }
    
    public function  listarProdutosOrdenadosComLimite($limite){
        $sql = "select * from {$this->produto->table} order by produto_destaque=1 DESC limit {$limite}";
        $this->produto->typeDatabase->prepare($sql);
        $this->produto->typeDatabase->execute();
        return $this->produto->typeDatabase->fetchAll();
        
    }
        public function  ultimoProdutoAdicionado(){
        $sql = "select * from {$this->produto->table} order by id DESC ";
        $this->produto->typeDatabase->prepare($sql);
        $this->produto->typeDatabase->execute();
        return $this->produto->typeDatabase->fetch();
        
    }
        public function  produtosEmPromocao($limite){
        $sql = "select * from {$this->produto->table} where produto_promocao=1 order by RAND() limit {$limite}";
        $this->produto->typeDatabase->prepare($sql);
        $this->produto->typeDatabase->execute();
        return $this->produto->typeDatabase->fetchAll();
        
    }
    
   
}
