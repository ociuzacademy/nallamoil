from django.shortcuts import render
from django.conf import settings
from django.conf.urls.static import static
from django.core.mail import send_mail
from django.template.loader import render_to_string
from django.http import HttpResponse, HttpResponseRedirect
from .models import*
# import datetime
from datetime import date
from datetime import datetime
from NALLAM.utils import render_to_pdf


# Create your views here.
def index(request):
    return render(request, 'index.html')


def about(request):
    return render(request, 'about.html')


def products(request):
    return render(request, 'products.html')


def register(request):
    if request.method == "POST":
        name = request.POST['name']
        address = request.POST['address']
        phone = request.POST['phone']
        email = request.POST['email']
        pswd = request.POST['pswd']
        aa = Tbl_User(name=name, address=address, phone=phone,
                      email=email, pswd=pswd, status='pending', user_type='user')
        aa.save()
        txt = """<script>alert('successfully registered..');window.location='/login/';</script>"""
        return HttpResponse(txt)
    else:
        return render(request, 'register.html')


def staff_reg(request):
    if request.method == "POST":
        name = request.POST['name']
        address = request.POST['address']
        phone = request.POST['phone']
        email = request.POST['email']
        pswd = request.POST['pswd']
        aa = Tbl_User(name=name, address=address, phone=phone,
                      email=email, pswd=pswd, status='pending', user_type='staff')
        aa.save()
        txt = """<script>alert('successfully registered..');window.location='/';</script>"""
        return HttpResponse(txt)
    else:
        return render(request, 'staff_reg.html')


def login(request):
    if request.method == "POST":
        email = request.POST["email"]
        password = request.POST["pswd"]
        chk = Tbl_User.objects.filter(
            email=email, pswd='admin', user_type="admin",name='admin')
        chk1 = Tbl_User.objects.filter(
            email=email, pswd=password, user_type="user",status='pending')
        chk2 = Tbl_User.objects.filter(
            email=email, pswd=password, user_type="staff", status='approved')
        if chk:
            for x in chk:
                request.session['id'] = x.id
            return render(request, 'Admin/admin_home.html')
        elif chk1:
            for x in chk1:
                request.session['id'] = x.id
            return render(request, 'User/user_home.html')
        elif chk2:
            for x in chk2:
                request.session['id'] = x.id
            return render(request, 'Staff/staff_home.html')
        else:
            return render(request, 'login.html', {'msg': 'Invalid login credentials.!'})
    else:
        return render(request, 'login.html')


def logout(request):
    if request.session.has_key('id'):
        del request.session['id']
        logout(request)
    return HttpResponseRedirect('/')
# -----------------------Admin-------------------------------


def admin_home(request):
    return render(request, 'Admin/admin_home.html')


def admin_userlist(request):
    var = Tbl_User.objects.all().filter(user_type='user')
    return render(request, 'Admin/admin_userlist.html', {'var': var})


def admin_add_product(request):
    if request.method == "POST":
        name = request.POST['name']
        img = request.FILES['img']
        qty = request.POST['qty']
        price = request.POST['price']
        discription = request.POST['discription']
        aa = Tbl_Product(discription=discription, name=name,
                         img=img, qty=qty, price=price, status='pending')
        aa.save()
        return HttpResponseRedirect('/admin_view_product/')
    else:
        return render(request, 'Admin/admin_add_product.html')


def admin_view_product(request):
    var = Tbl_Product.objects.all()
    return render(request, 'Admin/admin_view_product.html', {'var': var})


def admin_edit_product(request):
    if request.method == "POST":
        name = request.POST['name']
        qty = request.POST['qty']
        price = request.POST['price']
        discription = request.POST['discription']
        idd = request.POST['ii']
        aa = Tbl_Product.objects.all().filter(id=idd).update(
            name=name, qty=qty, price=price, discription=discription)
        return HttpResponseRedirect('/admin_view_product/')
    else:
        ii = request.GET['id']
        var = Tbl_Product.objects.all().filter(id=ii)
        return render(request, 'Admin/admin_edit_product.html', {'var': var, 'ii': ii})


def admin_stafflist(request):
    var = Tbl_User.objects.all().filter(user_type='staff', status='pending')
    var1 = Tbl_User.objects.all().filter(user_type='staff', status='approved')
    var2 = Tbl_User.objects.all().filter(user_type='staff', status='rejected')
    return render(request, 'Admin/admin_stafflist.html', {'var': var, 'var1': var1, 'var2': var2})


def admin_approve_staff(request):
    ii = request.GET['id']
    var = Tbl_User.objects.all().filter(id=ii).update(status='approved')
    return HttpResponseRedirect('/admin_stafflist/', {'var': var})


