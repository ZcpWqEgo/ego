<#assign ctx=request.contextPath/>
<#include "date.ftl">
<#setting datetime_format="yyyy-MM-dd"/>
<html><head>
    <meta charset="UTF-8">
    <title>ego管理后台</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Bootstrap 3.3.4 -->
    <link href="${ctx}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <!-- FontAwesome 4.3.0 -->
 	<link href="${ctx}/static/bootstrap/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Ionicons 2.0.0 -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="${ctx}/static/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
    	folder instead of downloading all of them to reduce the load. -->
    <link href="${ctx}/static/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css">
    <!-- iCheck -->
    <link href="${ctx}/static/plugins/iCheck/flat/blue.css" rel="stylesheet" type="text/css">
    <!-- jQuery 2.1.4 -->
<#--    <script src="${ctx}/static/plugins/jQuery/jQuery-2.1.4.min.js"></script>-->
    <script src="${ctx}/static/js/jquery-3.5.1.min.js"></script>
	<script src="${ctx}/static/js/global.js"></script>
    <script src="${ctx}/static/js/myFormValidate.js"></script>
    <script src="${ctx}/static/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/js/layer/layer-min.js"></script>
    <link rel="stylesheet" href="${ctx}/static/js/layer/skin/layer.css" id="layui_layer_skinlayercss" style=""><!-- 弹窗js 参考文档 http://layer.layui.com/-->
    <script src="${ctx}/static/js/myAjax.js"></script>
    <script type="text/javascript">
    function delfunc(obj){
    	layer.confirm('确认删除？', {
    		  btn: ['确定','取消'] //按钮
    		}, function(){
   				$.ajax({
   					type : 'post',
   					url : $(obj).attr('data-url'),
   					data : {act:'del',del_id:$(obj).attr('data-id')},
   					dataType : 'json',
   					success : function(data){
   						if(data==1){
   							layer.msg('操作成功', {icon: 1});
   							$(obj).parent().parent().remove();
   						}else{
   							layer.msg(data, {icon: 2,time: 2000});
   						}
   						layer.closeAll();
   					}
   				})
    		}, function(index){
    			layer.close(index);
    			return false;// 取消
    		}
    	);
    }
    
    //全选
    function selectAll(name,obj){
    	$('input[name*='+name+']').prop('checked', $(obj).checked);
    }   
    
    function get_help(obj){
        layer.open({
            type: 2,
            title: '帮助手册',
            shadeClose: true,
            shade: 0.3,
            area: ['90%', '90%'],
            content: $(obj).attr('data-url'), 
        });
    }
    
    function delAll(obj,name){
    	var a = [];
    	$('input[name*='+name+']').each(function(i,o){
    		if($(o).is(':checked')){
    			a.push($(o).val());
    		}
    	})
    	if(a.length == 0){
    		layer.alert('请选择删除项', {icon: 2});
    		return;
    	}
    	layer.confirm('确认删除？', {btn: ['确定','取消'] }, function(){
    			$.ajax({
    				type : 'get',
    				url : $(obj).attr('data-url'),
    				data : {act:'del',del_id:a},
    				dataType : 'json',
    				success : function(data){
    					if(data == 1){
    						layer.msg('操作成功', {icon: 1});
    						$('input[name*='+name+']').each(function(i,o){
    							if($(o).is(':checked')){
    								$(o).parent().parent().remove();
    							}
    						})
    					}else{
    						layer.msg(data, {icon: 2,time: 2000});
    					}
    					layer.closeAll();
    				}
    			})
    		}, function(index){
    			layer.close(index);
    			return false;// 取消
    		}
    	);	
    }

    </script>        
  <meta name="__hash__" content="caf85ed63fd21bb70fe7f536bb1b3b50_3f0196329b9e9c21b80f4c440426a7eb"></head>
  <body style="background-color:#ecf0f5;">
 

<div class="wrapper">

    <div class="breadcrumbs" id="breadcrumbs">
	<ol class="breadcrumb">
	<li><a href="javascript:void();"><i class="fa fa-home"></i>&nbsp;&nbsp;后台首页</a></li>
	        
	        <li><a href="javascript:void();">优惠券管理</a></li>    
	        <li><a href="javascript:void();">优惠券列表</a></li>          
	</ol>
