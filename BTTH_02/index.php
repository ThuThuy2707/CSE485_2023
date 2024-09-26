<?php
require_once('config/database.php');

$controller = ucfirst(isset($_GET['controller'])? $_GET['controller']:'home').'Controller';
$action = isset($_GET['action'])? $_GET['action']:'index';

$controllerPath = 'controllers/'.$controller.'.php';

//nếu không tồn tại tệp trong thư mục controller thì dừng và đưa ra thông báo.
if(!file_exists($controllerPath)){
    die('Tệp tin không tồn tại');
}

//nếu có tồn tại tệp trong controller
require_once($controllerPath);

//khởi tạo ra đối tượng controller và gọi đến phương thức tương ứng với giá trị của acction
$myObj = new $controller();
$myObj->$action();
?>
