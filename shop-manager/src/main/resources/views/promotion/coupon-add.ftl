<#assign ctx=request.contextPath/>
<html>
  <head>
    <meta charset="UTF-8">
    <title>ego管理后台</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.4 -->
    <link href="${ctx}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- FontAwesome 4.3.0 -->
 	<link href="${ctx}/static/bootstrap/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons 2.0.0 --
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="${ctx}/static/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
    	folder instead of downloading all of them to reduce the load. -->
    <link href="${ctx}/static/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
    <!-- iCheck -->
    <link href="${ctx}/static/plugins/iCheck/flat/blue.css" rel="stylesheet" type="text/css" />
    <!-- jQuery 2.1.4 -->
    <script src="${ctx}/static/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<script src="${ctx}/static/js/global.js"></script>
    <script src="${ctx}/static/js/myFormValidate.js"></script>
    <script src="${ctx}/static/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/js/layer/layer-min.js"></script><!-- 弹窗js 参考文档 http://layer.layui.com/-->
	  <link href="${ctx}/static/js/layer/skin/layer.css" rel="stylesheet" type="text/css">
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
  </head>
  <body style="background-color:#ecf0f5;">
 

<link href="${ctx}/static/plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/static/plugins/daterangepicker/moment.min.js" type="text/javascript"></script>
<script src="${ctx}/static/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
<div class="wrapper">
    <div class="breadcrumbs" id="breadcrumbs">
	<ol class="breadcrumb">
	  
	        <li><a href="javascript:void();"><i class="fa fa-home"></i>&nbsp;&nbsp;后台首页</a></li>
	        
	        <li><a href="javascript:void();">优惠券管理</a></li>
	        
	        <li><a href="javascript:void();"></a></li>
	              
	</ol>
</div>

    <section class="content ">
        <!-- Main content -->
        <div class="container-fluid">
            <div class="pull-right">
                <a href="javascript:history.go(-1)" data-toggle="tooltip" title="" class="btn btn-default" data-original-title="返回"><i class="fa fa-reply"></i></a>
           		<a href="javascript:;" class="btn btn-default" data-url="http://www.ego.cn/Doc/Index/article/id/1012/developer/user.html" onclick="get_help(this)"><i class="fa fa-question-circle"></i> 帮助</a>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-list"></i> 添加优惠券</h3>
                </div>
                <div class="panel-body ">   
                    <!--表单数据-->
                    <form action="" method="post">              
                        <!--通用信息-->
                    <div class="tab-content col-md-10">                 	  
                        <div class="tab-pane active" id="tab_tongyong">                           
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <td class="col-sm-2">优惠券名称：</td>
                                    <td class="col-sm-4">
                                        <input type="text" value="" class="form-control" id="name" name="name" >
                                        <span id="err_attr_name" style="color:#F00; display:none;"></span>                                        
                                    </td>
                                    <td class="col-sm-4">请填写优惠券名称
                                    </td>
                                </tr>  
                                <tr>
                                    <td>优惠券面额：</td>
                                    <td >
                         				<input type="text" value="" class="form-control" id="money" name="money"  onpaste="this.value=this.value.replace(/[^\d.]/g,'')" onkeyup="this.value=this.value.replace(/[^\d.]/g,'')"/>
                                    </td>
                                    <td class="col-sm-4">优惠券可抵扣金额</td>
                                </tr>  
                                <tr>
                                    <td>消费金额：</td>
                                    <td>
                      					<input type="text" value="" class="form-control active" id="condition" name="condition"  onpaste="this.value=this.value.replace(/[^\d.]/g,'')" onkeyup="this.value=this.value.replace(/[^\d.]/g,'')" />
                                    </td>
                                    <td class="col-sm-4">订单需满足的最低消费金额(必需为整数)才能使用</td>
                                </tr>
                                <tr>
			                        <td>发放类型:</td>
			                        <td id="order-status">
			                         	<input name="type" type="radio" value="0" checked >面额模板
			                            <input name="type" type="radio" value="1"  >按用户发放			                           
			                            <input name="type" type="radio" value="2"  >注册发放
			                            <input name="type" type="radio" value="3"  >邀请发放
			                            <input name="type" type="radio" value="4"  >线下发放
			                        </td>
			                    </tr> 
			                    <tr>
			                    	<td>发放数量:</td>
			                    	<td><input type="text" value="" class="form-control" id="createnum" name="createnum" placeholder="0" onpaste="this.value=this.value.replace(/[^\d]/g,'')" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" /></td>
			                    	<td class="col-sm-4">发放数量限制(默认为0则无限制)</td>
			                    </tr>
			                    <tr class="timed">
			                        <td>发放起始日期:</td>
			                        <td>
			                            <div class="input-prepend input-group">
			                                <span class="add-on input-group-addon">
			                                      <i class="glyphicon glyphicon-calendar fa fa-calendar">  </i>
			                                </span>
			                                <input type="text" value="2016-12-18 10:43:31" class="form-control" id="send_start_time" name="send_start_time">
			                            </div>
			                        </td>
			                        <td class="col-sm-4"></td>
			                    </tr>
			
			                    <tr class="timed">
			                        <td>发放结束日期:</td>
			                        <td>
			                            <div class="input-prepend input-group">
			                                <span class="add-on input-group-addon">
			                                        <i class="glyphicon glyphicon-calendar fa fa-calendar"> </i>
			                                </span>
			                                <input type="text" value="2017-01-17 10:43:31" class="form-control" id="send_end_time" name="send_end_time">
			                            </div>
			                        </td>
			                        <td class="col-sm-4"></td>
			                    </tr>
					            <tr>
			                        <td>使用起始日期:</td>
			                        <td>
			                            <div class="input-prepend input-group">
			                                <span class="add-on input-group-addon">
			                                    <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
			                                </span>
			                                <input type="text" value="2016-12-18 10:43:31" class="form-control" id="use_start_time" name="use_start_time">
			                            </div>
			                        </td>
			                        <td class="col-sm-4"></td>
			                    </tr> 
			                    <tr>
			                        <td>使用结束日期:</td>
			                        <td>
			                            <div class="input-prepend input-group">
			                                <span class="add-on input-group-addon">
			                                    <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
			                                </span>
			                                <input type="text" value="2017-02-17 10:43:31" class="form-control" id="use_end_time" name="use_end_time">
			                            </div>
			                        </td>
			                        <td class="col-sm-4"></td>
			                    </tr>                              
                                </tbody> 
                                <tfoot>
                                	<tr>
                                	<td>
                                		<input type="hidden" name="id" value="">
                                	</td>
                                	<td class="col-sm-4"></td>
                                	<td class="text-right"><input class="btn btn-primary" type="submit" value="保存" onclick="add_coupon_ajax()"></td>
                                	</tr>
                                </tfoot>                               
                            </table>
                        </div>                           
                    </div>              
			    	</form><!--表单数据-->
                </div>
            </div>
        </div>
    </section>
