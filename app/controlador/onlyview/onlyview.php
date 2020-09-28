<?php
 	class onlyview 
 	{
 		public function __construct()
 		{
 			$this->page = new page;
 			$this->campos = ["templatepath"=>"/app/visao/templates/cp2020/"];
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
 		public function lead()
 		{
 			$this->page->loadview("templates.cp2020.cadastrolead", $this->campos);
 		}
 	}
?>