def admin_reject_staff(request):
    ii = request.GET['id']
    var = Tbl_User.objects.all().filter(id=ii).update(status='rejected')
    return HttpResponseRedirect('/admin_stafflist/', {'var': var})
# def admin_view_report(request):
# 	var=Tbl_Report.objects.all()
# 	return render(request,'Admin/admin_view_report.html',{'var':var})


def admin_view_complaint(request):
    var = Tbl_Complaint.objects.all().filter(status='pending')
    var1 = Tbl_Complaint.objects.all().filter(status='replied')
    return render(request, 'Admin/admin_view_complaint.html', {'var': var, 'var1': var1})


def admin_send_reply(request):
    if request.method == "POST":
        reply = request.POST['reply']
        idd = request.POST['ii']
        aa = Tbl_Complaint.objects.all().filter(
            id=idd).update(reply=reply, status='replied')
        return HttpResponseRedirect('/admin_view_complaint/')
    else:
        ii = request.GET['id']
        complaint = Tbl_Complaint.objects.all().filter(id=ii)
        return render(request, 'Admin/admin_send_reply.html', {'complaint': complaint, 'ii': ii})
# def admin_view_feedback(request):
# 	var=Tbl_Feedback.objects.all()
# 	return render(request,'Admin/admin_view_feedback.html',{'var':var})


def admin_view_orders(request):
    var = order_item_tb.objects.all().filter(packing_status='pending')
    var1 = order_item_tb.objects.all().filter(packing_status='picked')
    var2 = order_item_tb.objects.all().filter(
        packing_status='Cancelled Order', payment_status='paid')
    return render(request, 'Admin/admin_view_orders.html', {'var': var, 'var1': var1, 'var2': var2})


def admin_picked_order(request):
    ii = request.GET['id']
    var = order_item_tb.objects.all().filter(id=ii).update(packing_status='picked')
    return HttpResponseRedirect('/admin_view_orders/')


def admin_complete_order(request):
    ii = request.GET['id']
    var = order_item_tb.objects.all().filter(
        id=ii).update(packing_status='completed')
    return HttpResponseRedirect('/admin_view_orders/')


def admin_order_history(request):
    var = order_item_tb.objects.all().filter(packing_status='completed')
    var2 = order_item_tb.objects.all().filter(payment_status='Refunded')
    return render(request, 'Admin/admin_order_history.html', {'var': var, 'var2': var2})


def admin_product_review(request):
    var = Tbl_Review.objects.filter(status='pending')
    var1 = Tbl_Review.objects.filter(status='replied')
    return render(request, 'Admin/admin_product_review.html', {'var': var, 'var1': var1})



def admin_review_reply(request):
    if request.method == "POST":
        reply = request.POST['reply']
        idd = request.POST['ii']
        aa = Tbl_Review.objects.all().filter(id=idd).update(status='replied', reply=reply)
        return HttpResponseRedirect('/admin_product_review/')
    else:
        ii = request.GET['id']
        review = Tbl_Review.objects.all().filter(id=ii)
        return render(request, 'Admin/admin_review_reply.html', {'ii': ii, 'review': review})


def admin_delete_product(request):
    getid = request.GET['id']
    var = Tbl_Product.objects.all().filter(id=getid).delete()
    return HttpResponseRedirect('/admin_view_product/')


def admin_refund(request):
    ii = request.GET['id']
    var = order_item_tb.objects.all().filter(
        id=ii).update(payment_status='Refunded')
    return HttpResponseRedirect('/admin_view_orders/')

# -----------------------Staff-------------------------------


def staff_home(request):
    return render(request, 'Staff/staff_home.html')


def staff_profile(request):
    myid = request.session['id']
    var = Tbl_User.objects.all().filter(id=myid)
    return render(request, 'Staff/staff_profile.html', {'var': var})


def staff_edit_profile(request):
    myid = request.session['id']
    var = Tbl_User.objects.all().filter(id=myid)
    if request.method == "POST":
        name = request.POST['name']
        address = request.POST['address']
        phone = request.POST['phone']
        email = request.POST['email']
        pswd = request.POST['pswd']
        aa = Tbl_User.objects.all().filter(id=myid).update(
            name=name, address=address, phone=phone, email=email, pswd=pswd)
        return HttpResponseRedirect('/staff_profile/')
    else:
        return render(request, 'Staff/staff_edit_profile.html', {'var': var})
