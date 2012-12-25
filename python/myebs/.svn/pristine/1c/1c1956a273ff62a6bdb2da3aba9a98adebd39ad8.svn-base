update trans_data as d,
(select  a.stock_code, a.qty_1, b.qty_2, b.qty_2-a.qty_1 as qty_offset, (b.qty_2-a.qty_1)/a.qty_1 as qty_ratio from
(select stock_code, qty as qty_1 from trans_data 
	where seq = 4 
) as a,
(select stock_code, qty as qty_2 from trans_data 
	where seq = 3
) as b
where a.stock_code = b.stock_code
) as c
set d.qty_offset = c.qty_offset, d.qty_ratio = c.qty_ratio
where d.seq =4  and d.stock_code = c.stock_code 
