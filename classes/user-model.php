<?php

require_once "db.php";

class UserModel extends DB {

protected $table = "users";

public function getAllUsers() {
    return $this->getAllData($this->table);
}

}