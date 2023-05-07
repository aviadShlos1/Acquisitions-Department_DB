select efirst,elast,eid,eqid
from employee  natural join my_order  natural join equipment 
where  eqid  in (
            select eqid
            from equipment natural join supply natural join my_order
            group by eqid
            having count(*) =
                    (select max(count_orders) as max_order
                    from(
                            select eqid,count(*) as count_orders
                            from equipment natural join supply natural join my_order
                            group by eqid)
                            )
and  efirst not in (select efirst from employee where length(efirst)>10)
and  elast not in (select elast from employee where length(elast)>10))
