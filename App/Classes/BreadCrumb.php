<?php

namespace App\Classes;

use App\Classes\Uri;

class BreadCrumb {
    
    private $uri;
    public function __construct() {
        $uri = new Uri;
        $this->uri=$uri->getUri();
        
    }
    public function createBreadCrumb(){
        if (substr_count($this->uri,'?')> 0){
            $explodeIgual = explode('=', $this->uri);
            return "<span style='color:#0000;'>Você está buscando: </span> 
                <span style='font-style=italic;> 
                    <a href='/' style='text-decoration:none;'>Inicio</a>/".str_replace('+', '-', $explodeIgual[1].'</span >');

        }
        if ($this->uri == '/' ){
            return "<span style = 'color:#000;'>Navegação</span>: <span style='font-style:italic;'>Inicio</span>";
            
        }
        return "<span style = 'color:#000;'>Navegação</span>: <span style='font-style:italic;'><a href='/' style='text-decoration:none;'>Inicio</a>/". ucfirst(ltrim($this->uri, '/') . '</span>');

        
        
    }
}
