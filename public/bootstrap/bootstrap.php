<?php



use App\Classes\Template;
use App\Classes\Parameters;





$template = new Template;

$twig=$template->init();

$twig->addFunction($site_url);
$twig->addFunction($categorias);
$twig->addFunction($novidade);
$twig->addFunction($promocao);
$twig->addFunction($breadCrumb);





$callController = new App\Controllers\Controller;
$calledController = $callController->controller();
$controller = new $calledController();
$controller->setTwig($twig);



/**
 * Chamando o metodo digitado na url
 *  http://localhost:8888/controller/metodo
 */
$callMethod = new App\Controllers\Method;
$method = $callMethod->method($controller);




/**
 * Chamando o controller atraves da classe controller e da classe method
 */
$parameters= new Parameters;
$parameter = $parameters->getParameterMethod($controller, $method);
$controller->$method($parameter);