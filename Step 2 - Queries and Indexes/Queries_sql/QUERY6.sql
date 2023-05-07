
select EFIRST,ELAST,EID,EPHONE 
from employee
where eid not in (select eid 
                 from employee
                 where length(efirst)>7
                 union
                 select EID
                 from employee
                 where substr(elast,1,1) <> substr(efirst,1,1) )
ORDER BY EFIRST,ELAST

                        

      
