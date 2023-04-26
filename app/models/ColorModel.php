<?php

require_once 'ConnectionModel.php';

class ColorModel {

    private $connect;
    private $table = 'colores_autos';


    public function __construct()
    {
        $this->connect = new ConnectionModel();
    }

    public function createColor($color){
        $createColor = $this->connect->insert($this->table, $color);
        if ($createColor) {
            return 'creado';
        }else{
            return 'error';
        }
    }


}