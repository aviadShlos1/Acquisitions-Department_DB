select equipmentID_, equipmentNAME
from HGOREN.EQUIPMENT
WHERE  equipmentID_ NOT IN (SELECT EQID
                             FROM LOGISTIC)
AND  equipmentID_ NOT IN (SELECT EQID
                             FROM TECHNOLOGY)
