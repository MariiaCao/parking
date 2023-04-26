<?php

require_once 'app/models/ColorModel.php';

class ColorController {
    private $model;

    public function __construct(ColorModel $model) {
        $this->model = $model;
    }

    public static function loadColorPage(){
        require_once 'app/views/color/index.php';
    }

    public function createColor(){
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $color = $_POST['color'];
            if ($this->model->createColor($color)) {
                header("Location: /");
            } else {
                echo "Error al crear el usuario.";
            }
        } else {
            include 'views/home/create.php';
        }
    }
} 