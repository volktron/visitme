<?php    require_once("sqlfunctions.php");      $input = strtoupper($_GET['q']);    if (!$q) return;    $input =  mysql_real_escape_string($input);    $ajax_obj = new AutoSuggestQuery();    $sql = "SELECT * FROM airports a WHERE a.code = '".$input."'";    $ajax_obj->suggest($sql);    $sql = "SELECT * FROM airports a WHERE a.name like '".$input."%' AND a.code <> '".$input."'";    $ajax_obj->suggest($sql);    $sql = "SELECT * FROM airports a WHERE a.city like '".$input."%' AND a.code <> '".$input."' AND a.city <> a.name";    $ajax_obj->suggest($sql);   /***********************************************    *            AutoSuggestQuery Class    ***********************************************/    class AutoSuggestQuery    {        private $index;        public function  __construct() {            $this->index = 0;        }        public function suggest($sql)        {            $result = sql_result($sql);            $airport_list = array();            while($airport = sql_fetch_obj($result))            {                $airport_list[$this->index] = $airport->city.", ";                if($airport->country == "US")                {                    $airport_list[$this->index] = $airport_list[$this->index].$airport->state." - ".$airport->name." (".$airport->code.")";                }                else                {                    $sql = "SELECT * FROM country c WHERE c.code = '".$airport->country."'";                    $result = sql_result($sql);                    $country = sql_fetch_obj($result);                    $airport_list[$this->index] = $airport_list[$this->index].$country->name." - ".$airport->name." (".$airport->code.")";                }                $buff = $airport_list[$this->index];                echo "$buff\n";                $this->index++;            }        }    }?>