# def staff_add_report(request):
# 	myid=request.session['id']
# 	if request.method=="POST":
# 		time=request.POST['time']
# 		sub=request.POST['sub']
# 		work=request.POST['work']
# 		date=datetime.datetime.now()
# 		uid=Tbl_User.objects.get(id=myid)
# 		aa=Tbl_Report(user_id=uid,time=time,sub=sub,work=work,date=date,status='pending')
# 		aa.save()
# 		return render(request,'Staff/staff_add_report.html')
# 	else:
# 		return render(request,'Staff/staff_add_report.html')


def staff_view_report(request):
    myid = request.session['id']
    order = order_item_tb.objects.all()
    return render(request, 'Staff/staff_view_report.html', {'order': order})
from datetime import datetime
# ...existing code...

def staff_complaint(request):
    myid = request.session['id']
    if request.method == "POST":
        sub = request.POST['sub']
        complaint = request.POST['complaint']
        date = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        uid = Tbl_User.objects.get(id=myid)
        aa = Tbl_Complaint(user_id=uid, sub=sub,
                           complaint=complaint, date=date, status='pending')
        aa.save()
        return render(request, 'Staff/staff_complaint.html')
    else:
        return render(request, 'Staff/staff_complaint.html')

def staff_view_complaint(request):
    myid = request.session['id']
    var = Tbl_Complaint.objects.all().filter(user_id=myid)
    return render(request, 'Staff/staff_view_complaint.html', {'var': var})
# -----------------------User-------------------------------


def user_home(request):
    return render(request, 'User/user_home.html')


def user_profile(request):
    myid = request.session['id']
    var = Tbl_User.objects.all().filter(id=myid)
    return render(request, 'User/user_profile.html', {'var': var})


def user_edit_profile(request):
    myid = request.session['id']
    var = Tbl_User.objects.all().filter(id=myid)
    if request.method == "POST":
        name = request.POST['name']
        address = request.POST['address']
        phone = request.POST['phone']
        email = request.POST['email']
        pswd = request.POST['pswd']
        aa = Tbl_User.objects.all().filter(id=myid).update(
            name=name, address=address, phone=phone, email=email, pswd=pswd)
        return HttpResponseRedirect('/user_profile/')
    else:
        return render(request, 'User/user_edit_profile.html', {'var': var})


def user_products(request):
    var = Tbl_Product.objects.all()
    return render(request, 'User/user_products.html', {'var': var})
# def user_feedback(request):
# 	myid=request.session['id']
# 	if request.method=="POST":
# 		feedback=request.POST['feedback']
# 		date=datetime.datetime.now()
# 		uid=Tbl_User.objects.get(id=myid)
# 		aa=Tbl_Feedback(user_id=uid,feedback=feedback,date=date)
# 		aa.save()
# 		return render(request,'User/user_feedback.html')
# 	else:
# 		return render(request,'User/user_feedback.html')


def user_product_details(request):
    myid = request.session['id']
    if request.method == "POST":
        review = request.POST['review']
        idd = request.POST['ii']
        pid = Tbl_Product.objects.get(id=idd)
        uid = Tbl_User.objects.get(id=myid)
        aa = Tbl_Review(review=review, product_id=pid, user_id=uid)
        aa.save()
        # return render(request,'User/user_product_details.html')
        return HttpResponseRedirect('/user_products/')
    else:
        ii = request.GET['id']
        var = Tbl_Product.objects.all().filter(id=ii)
        rev = Tbl_Review.objects.all().filter(product_id=ii)
        return render(request, 'User/user_product_details.html', {'var': var, 'ii': ii, 'rev': rev})


def product_detail_view(request):
    ii = request.GET['id']
    var = Tbl_Product.objects.all().filter(id=ii)
    return render(request, 'User/product_detail_view.html', {'var': var})


def add_to_cart(request):
    if request.session.has_key('id'):
        aa = request.GET['id']
        print(aa)
        pid = Tbl_Product.objects.get(id=aa)
        ii = request.session['id']
        uid = Tbl_User.objects.get(id=ii)
        quantity = request.GET["number"]
        print(quantity)
        aq = int(pid.qty)
        qu = int(quantity)
        if(aq < qu):
            return render(request, 'User/product_detail_view.html', {'error': "Requested Quantity is Not Available"})
        else:
            proprice = (pid.price)
            total = int(proprice)*int(quantity)
            var = Tbl_Cart(user_id=uid, product_id=pid,
                           quantity=quantity, total=total, status="unpaid")
            print("-----", var)
            var.save()
            return HttpResponseRedirect('/user_products/')
    else:
        return render(request, 'login.html')


