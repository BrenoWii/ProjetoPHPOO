<?php


namespace App\Models\Database\ConnectDatabase;

use App\Interfaces\InterfaceConnectDatabase;

class ConnectMysqliDatabase implements InterfaceConnectDatabase{
    
    
    private $mysqli;
    
    
    public function __construct() {
        $this->mysqli= new \Mysqli("localhost","root","root","loja_phpoo");
        $this->pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_OBJ);
        $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    }
    public function connectDatabase() {
        return $this->mysqli;
    }
    
    
    
}
