<?php 
// DB credentials.
define('DB_HOST','localhost');
define('DB_USER','root');
define('DB_PASS','Malawi2017');
define('DB_NAME','elms');
// Establish database connection.
try
{
$dbh = new PDO("mysql:host=".DB_HOST.";dbname=".DB_NAME,DB_USER, DB_PASS,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
}
catch (PDOException $e)
{
exit("Error: " . $e->getMessage());
}



function changeForm(){
	if(isset($_GET['goto'])){
		
		if($_GET['goto']=='admin'){
			echo ADMIN_LOGIN;
		}else{
			echo EMPLOYEE_LOGIN;
		}
	}
}


?>