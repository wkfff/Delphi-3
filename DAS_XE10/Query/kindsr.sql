SELECT TOP 10 A.ORDER_DT, B.ORDER_STAT
  FROM PD126 A, PD120 B
 WHERE A.ORDER_DT=B.ORDER_DT
   AND B.ORDER_STAT='13'
GROUP BY  A.ORDER_DT, B.ORDER_STAT
ORDER BY A.ORDER_DT DESC


SELECT COUNT(*) FROM PD120
WHERE ORDER_STAT = '13'


SELECT H.ORDER_DT, H.ITEM_CODE, MAX(H.ITEM_NAME) ITEM_NAME, H.ORDER_UNIT,
  SUM(H.PICK_QTY) PICK_QTY, MAX(H.CATNO) CATNO,
  CASE WHEN (CHARINDEX(' ',UPPER(MAX(H.KAN_CODE))))>0 THEN H.ITEM_CODE
  ELSE 
  UPPER(MAX(H.KAN_CODE))
  END KAN_CODE
FROM (
  SELECT A.*, B.CUST_CODE, B1.KAN_CODE, B1.ITEM_NAME, B1.CATNO
  FROM PD120 A, PM100 B, MT300 B1
  WHERE A.ITEM_CODE=B1.ITEM_CODE
    --AND A.ORDER_DT = :ORDER_DT
    AND A.ORDER_DT = '20160118-003'
    AND A.ORDER_STAT = '13'
    AND A.ORDER_TYPE = B.ORDER_TYPE
    AND A.ORDER_NO = B.ORDER_NO
    AND A.ITEM_CODE = B.ITEM_CODE
    AND A.ORDER_UNIT = B.ORDER_UNIT
    AND A.ITEM_CODE = B1.ITEM_CODE
) H
GROUP BY H.ORDER_DT, H.ITEM_CODE, H.ORDER_UNIT
ORDER BY CATNO


select * from PD126
where ORDER_DT like '2016%'
order by ORDER_DT desc