<?php

class Book{
    private string $title;
    private int $year;
    private int $author_id;

    public function __construct($title, $year, $author_id)
    {
        $this->title = $title;   
        $this->year = $year;   
        $this->author_id = $author_id;   
    }

    public function getTitle(){
        return $this->title;
    }

    public function getYear(){
        return $this->year;
    }

    public function getAuthor() {
        return $this->author_id;
    }
}