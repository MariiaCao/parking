<?php

class ConnectionModel {

	private $connection;
	private $host = 'localhost';
	private $dbname = 'parking';
	private $user = 'root';
	private $password = '';

	public function __construct() {
       try {
		//$this->connection = new PDO("mysql:host=localhost;dbname=parking","root","");
		$this->connection = new PDO("mysql:host=".$this->host.";dbname=".$this->dbname,$this->user,$this->password);

		$this->connection->exec("set names utf8");

	   } catch (PDOException $e) {
	
		die("Error de conexión: " . $e->getMessage());
		
	   }
    }

	public function insert($table, $params) {
		try {
			$fields = array_keys($params);
			$values = [];
			for ($i = 0; $i <= count($fields); $i++) { 
				$values[] = ':'.$fields[$i];
			}
			$sql = 'INSERT INTO '. $table .' ('.implode(',',$fields).') VALUES ('.implode(',',$values).')';
			$stmt = $this->connection->prepare($sql);
			foreach ($params as $key => $value) {
				$stmt->bindParam(':'.$key, $value, PDO::PARAM_STR | PDO::PARAM_INT);
			}
			$stmt->execute();
		}catch(PDOException $e){
			echo 'Error: ' . $e->getMessage();
		}
		
	}

	


}