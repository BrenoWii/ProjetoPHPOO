<?php


namespace App\Repositories\Site;
use App\Models\Site\CategoriaModel;

class CategoriaRepostory {
    private $categoria;
    
    public function __construct() {
        $this->categoria = new CategoriaModel;
    }
    
    public function listarCategorias(){
        $sql = "select categoria_slug, categoria_nome from {$this->categoria->table} group by categorias.id ";
        
        $this->categoria->typeDatabase->prepare($sql);
        $this->categoria->typeDatabase->execute();
        return $this->categoria->typeDatabase->fetchAll();
        
    }
    
    

    
}
