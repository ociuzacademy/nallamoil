from django.db import models

# Create your models here.
class Tbl_User(models.Model):
	name=models.CharField(max_length=100,default='')
	address=models.CharField(max_length=100,default='')
	phone=models.CharField(max_length=100,default='')
	email=models.CharField(max_length=100,default='')
	pswd=models.CharField(max_length=100,default='')
	status=models.CharField(max_length=100,default='')
	user_type=models.CharField(max_length=100,default='')

class Tbl_Product(models.Model):
	img=models.ImageField(upload_to='pic/',default='')
	name=models.CharField(max_length=100,default='')
	discription=models.CharField(max_length=100,default='')
	qty=models.CharField(max_length=100,default='')
	price=models.CharField(max_length=100,default='')
	status=models.CharField(max_length=100,default='')

class Tbl_Review(models.Model):
	product_id=models.ForeignKey(Tbl_Product,on_delete=models.CASCADE, blank=True,null=True)
	user_id=models.ForeignKey(Tbl_User,on_delete=models.CASCADE, blank=True,null=True)
	review=models.CharField(max_length=100,default='')
	reply=models.CharField(max_length=100,default='')
	status=models.CharField(max_length=100,default='pending')

# class Tbl_Report(models.Model):
# 	user_id=models.ForeignKey(Tbl_User,on_delete=models.CASCADE, blank=True,null=True)
# 	time=models.CharField(max_length=100,default='')
# 	work=models.CharField(max_length=100,default='')
# 	sub=models.CharField(max_length=100,default='')
# 	date=models.CharField(max_length=100,default='')
# 	status=models.CharField(max_length=100,default='')

class Tbl_Complaint(models.Model):
	user_id=models.ForeignKey(Tbl_User,on_delete=models.CASCADE, blank=True,null=True)
	date=models.CharField(max_length=100,default='')
	sub=models.CharField(max_length=100,default='')
	complaint=models.CharField(max_length=100,default='')
	status=models.CharField(max_length=100,default='')
	reply=models.CharField(max_length=100,default='')

# class Tbl_Feedback(models.Model):
# 	user_id=models.ForeignKey(Tbl_User,on_delete=models.CASCADE, blank=True,null=True)
# 	date=models.CharField(max_length=100,default='')
# 	feedback=models.CharField(max_length=100,default='')

class Tbl_Cart(models.Model):
	user_id=models.ForeignKey(Tbl_User,on_delete=models.CASCADE,default='')
	product_id=models.ForeignKey(Tbl_Product,on_delete=models.CASCADE,default='')
	quantity=models.CharField(max_length=30,default='')
	total=models.CharField(max_length=30,default='')
	status=models.CharField(max_length=10,default='0')

class order_tb(models.Model):
	user_id=models.ForeignKey(Tbl_User,on_delete=models.CASCADE)
	product_id=models.CharField(max_length=30,default='')
	payment=models.CharField(max_length=30,default='')
	date=models.CharField(max_length=100,default='')
	time=models.CharField(max_length=100,default='')
	total=models.CharField(max_length=30,default='')
	payment_status=models.CharField(max_length=30,default='')
	status=models.CharField(max_length=30,default='')
	cart_id=models.CharField(max_length=30,default='')
	
	
class order_item_tb(models.Model):
	order_id=models.ForeignKey(order_tb,on_delete=models.CASCADE)
	user_id=models.ForeignKey(Tbl_User,on_delete=models.CASCADE)
	product_id=models.ForeignKey(Tbl_Product,on_delete=models.CASCADE)
	cart_id=models.ForeignKey(Tbl_Cart,on_delete=models.CASCADE)
	total=models.CharField(max_length=30,default='')
	date=models.CharField(max_length=100,default='')
	time=models.CharField(max_length=100,default='')
	payment_status=models.CharField(max_length=30,default='')
	packing_status=models.CharField(max_length=30,default='')

class tb_payment(models.Model):
	order_id=models.ForeignKey(order_tb,on_delete=models.CASCADE)
	user_id=models.ForeignKey(Tbl_User,on_delete=models.CASCADE)
	product_id=models.ForeignKey(Tbl_Product,on_delete=models.CASCADE)
	date=models.CharField(max_length=100,default='')
	total_amt=models.CharField(max_length=100,default='')
	card_name=models.CharField(max_length=100,default='')
	card_number=models.CharField(max_length=100,default='')
	card_cvv=models.CharField(max_length=100,default='')
	card_expdate=models.CharField(max_length=100,default='')
	pay_status=models.CharField(max_length=100,default='')



