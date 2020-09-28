<?php
class ajax {
	public function __construct(){

	}
	public function loadTableCalled(){
  	
  	$panel_0 = new rowAlert;
    $panel_0->colSize = "md-12";
    $panel_0->class = "alert alert-warning";
    $panel_0->titleSize = "3";
    $panel_0->alertTitle = 'Chamados Abertos <span class="glyphicon glyphicon-tasks"></span>';
    $table = new table;
    $headers = ["Usuário", "Problema", "Estatus"];
    $table->headers($headers);
    $sql = queryDb("call sp_sel_teccalled()");
    $arrayRow = [];
    while ($query = $sql->fetch(PDO::FETCH_ASSOC)) {
      if($query["estatus"] == "Aberto"){$class = "warning";} else {$class = "success";};
        array_push($arrayRow, '<tr><td>'.$query["nameperson"].'</td><td>'.$query["prob"].'</td><td><span class="label label-'.$class.'">'.$query["estatus"].'</span></td></tr>');
      };
    $table->rows($arrayRow);
    
    $panel_0->alertText = $table->html();
    echo $panel_0->html();
	}
  public function frase()
  {
    if ($_POST["nome"]=="daniels"){
      echo "criador";
    } else {
      echo "ola mundo!";
    }
  }
  public function loadcidadeinput()
  {
    $st = $_POST["st"]; 
    $sql = "call sp_sel_cidade(".$st.")";
    $query = queryDb($sql);
    while ($dados = $query->fetch(PDO::FETCH_ASSOC))
      {
        echo "<option value=".$dados["id"].">".$dados["cidade"]."</option>";
      }
  }
  public function loadbairroinput()
  {
    $brr = $_POST["brr"]; 
    $sql = "call sp_sel_bairro(".$st.")";
    $query = queryDb($sql);
    while ($dados = $query->fetch(PDO::FETCH_ASSOC))
      {
        echo "<option value=".$dados["id"].">".$dados["cidade"]."</option>";
      }
  }
}
?>