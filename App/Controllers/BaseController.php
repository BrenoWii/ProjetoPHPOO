<?php


namespace App\Controllers;

class BaseController
{
    public $twig;
    
    public function setTwig($twig){
        $this->twig=$twig;
        
        
    }
    
    
}
