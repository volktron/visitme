<?php
/*
Copyright 2010 GoPandas
This file is part of VisitME.

VisitME is free software: you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation, either version 3 of the License, or (at your
option) any later version.

VisitME is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
for more details.

You should have received a copy of the GNU General Public License
along with VisitME. If not, see http://www.gnu.org/licenses/.
*/
    require_once("includes/sqlfunctions.php");

    class DB_SETUP
    {
        public function  __construct()
        {
            $this->drop_tables();
            $this->create_n_populate_tables();

        }

        private function drop_tables()
        {
            $sql = null;
            $result  = null;
            echo "Dropping \"states\", \"country\", and \"airports\" tables if they exist...<br /><br />";
            // Clean up existing tables with same names if they exist...
            $sql = "DROP TABLE IF EXISTS states";
            $result = sql_result($sql);
            $sql = "DROP TABLE IF EXISTS country";
            $result = sql_result($sql);
            $sql = "DROP TABLE IF EXISTS airports";
            $result = sql_result($sql);
        }

        private function create_n_populate_tables()
        {
            $sql = null;
            $result  = null;

            // Create states table
            $sql = "CREATE TABLE states (STATE varchar(36), CODE varchar(2))";
            $result = sql_result($sql);
            echo "\"states\" table is created...<br />";

            // Populate states table
            $sql = "LOAD DATA
                    LOCAL INFILE 'database/states.csv'
                    INTO TABLE states
                    FIELDS TERMINATED BY \",\" OPTIONALLY ENCLOSED BY '\"'
                    LINES TERMINATED BY '\r\n'
                    IGNORE 1 LINES";
            $result = sql_result($sql);
            echo "\"states\" table is populated...<br />";

            // Create country table
            $sql = "CREATE TABLE country (CODE varchar(3), NAME varchar(25))";
            $result = sql_result($sql);
            echo "\"country\" table is created...<br />";

            // Populate country table
            $sql = "LOAD DATA
                    LOCAL INFILE 'database/country.csv'
                    INTO TABLE country
                    FIELDS TERMINATED BY \",\" OPTIONALLY ENCLOSED BY '\"'
                    LINES TERMINATED BY '\r\n'
                    IGNORE 1 LINES";
            $result = sql_result($sql);
            echo "\"country\" table is populated...<br />";

            // Create airports table
            $sql = "CREATE TABLE airports (CODE varchar(3), NAME varchar(32), CITY varchar(32), STATE varchar(2), COUNTRY varchar(2), X float, Y float)";
            $result = sql_result($sql);
            echo "\"airports\" table is created...<br />";

            // Populate airports table
            $sql = "LOAD DATA
                    LOCAL INFILE 'database/airports.csv'
                    INTO TABLE airports
                    FIELDS TERMINATED BY \",\" OPTIONALLY ENCLOSED BY '\"'
                    LINES TERMINATED BY '\r\n'
                    IGNORE 1 LINES";
            $result = sql_result($sql);
            echo "\"airports\" table is populated...<br /><br />";
        }
    }
    
?>
