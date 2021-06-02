<?php

if ($_SERVER['CONTENT_TYPE'] == 'application/json'){
	$_REQUEST = @json_decode(file_get_contents('php://input'), true);
}

$param3 = $_REQUEST['param3'];
echo "POST is $param3";

?>
