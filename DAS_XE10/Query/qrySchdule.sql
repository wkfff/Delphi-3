SELECT * FROM
(
	SELECT A.CUST_CODE, MAX(B.CUST_NAME) CUST_NAME,
	  MAX(A.CELL) CELL, MAX(A.CELL_RESTORE) CELL_RESTORE,
	  COUNT(*) TCNT,
          SUM(CASE WHEN C.ORDER_STAT = '15' THEN 1 ELSE 0 END) SCNT,
          MAX(A.U_ID) U_ID,
          SUM(CASE WHEN C.ORDER_STAT = '25' THEN 1 ELSE 0 END) XCNT
	FROM PD120 C, PM100 D, PD126 A, MT200 B
	WHERE C.ORDER_NO = D.ORDER_NO
	  AND C.ITEM_CODE = D.ITEM_CODE
	  AND C.ORDER_UNIT = D.ORDER_UNIT
	  AND C.ORDER_TYPE = D.ORDER_TYPE
	  AND C.ORDER_DT = A.ORDER_DT
	  AND D.CUST_CODE = A.CUST_CODE
	  AND A.CUST_CODE = B.CUST_CODE
	  AND A.ORDER_DT = '20160119-001' --:ORDER_DT
	GROUP BY A.CUST_CODE
) E
ORDER BY E.TCNT DESC, E.CELL_RESTORE


select * from PD120
where ORDER_DT = '20160119-001'