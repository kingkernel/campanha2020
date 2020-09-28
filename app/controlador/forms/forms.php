<?php
	class forms 
	{
		public function __construct()
		{
			$this->page = new page;
			$this->change = ["templatepath"=>"/app/visao/templates/cp2020/"];
			return $this;
		}
		public function cadeleitor()
		{
			$sql = "call sp_selall_estados()";
			$query = queryDb($sql);
			$estados="";
				while ($dados = $query->fetch(PDO::FETCH_ASSOC)){
					$estados .= "<option value=".$dados["id"].">".$dados["estado"]."</option>";
				};
			$this->change["estados"] = $estados;
			$this->page->loadview("templates.cp2020.forms.cad_eleitorsite", $this->change);
		}
	}
?>