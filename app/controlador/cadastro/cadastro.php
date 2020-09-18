<?php
 	class cadastro 
 	{
 		public function __construct()
 		{
 			$this->page = new page;
 			return $this;
 		}
 		public function index()
 		{
 			$this->page->loadview("");
 		}
 		public function eleitor()
 		{
 			echo "form cadastro de eleitor";
 		}
 	}
?>