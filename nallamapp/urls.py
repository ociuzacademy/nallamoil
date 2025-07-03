from django.contrib import admin
from django.urls import path
from .import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    # path('admin/', admin.site.urls),
    path('',views.index),
    path('about/',views.about),
    path('products/',views.products),
    path('register/',views.register),
    path('staff_reg/',views.staff_reg),
    path('login/',views.login),
    path('logout/',views.logout),

    #Admin
    path('admin_home/',views.admin_home),
    path('admin_userlist/',views.admin_userlist),
    path('admin_add_product/',views.admin_add_product),
    path('admin_view_product/',views.admin_view_product),
    path('admin_edit_product/',views.admin_edit_product),
    path('admin_stafflist/',views.admin_stafflist),
    path('admin_approve_staff/',views.admin_approve_staff),
    path('admin_reject_staff/',views.admin_reject_staff),
    # path('admin_view_report/',views.admin_view_report),
    path('admin_view_complaint/',views.admin_view_complaint),
    path('admin_send_reply/',views.admin_send_reply),
    # path('admin_view_feedback/',views.admin_view_feedback),
    path('admin_view_orders/',views.admin_view_orders),
    path('admin_picked_order/',views.admin_picked_order),
    path('admin_complete_order/',views.admin_complete_order),
    path('admin_order_history/',views.admin_order_history),
    path('admin_product_review/',views.admin_product_review),
    path('admin_review_reply/',views.admin_review_reply),
    path('admin_delete_product/',views.admin_delete_product),
    path('admin_refund/',views.admin_refund),
    
    
    
    #Staff
    path('staff_home/',views.staff_home),
    path('staff_profile/',views.staff_profile),
    path('staff_edit_profile/',views.staff_edit_profile),
    # path('staff_add_report/',views.staff_add_report),
    path('staff_view_report/',views.staff_view_report),
    path('staff_complaint/',views.staff_complaint),
    path('staff_view_complaint/',views.staff_view_complaint),

    #User
    path('user_home/',views.user_home),
    path('user_profile/',views.user_profile),
    path('user_edit_profile/',views.user_edit_profile),
    path('user_products/',views.user_products),
    # path('user_feedback/',views.user_feedback),
    path('user_product_details/',views.user_product_details),
    path('product_detail_view/',views.product_detail_view),
    path('add_to_cart/',views.add_to_cart),
    path('payment/',views.payment),
    path('cart/',views.cart),
    path('delete_cart/',views.delete_cart),
    path('cart_product_payment/',views.cart_product_payment),
    path('user_orders/',views.user_orders),
    path('user_order_history/',views.user_order_history),
    path('download_as_pdf/',views.download_as_pdf),
    path('user_cancel_order/',views.user_cancel_order),

    
    # path('user_reviews/',views.user_reviews),


  

]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
    urlpatterns += static(settings.STATIC_URL,document_root=settings.STATIC_ROOT)