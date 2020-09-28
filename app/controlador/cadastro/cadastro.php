<?php
 	class cadastro 
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
 		public function siteeleitor()
 		{
 			print_r($_POST);
 			//Array ([rua] => sdfsdfsdf [numero] => As )
 			$sql = 'sp_add_eleitorsite("'.$_POST["nomeeleitor"].'", "'.$_POST["emaileleitor"].'", '.$_POST["estado"].', '.$_POST["cidade"].', "'.$_POST["bairro"].'", "'.$_POST["rua"].'", "'.$_POST["numero"].'")';
 			echo "<br>". $sql;

 		}
 	}
?>