</div>

<script>
$('input[type="radio"]').click(function(){
    if($(this).val() == 0){
    	$('.timed').hide();
    }else{
    	$('.timed').show();
    }
})


$(function(){
    data_pick('send_start_time');
    data_pick('send_end_time');
    data_pick('use_start_time');
    data_pick('use_end_time');
    $('input[type="radio"]:checked').trigger('click');
})
    
function data_pick(id){
    var myDate = new Date();
    $('#'+id).daterangepicker({
    	format:"YYYY-MM-DD HH:mm:ss",
        singleDatePicker: true,
        showDropdowns: true,
        minDate:myDate.getFullYear()+'-'+myDate.getMonth()+'-'+myDate.getDate(),
        maxDate:'2030-01-01',
		timePicker : true, //是否显示小时和分钟
        timePickerIncrement:1,//time选择递增数
		timePicker12Hour : false, //是否使用12小时制来显示时间 		
        locale : {
            applyLabel : '确定',
            cancelLabel : '取消',
            fromLabel : '起始时间',
            toLabel : '结束时间',
            customRangeLabel : '自定义',
            daysOfWeek : [ '日', '一', '二', '三', '四', '五', '六' ],
            monthNames : [ '一月', '二月', '三月', '四月', '五月', '六月','七月', '八月', '九月', '十月', '十一月', '十二月' ],
            firstDay : 1
        }
    });
}
function  add_coupon_ajax() {
	// console.log($("#name").val()+"\n"+$("#money").val()+"\n"+$("#condition").val()+"\n"+$('input:radio:checked').val()+"\n"+$("#createnum").val()+"\n"+$("#send_start_time").val()+"\n"+$("#send_end_time").val()+"\n"+$("#use_start_time").val()+"\n"+$("#use_end_time").val());

	$.ajax({
		url: "${ctx}/promotion/coupon_add",
		type: "POST",
		data: {
			name: $("#name").val(),
			money: $("#money").val(),
			condition:$("#condition").val(),
			orderstatus: $('input:radio:checked').val(),
			createnum: $("#createnum").val(),
			send_start_time: $("#send_start_time").val(),
			send_end_time: $("#send_end_time").val(),
			use_start_time: $("#use_start_time").val(),
			use_end_time: $("#use_end_time").val()
		},
		success: function (result) {
				if (result.code == 200) {
					layer.confirm("保存成功", {btn: ['继续新增', '返回列表']},
							function () {
								window.location.href = "${ctx}/promotion/coupon";
							}, function () {
								window.location.href = "${ctx}/promotion/coupon-add";
							});

				} else {
					console.log("添加失败")
				}
		}
	});
}
</script>
</body>
</html>