def payment(request):
    if request.session.has_key('id'):
        if request.method == "POST":
            cardname = request.POST['cardname']
            cardnumber = request.POST['cardnumber']
            carddate = request.POST['carddate']
            cardcvv = request.POST['cardcvv']
            var = tb_payment.objects.last().id
            print(var)
            tb_payment.objects.all().filter(id=var).update(card_name=cardname, card_number=cardnumber,
                                                           card_cvv=cardcvv, card_expdate=carddate, pay_status='paid')
            return HttpResponseRedirect('/user_products/')
        else:
            ii = request.session["id"]
            user = Tbl_User.objects.all().filter(id=ii)

            # amount=request.POST["subtotal"]
            # print("_____________",amount)
            return render(request, 'User/user_payment.html', {'db': user})
    else:
        return render(request, 'login.html')


def cart(request):
    if request.session.has_key('id'):
        ii = request.session["id"]
        tid = Tbl_Cart.objects.all().filter(user_id=ii, status="unpaid")
        print("_____________________________", tid)
        sum1 = 0
        for x in tid:
            a = x.total
            sum1 = sum1+int(a)
            print(sum1)
        return render(request, 'User/user_cart.html', {'tid': tid, 'sum': sum1})
    else:
        return render(request, 'login.html')


def delete_cart(request):
    if request.session.has_key('id'):
        uu = request.session["id"]
        ii = request.GET["id"]
        print("--------ii=====", ii)
        tid = Tbl_Cart.objects.all().filter(id=ii, user_id=uu)
        print("------------------------tid----------------", tid)
        tid.delete()
        return HttpResponseRedirect('/cart/')
    else:
        return render(request, 'login.html')


def cart_product_payment(request):
    if request.session.has_key('id'):
        if request.method == "POST":
            ii = request.session["id"]
            proid = Tbl_Cart.objects.all().filter(user_id=ii, status="unpaid")
            print("--------session---", ii)
            uid = Tbl_User.objects.get(id=ii)
            amount = request.POST["subtotal"]
            print("--------amount---", amount)
            current_date = date.today()
            now = datetime.now()
            current_time = now.strftime("%H:%M:%S")
            arr = []
            arr1 = []
            arr2 = []
            for x in proid:
                arr.append(x.product_id.id)
                arr1.append(x.id)
                # arr2.append(x.seller_id.id)
            a = order_tb(cart_id=arr1, user_id=uid, product_id=arr, payment=amount,
                         date=current_date, time=current_time, payment_status="paid", status="pending")
            a.save()
            # bbb=tb_payment(user_id=uid,product_id=arr,total_amt=amount,date=current_date)
            # bbb.save()
            print(arr)
            arr.pop()
            var = order_tb.objects.latest("id")
            print("_--------------------------", var)
            for x in proid:
                b = x.product_id.id

                d = x.id
                p = x.product_id.price
                pp = int(p)
                pid = Tbl_Product.objects.get(id=b)
                # unid=Tbl_user.objects.get(id=c)
                cid = Tbl_Cart.objects.get(id=d)

                c = order_item_tb(cart_id=cid, order_id=var, user_id=uid, product_id=pid, total=amount,
                                  date=current_date, time=current_time, payment_status="paid", packing_status="pending")
                c.save()
                pay = tb_payment(order_id=var, user_id=uid, product_id=pid,
                                 total_amt=amount, date=current_date).save()

            proid = Tbl_Cart.objects.all().filter(user_id=ii).update(status="paid")
            return HttpResponseRedirect('/payment/')
    else:
        return render(request, 'login.html')


def user_orders(request):
    ii = request.session['id']
    var = order_item_tb.objects.all().filter(user_id=ii, packing_status='pending')
    var1 = order_item_tb.objects.all().filter(user_id=ii, packing_status='picked')
    var2 = order_item_tb.objects.all().filter(
        user_id=ii, packing_status='completed')
    var3 = order_item_tb.objects.all().filter(
        user_id=ii, packing_status='Cancelled Order')
    # var=var1&var2
    return render(request, 'User/user_all_orders.html', {'var': var, 'var1': var1, 'var2': var2, 'var3': var3})


def user_order_history(request):
    ii = request.session['id']
    var = order_item_tb.objects.all().filter(
        user_id=ii, packing_status='completed')
    return render(request, 'User/user_order_history.html', {'var': var})


def user_cancel_order(request):
    ii = request.GET['id']
    var = order_item_tb.objects.all().filter(
        id=ii).update(packing_status='Cancelled Order')
    return HttpResponseRedirect('/user_orders/')


def download_as_pdf(request):
    ii = request.GET['id']
    print("ttttttttttttttt ii tttttttttt", ii)
    var = order_item_tb.objects.all().filter(id=ii)
    pdf = render_to_pdf('User/pdf.html', {'var': var})
    response = HttpResponse(pdf, content_type="application/pdf")
    response['Content-Disposition'] = 'attachment; filename=NALLAMBill.pdf'
    return response
