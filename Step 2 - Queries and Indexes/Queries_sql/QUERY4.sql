select distinct eid,efirst ||'    '|| elast EMPLOYEE,EPHONE,
                su.sname ,SU.SPHONE,
                mo.odate 
from employee  natural join my_order mo  natural join supplier su  natural join supply
where  OID  not in (
                select oid
                from my_order 
                where quantity<>0)
and oid not in (
                select oid
                from my_order natural join equipment  natural join MY_REPORT
                where eqname not in (
                             select eqname 
                             from equipment 
                             where substr(eqname,1,1) <> 'A') 
                AND MY_REPORT.REPORTID not in (
                             select REPORTID 
                             from MY_REPORT,MY_ORDER 
                             where substr(REPORTID,1,-1) <> '3'))                                                           
order by eid,su.sname