</div>

    <section class="content">
        <div class="row">
        	<div class="col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-list"></i> 优惠券列表</h3>
                </div>
                <div class="panel-body">
	                <div class="navbar navbar-default">
	                	<form class="navbar-form form-inline" action="" method="post">
                        <!--
				            <div class="form-group">
				              	<input type="text" class="form-control" placeholder="搜索">
				            </div>
				            <button type="submit" class="btn btn-default">提交</button>
                         -->   
				            <div class="form-group pull-right">
					            <a href="coupon-add.ftl" class="btn btn-primary pull-right"><i class="fa fa-plus"></i>添加优惠券</a>
				            </div>		          
			          <input name="__hash__" value="caf85ed63fd21bb70fe7f536bb1b3b50_3f0196329b9e9c21b80f4c440426a7eb" type="hidden"></form>
	                </div>
                    <div id="ajax_return">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <td style="width: 1px;" class="text-center"><input onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" type="checkbox"></td>
                                    <td class="text-center">优惠券名称</td>
                                    <td class="text-center">优惠券类型</td>
                                    <td class="text-center">面额</td>
                                    <td class="text-center">使用需满金额</td>
                                    <td class="text-center">发放总量</td>
                                    <td class="text-center">已发放数</td>
                                    <td class="text-center">已使用</td>
                                    <td class="text-center">使用截止日期</td>
                                    <td class="text-center">操作</td>
                                </tr>
                                </thead>
                                <tbody id="couponsContent">
                                <#list couponList as coupon>
                                    <tr>
                                        <td class="text-center">
                                            <input name="selected[]" value="${coupon.id}" type="checkbox">
                                        </td>
                                        <td class="text-center">${coupon.name}</td>
                                        <td class="text-center">
                                            <#if coupon.type==0>
                                                面额模板
                                            </#if>
                                            <#if coupon.type==1>
                                                按用户发放
                                            </#if>
                                            <#if coupon.type==2>
                                                注册
                                            </#if>
                                            <#if coupon.type==3>
                                                邀请
                                            </#if>
                                            <#if coupon.type==4>
                                                线下发放
                                            </#if>
                                        </td>
                                        <td class="text-center">${coupon.money}</td>
                                        <td class="text-center">${coupon.condition}</td>
                                        <td class="text-center">${coupon.createnum}</td>
                                        <td class="text-center">${coupon.sendNum}</td>
                                        <td class="text-center">${coupon.useNum}</td>
                                        <td class="text-center">
                                            ${((coupon.useEndTime)?c?number *1000)?number_to_datetime}
                                        </td>
                                        <td class="text-center">
                                            <#if coupon.createnum==coupon.sendNum>
                                                <a href="javascript:void(0)" data-toggle="tooltip" title="发放" class="btn btn-info send_user" data-url="coupon-grant.ftl"><i class="fa fa-send-o"></i></a>
                                            </#if>
                                            <#if coupon.createnum!=coupon.sendNum>
                                                <a href="/index/Admin/Coupon/make_coupon/id/12/type/4" data-toggle="tooltip" title="" class="btn btn-info" data-original-title="发放"><i class="fa fa-send"></i></a>
                                            </#if>
                                            <a href="coupon-list.ftl" data-toggle="tooltip" title="" class="btn btn-info" data-original-title="查看"><i class="fa fa-eye"></i></a>
                                            <a href="/index/Admin/Coupon/coupon_info/id/14" data-toggle="tooltip" title="" class="btn btn-info" data-original-title="编辑"><i class="fa fa-pencil"></i></a>
                                            <a data-url="/index/Admin/Coupon/del_coupon/id/14" onclick="delfun(this)" href="javascript:;" data-toggle="tooltip" title="" class="btn btn-danger" data-original-title="删除"><i class="fa fa-trash-o"></i></a></td>
                                    </tr>
                                </#list>
                               </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 text-left"></div>
                        <div class="col-sm-6 text-right">
                            <div class="dataTables_paginate paging_simple_numbers">
                                <ul class="pagination">
                                    <#list 1..couponPage.pageInfo.pages as i>
                                    <#if i==couponPage.pageInfo.pageNum>
                                        <li class="paginate_button active">
                                            <a tabindex="0" data-dt-idx="1" aria-controls="example1" href="${ctx}/promotion/coupon?pageNum=${i}">${i}</a>
                                        </li>
                                    <#else>
                                        <li class="paginate_button">
                                            <a class="num" href="${ctx}/promotion/coupon?pageNum=${i}">${i}</a>
                                        </li>
                                    </#if>



                                    </#list>
                                    <#if couponPage.pageInfo.pageNum!=couponPage.pageInfo.pages>

                                        <li id="example1_next" class="paginate_button next">
                                            <a class="next" href="${ctx}/promotion/coupon?pageNum=${couponPage.pageInfo.nextPage}">下一页</a>
                                        </li>
                                    </#if>

                                </ul>
                            </div>
                        </div>

                    </div>
				  </div>
                </div>
            </div>
        </div>        <!-- /.row -->
    </section>
    <!-- /.content -->
</div>
<script>
$('.send_user').click(function(){
    var url = $(this).attr('data-url');
    layer.open({
        type: 2,
        title: '发放优惠券',
        shadeClose: true,
        shade: 0.5,
        area: ['70%', '85%'],
        content: url, 
    });
});

function delfun(obj){
	if(confirm('确认删除')){		
		$.ajax({
			type : 'post',
			url : $(obj).attr('data-url'),
			dataType : 'json',
			success : function(data){
				if(data){
					$(obj).parent().parent().remove();
				}else{
					layer.alert('删除失败', {icon: 2});  //alert('删除失败');
				}
			}
		})
	}
	return false;
}
</script>

</body></html>