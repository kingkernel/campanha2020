<?php
	class login
	{
		public function __construct()
		{
			$this->page = new page;
			return $this;
		}
		public function index()
		{
			$subst = ["nome" => "Daniels", "cssbootstrap" =>'<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">', "formpath" => 'action="/auth/" method="post"', "templatepath"=>"/app/visao/templates/cp2020/"];
			$this->page->loadview("templates.cp2020.login", $subst);
		}
	}
?>