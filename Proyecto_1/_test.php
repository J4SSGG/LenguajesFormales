while($ROW = MYSQL_FETCH_ASSOC($RECORDSETNAME)) { 
 if($ROW['FIELDNAME'] != '') { 
 echo '<LI><A HREF="#">CONTENT GOES HERE</A></LI>'; 
 } 
}