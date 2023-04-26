<?php

require_once 'app/controllers/HomeController.php';
require_once 'app/controllers/ParkingController.php';
require_once 'app/controllers/ColorController.php';


$url = isset($_GET['url']) ? $_GET['url'] : '/';

// Inicializa el enrutador
switch ($url) {
    case '/':
        HomeController::loadHomePage();
        break;
    case 'color':
        ColorController::loadColorPage();
        break;
    default:
        http_response_code(404);
        echo 'Página no encontrada';
        break;
}