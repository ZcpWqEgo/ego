<#assign ctx=request.contextPath/>
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
    <script src="${ctx}/static/plugins/jQuery/jQuery-2.1.4.min.js"></script>
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
					            <a href="代金券管理-添加优惠券.html" class="btn btn-primary pull-right"><i class="fa fa-plus"></i>添加优惠券</a>
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
                                <tbody>
                                <tr>
                                        <td class="text-center">
                                            <input name="selected[]" value="6" type="checkbox">
                                        </td>
                                        <td class="text-center">ego代金券10元</td>
                                        <td class="text-center">按用户发放</td>
                                        <td class="text-center">10.00</td>
                                        <td class="text-center">100.00</td>
                                        <td class="text-center">10</td>
                                        <td class="text-center">2</td>
                                        <td class="text-center">0</td>
                                        <td class="text-center">2016-09-21</td>
                                        <td class="text-center">
                                           	<a href="javascript:void(0)" data-toggle="tooltip" title="发放" class="btn btn-info send_user" data-url="代金券管理-发放优惠券.html"><i class="fa fa-send-o"></i></a>
                                            <a href="coupon-list.html" data-toggle="tooltip" title="" class="btn btn-info" data-original-title="查看"><i class="fa fa-eye"></i></a>
                                            <a href="/index/Admin/Coupon/coupon_info/id/14" data-toggle="tooltip" title="" class="btn btn-info" data-original-title="编辑"><i class="fa fa-pencil"></i></a>
                                            <a data-url="/index/Admin/Coupon/del_coupon/id/14" onclick="delfun(this)" href="javascript:;" data-toggle="tooltip" title="" class="btn btn-danger" data-original-title="删除"><i class="fa fa-trash-o"></i></a></td>
                                    </tr><tr>
                                        <td class="text-center">
                                            <input name="selected[]" value="6" type="checkbox">
                                        </td>
                                        <td class="text-center">50元代金券</td>
                                        <td class="text-center">线下发放</td>
                                        <td class="text-center">50.00</td>
                                        <td class="text-center">150.00</td>
                                        <td class="text-center">100</td>
                                        <td class="text-center">10</td>
                                        <td class="text-center">0</td>
                                        <td class="text-center">2016-09-01</td>
                                        <td class="text-center">
                                            <a href="/index/Admin/Coupon/make_coupon/id/13/type/4" data-toggle="tooltip" title="" class="btn btn-info" data-original-title="发放"><i class="fa fa-send"></i></a>
                                                                                        <a href="/index/Admin/Coupon/coupon_list/id/13" data-toggle="tooltip" title="" class="btn btn-info" data-original-title="查看"><i class="fa fa-eye"></i></a>
                                            <a href="/index/Admin/Coupon/coupon_info/id/13" data-toggle="tooltip" title="" class="btn btn-info" data-original-title="编辑"><i class="fa fa-pencil"></i></a>
                                            <a data-url="/index/Admin/Coupon/del_coupon/id/13" onclick="delfun(this)" href="javascript:;" data-toggle="tooltip" title="" class="btn btn-danger" data-original-title="删除"><i class="fa fa-trash-o"></i></a></td>
                                    </tr><tr>
                                        <td class="text-center">
                                            <input name="selected[]" value="6" type="checkbox">
                                        </td>
                                        <td class="text-center">5元线下券</td>
                                        <td class="text-center">线下发放</td>
                                        <td class="text-center">7.00</td>
                                        <td class="text-center">50.00</td>
                                        <td class="text-center">100</td>
                                        <td class="text-center">57</td>
                                        <td class="text-center">0</td>
                                        <td class="text-center">2016-07-21</td>
                                        <td class="text-center">
                                            <a href="/index/Admin/Coupon/make_coupon/id/12/type/4" data-toggle="tooltip" title="" class="btn btn-info" data-original-title="发放"><i class="fa fa-send"></i></a>
                                                                                        <a href="/index/Admin/Coupon/coupon_list/id/12" data-toggle="tooltip" title="" class="btn btn-info" data-original-title="查看"><i class="fa fa-eye"></i></a>
                                            <a href="/index/Admin/Coupon/coupon_info/id/12" data-toggle="tooltip" title="" class="btn btn-info" data-original-title="编辑"><i class="fa fa-pencil"></i></a>
                                            <a data-url="/index/Admin/Coupon/del_coupon/id/12" onclick="delfun(this)" href="javascript:;" data-toggle="tooltip" title="" class="btn btn-danger" data-original-title="删除"><i class="fa fa-trash-o"></i></a></td>
                                    </tr><tr>
                                        <td class="text-center">
                                            <input name="selected[]" value="6" type="checkbox">
                                        </td>
                                        <td class="text-center">代金券10块</td>
                                        <td class="text-center">面额模板</td>
                                        <td class="text-center">10.00</td>
                                        <td class="text-center">100.00</td>
                                        <td class="text-center">100</td>
                                        <td class="text-center">0</td>
                                        <td class="text-center">0</td>
                                        <td class="text-center">2016-07-31</td>
                                        <td class="text-center">
                                                                                        	<a href="javascript:void(0)" data-toggle="tooltip" title="" class="btn btn-default disabled" data-original-title="查看"><i class="fa fa-send-o"></i></a>                                            <a href="/index/Admin/Coupon/coupon_list/id/11" data-toggle="tooltip" title="" class="btn btn-info" data-original-title="查看"><i class="fa fa-eye"></i></a>
                                            <a href="/index/Admin/Coupon/coupon_info/id/11" data-toggle="tooltip" title="" class="btn btn-info" data-original-title="编辑"><i class="fa fa-pencil"></i></a>
                                            <a data-url="/index/Admin/Coupon/del_coupon/id/11" onclick="delfun(this)" href="javascript:;" data-toggle="tooltip" title="" class="btn btn-danger" data-original-title="删除"><i class="fa fa-trash-o"></i></a></td>
                                    </tr><tr>
                                        <td class="text-center">
                                            <input name="selected[]" value="6" type="checkbox">
                                        </td>
                                        <td class="text-center">按用户发放优惠券</td>
                                        <td class="text-center">线下发放</td>
                                        <td class="text-center">10.00</td>
                                        <td class="text-center">100.00</td>
                                        <td class="text-center">0</td>
                                        <td class="text-center">0</td>
                                        <td class="text-center">0</td>
                                        <td class="text-center">2016-07-02</td>
                                        <td class="text-center">
                                            <a href="/index/Admin/Coupon/make_coupon/id/10/type/4" data-toggle="tooltip" title="" class="btn btn-info" data-original-title="发放"><i class="fa fa-send"></i></a>
                                                                                        <a href="/index/Admin/Coupon/coupon_list/id/10" data-toggle="tooltip" title="" class="btn btn-info" data-original-title="查看"><i class="fa fa-eye"></i></a>
                                            <a href="/index/Admin/Coupon/coupon_info/id/10" data-toggle="tooltip" title="" class="btn btn-info" data-original-title="编辑"><i class="fa fa-pencil"></i></a>
                                            <a data-url="/index/Admin/Coupon/del_coupon/id/10" onclick="delfun(this)" href="javascript:;" data-toggle="tooltip" title="" class="btn btn-danger" data-original-title="删除"><i class="fa fa-trash-o"></i></a></td>
                                    </tr><tr>
                                        <td class="text-center">
                                            <input name="selected[]" value="6" type="checkbox">
                                        </td>
                                        <td class="text-center">订单满100送10元代金券</td>
                                        <td class="text-center">按用户发放</td>
                                        <td class="text-center">10.00</td>
                                        <td class="text-center">100.00</td>
                                        <td class="text-center">100</td>
                                        <td class="text-center">23</td>
                                        <td class="text-center">0</td>
                                        <td class="text-center">2016-07-02</td>
                                        <td class="text-center">
                                                                                        	<a href="javascript:void(0)" data-toggle="tooltip" title="发放" class="btn btn-info send_user" data-url="/index/Admin/Coupon/send_coupon/cid/9"><i class="fa fa-send-o"></i></a>
                                                                                        <a href="/index/Admin/Coupon/coupon_list/id/9" data-toggle="tooltip" title="" class="btn btn-info" data-original-title="查看"><i class="fa fa-eye"></i></a>
                                            <a href="/index/Admin/Coupon/coupon_info/id/9" data-toggle="tooltip" title="" class="btn btn-info" data-original-title="编辑"><i class="fa fa-pencil"></i></a>
                                            <a data-url="/index/Admin/Coupon/del_coupon/id/9" onclick="delfun(this)" href="javascript:;" data-toggle="tooltip" title="" class="btn btn-danger" data-original-title="删除"><i class="fa fa-trash-o"></i></a></td>
                                    </tr><tr>
                                        <td class="text-center">
                                            <input name="selected[]" value="6" type="checkbox">
                                        </td>
                                        <td class="text-center">按用户类型发放</td>
                                        <td class="text-center">线下发放</td>
                                        <td class="text-center">30.00</td>
                                        <td class="text-center">100.00</td>
                                        <td class="text-center">0</td>
                                        <td class="text-center">50</td>
                                        <td class="text-center">0</td>
                                        <td class="text-center">2015-12-11</td>
                                        <td class="text-center">
                                            <a href="/index/Admin/Coupon/make_coupon/id/3/type/4" data-toggle="tooltip" title="" class="btn btn-info" data-original-title="发放"><i class="fa fa-send"></i></a>
                                                                                        <a href="/index/Admin/Coupon/coupon_list/id/3" data-toggle="tooltip" title="" class="btn btn-info" data-original-title="查看"><i class="fa fa-eye"></i></a>
                                            <a href="/index/Admin/Coupon/coupon_info/id/3" data-toggle="tooltip" title="" class="btn btn-info" data-original-title="编辑"><i class="fa fa-pencil"></i></a>
                                            <a data-url="/index/Admin/Coupon/del_coupon/id/3" onclick="delfun(this)" href="javascript:;" data-toggle="tooltip" title="" class="btn btn-danger" data-original-title="删除"><i class="fa fa-trash-o"></i></a></td>
                                    </tr><tr>
                                        <td class="text-center">
                                            <input name="selected[]" value="6" type="checkbox">
                                        </td>
                                        <td class="text-center">订单满100优惠券</td>
                                        <td class="text-center">按用户发放</td>
                                        <td class="text-center">20.00</td>
                                        <td class="text-center">100.00</td>
                                        <td class="text-center">11</td>
                                        <td class="text-center">1</td>
                                        <td class="text-center">0</td>
                                        <td class="text-center">2015-12-11</td>
                                        <td class="text-center">
                                                                                        	<a href="javascript:void(0)" data-toggle="tooltip" title="发放" class="btn btn-info send_user" data-url="/index/Admin/Coupon/send_coupon/cid/2"><i class="fa fa-send-o"></i></a>
                                                                                        <a href="/index/Admin/Coupon/coupon_list/id/2" data-toggle="tooltip" title="" class="btn btn-info" data-original-title="查看"><i class="fa fa-eye"></i></a>
                                            <a href="/index/Admin/Coupon/coupon_info/id/2" data-toggle="tooltip" title="" class="btn btn-info" data-original-title="编辑"><i class="fa fa-pencil"></i></a>
                                            <a data-url="/index/Admin/Coupon/del_coupon/id/2" onclick="delfun(this)" href="javascript:;" data-toggle="tooltip" title="" class="btn btn-danger" data-original-title="删除"><i class="fa fa-trash-o"></i></a></td>
                                    </tr><tr>
                                        <td class="text-center">
                                            <input name="selected[]" value="6" type="checkbox">
                                        </td>
                                        <td class="text-center">注册优惠券</td>
                                        <td class="text-center">注册发放</td>
                                        <td class="text-center">50.00</td>
                                        <td class="text-center">200.00</td>
                                        <td class="text-center">0</td>
                                        <td class="text-center">0</td>
                                        <td class="text-center">0</td>
                                        <td class="text-center">2015-12-11</td>
                                        <td class="text-center">
                                                                                        	<a href="javascript:void(0)" data-toggle="tooltip" title="" class="btn btn-default disabled" data-original-title="查看"><i class="fa fa-send-o"></i></a>                                            <a href="/index/Admin/Coupon/coupon_list/id/1" data-toggle="tooltip" title="" class="btn btn-info" data-original-title="查看"><i class="fa fa-eye"></i></a>
                                            <a href="/index/Admin/Coupon/coupon_info/id/1" data-toggle="tooltip" title="" class="btn btn-info" data-original-title="编辑"><i class="fa fa-pencil"></i></a>
                                            <a data-url="/index/Admin/Coupon/del_coupon/id/1" onclick="delfun(this)" href="javascript:;" data-toggle="tooltip" title="" class="btn btn-danger" data-original-title="删除"><i class="fa fa-trash-o"></i></a></td>
                                    </tr><tr>
                                        <td class="text-center">
                                            <input name="selected[]" value="6" type="checkbox">
                                        </td>
                                        <td class="text-center">50代金券</td>
                                        <td class="text-center">面额模板</td>
                                        <td class="text-center">50.00</td>
                                        <td class="text-center">500.00</td>
                                        <td class="text-center">100</td>
                                        <td class="text-center">0</td>
                                        <td class="text-center">0</td>
                                        <td class="text-center">2016-11-01</td>
                                        <td class="text-center">
                                                                                        	<a href="javascript:void(0)" data-toggle="tooltip" title="" class="btn btn-default disabled" data-original-title="查看"><i class="fa fa-send-o"></i></a>                                            <a href="/index/Admin/Coupon/coupon_list/id/7" data-toggle="tooltip" title="" class="btn btn-info" data-original-title="查看"><i class="fa fa-eye"></i></a>
                                            <a href="/index/Admin/Coupon/coupon_info/id/7" data-toggle="tooltip" title="" class="btn btn-info" data-original-title="编辑"><i class="fa fa-pencil"></i></a>
                                            <a data-url="/index/Admin/Coupon/del_coupon/id/7" onclick="delfun(this)" href="javascript:;" data-toggle="tooltip" title="" class="btn btn-danger" data-original-title="删除"><i class="fa fa-trash-o"></i></a></td>
                                    </tr>                                </tbody>
                            </table>
                        </div>
                    </div>
				 <div class="row">
              	    <div class="col-sm-6 text-left"></div>
                    <div class="col-sm-6 text-right"><div class="dataTables_paginate paging_simple_numbers"><ul class="pagination">  <li class="paginate_button active"><a tabindex="0" data-dt-idx="1" aria-controls="example1" href="#">1</a></li><li class="paginate_button"><a class="num" href="/index/Admin/Coupon/index/p/2">2</a></li> <li id="example1_next" class="paginate_button next"><a class="next" href="/index/Admin/Coupon/index/p/2">下一页</a></li> </ul></div></div>		
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