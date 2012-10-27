
m = 0
record_count = len(items)
group_count = 3 
array_size  = record_count / group_count
result = []

m=0
while m<group_count:
	n = 0
	sub_result = []
	while n<array_size:
		index = (m*array_size) + n 
		sub_result.append(items[index])
		n = n + 1
	result.append(sub_result)
	m = m +1

handled_total = group_count * array_size
remain = record_count - handled_total
if remain>0:
	i = 0
	while i<remain:
		result[i].append(items[handled_total + i])
		i = i + 1

i=0
while i<group_count:
	print 'group('+str(i)+'):'
	print result[i]
	i = i +1		
