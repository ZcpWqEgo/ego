<!DOCTYPE html>
<html><head>
    <meta charset="UTF-8">
    <title>ego管理后台</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.4 -->
    <link href="../../../../../../../../高级第二阶段/day01/002_software/后台管理系统-页面/Public/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <!-- FontAwesome 4.3.0 -->
 	<link href="../../../../../../../../高级第二阶段/day01/002_software/后台管理系统-页面/Public/bootstrap/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Ionicons 2.0.0 --
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="../../../../../../../../高级第二阶段/day01/002_software/后台管理系统-页面/Public/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
    	folder instead of downloading all of them to reduce the load. -->
    <link href="../../../../../../../../高级第二阶段/day01/002_software/后台管理系统-页面/Public/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css">
    <!-- iCheck -->
    <link href="../../../../../../../../高级第二阶段/day01/002_software/后台管理系统-页面/Public/plugins/iCheck/flat/blue.css" rel="stylesheet" type="text/css">
    <!-- jQuery 2.1.4 -->
    <script src="../../../../../../../../高级第二阶段/day01/002_software/后台管理系统-页面/Public/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<script src="../../../../../../../../高级第二阶段/day01/002_software/后台管理系统-页面/Public/js/global.js"></script>
    <script src="../../../../../../../../高级第二阶段/day01/002_software/后台管理系统-页面/Public/js/myFormValidate.js"></script>
    <script src="../../../../../../../../高级第二阶段/day01/002_software/后台管理系统-页面/Public/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../../../../../../../../高级第二阶段/day01/002_software/后台管理系统-页面/Public/js/layer/layer-min.js"></script><link rel="stylesheet" href="http://demo5.ego.cn../Public/js/layer/skin/layer.css" id="layui_layer_skinlayercss" style=""><!-- 弹窗js 参考文档 http://layer.layui.com/-->
    <script src="../../../../../../../../高级第二阶段/day01/002_software/后台管理系统-页面/Public/js/myAjax.js"></script>
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
 

<div class="wrapper">
  <section class="content">
    <div class="container-fluid">
      <div class="panel panel-default">
        <div class="panel-body">
          <div class="navbar navbar-default">
              <form action="/index/admin/Coupon/send_coupon.html" id="search-form" class="navbar-form form-inline" method="post">
                <div class="form-group">
                  <select name="level_id" id="level_id" class="form-control">
                    <option value="0">所有会员</option>
                                           <option value="1"> 注册会员</option>
	 			                           <option value="2"> 铜牌会员</option>
	 			                           <option value="3"> 白银会员</option>
	 			                           <option value="4"> 黄金会员</option>
	 			                           <option value="5"> 钻石会员</option>
	 			                           <option value="6"> 超级VIP</option>
	 			                      </select>
                </div>
                <input name="cid" id="cid" value="14" type="hidden">
                <button type="submit" id="button-filter" class="btn btn-info">确定发送优惠券</button>
              </form>
          </div>
          <div class="navbar navbar-default">
             <form action="" id="search-form2" class="navbar-form form-inline" method="post" onsubmit="return false">
               <div class="form-group">
                   <label class="control-label" for="input-mobile">手机号码</label>
                   <div class="input-group">
                       <input name="mobile" value="" placeholder="手机号码" id="input-mobile" class="form-control" type="text">
                   </div>
               </div>

               <div class="form-group">
                   <label class="control-label" for="input-email">email</label>
                   <div class="input-group">
                       <input name="email" value="" placeholder="email" id="input-email" class="form-control" type="text">                      
                   </div>
               </div>
               <div class="form-group">
                  <label class="control-label" for="input-order-id">昵称关键词</label>
                  <div class="input-group">
                    <input name="nickname" value="" placeholder="搜索词" id="input-order-id" class="form-control" type="text">
                  </div>
                </div>
                <button type="button" onclick="ajax_get_table('search-form2',1)" id="button-filter search-order" class="btn btn-primary"><i class="fa fa-search"></i>查找</button>
              	<button type="button" onclick="doconfirm()" id="button-filter" class="btn btn-info pull-right">确定发送优惠券</button>	  
              </form>
          </div>
          <form method="post" action="" id="form-user">
           <input name="cid" id="cid" value="14" type="hidden">
	          <div id="ajax_return"><div class="table-responsive">
     <table class="table table-bordered table-hover">
         <thead>
             <tr><td class="text-left"><input onclick="$('input[name*=\'user_id\']').prop('checked', this.checked);" type="checkbox">全选</td>
             <td class="text-left">会员ID</td>            
             <td class="text-left">会员等级</td>
             <td class="text-left">会员昵称 </td>
             <td class="text-left">手机</td>
             <td class="text-left">邮箱</td>
             <td class="text-left">操作</td>
         </tr>
         </thead>
         <tbody id="goos_table">
                               <tr>
                  	<td class="text-left">                
                           <input name="user_id[]" value="2628" type="checkbox">
                      </td>
                      <td class="text-left">2628</td>
                      <td class="text-left">注册会员</td>
                      <td class="text-left">
                                                        厉害了word哥                      </td>
                      <td class="text-left"></td>
                      <td class="text-left"></td>
                      <td><a href="javascript:void(0)" onclick="javascript:$(this).parent().parent().remove();">删除</a></td>
                  </tr>                              
         	                  <tr>
                  	<td class="text-left">                
                           <input name="user_id[]" value="2627" type="checkbox">
                      </td>
                      <td class="text-left">2627</td>
                      <td class="text-left">注册会员</td>
                      <td class="text-left">
                                                        Edmund                      </td>
                      <td class="text-left"></td>
                      <td class="text-left"></td>
                      <td><a href="javascript:void(0)" onclick="javascript:$(this).parent().parent().remove();">删除</a></td>
                  </tr>                              
         	                  <tr>
                  	<td class="text-left">                
                           <input name="user_id[]" value="2626" type="checkbox">
                      </td>
                      <td class="text-left">2626</td>
                      <td class="text-left">注册会员</td>
                      <td class="text-left">
                                                        QQ                      </td>
                      <td class="text-left"></td>
                      <td class="text-left"></td>
                      <td><a href="javascript:void(0)" onclick="javascript:$(this).parent().parent().remove();">删除</a></td>
                  </tr>                              
         	                  <tr>
                  	<td class="text-left">                
                           <input name="user_id[]" value="2625" type="checkbox">
                      </td>
                      <td class="text-left">2625</td>
                      <td class="text-left">注册会员</td>
                      <td class="text-left">
                                                        long                      </td>
                      <td class="text-left"></td>
                      <td class="text-left"></td>
                      <td><a href="javascript:void(0)" onclick="javascript:$(this).parent().parent().remove();">删除</a></td>
                  </tr>                              
         	                  <tr>
                  	<td class="text-left">                
                           <input name="user_id[]" value="2624" type="checkbox">
                      </td>
                      <td class="text-left">2624</td>
                      <td class="text-left">注册会员</td>
                      <td class="text-left">
                                                        振振                      </td>
                      <td class="text-left"></td>
                      <td class="text-left"></td>
                      <td><a href="javascript:void(0)" onclick="javascript:$(this).parent().parent().remove();">删除</a></td>
                  </tr>                              
         	                  <tr>
                  	<td class="text-left">                
                           <input name="user_id[]" value="2623" type="checkbox">
                      </td>
                      <td class="text-left">2623</td>
                      <td class="text-left">注册会员</td>
                      <td class="text-left">
                                                        雷影                      </td>
                      <td class="text-left"></td>
                      <td class="text-left"></td>
                      <td><a href="javascript:void(0)" onclick="javascript:$(this).parent().parent().remove();">删除</a></td>
                  </tr>                              
         	                  <tr>
                  	<td class="text-left">                
                           <input name="user_id[]" value="2622" type="checkbox">
                      </td>
                      <td class="text-left">2622</td>
                      <td class="text-left">注册会员</td>
                      <td class="text-left">
                                                        QQ用户                      </td>
                      <td class="text-left"></td>
                      <td class="text-left"></td>
                      <td><a href="javascript:void(0)" onclick="javascript:$(this).parent().parent().remove();">删除</a></td>
                  </tr>                              
         	                  <tr>
                  	<td class="text-left">                
                           <input name="user_id[]" value="2621" type="checkbox">
                      </td>
                      <td class="text-left">2621</td>
                      <td class="text-left">注册会员</td>
                      <td class="text-left">
                                                        Crown                      </td>
                      <td class="text-left"></td>
                      <td class="text-left"></td>
                      <td><a href="javascript:void(0)" onclick="javascript:$(this).parent().parent().remove();">删除</a></td>
                  </tr>                              
         	                  <tr>
                  	<td class="text-left">                
                           <input name="user_id[]" value="2620" type="checkbox">
                      </td>
                      <td class="text-left">2620</td>
                      <td class="text-left">注册会员</td>
                      <td class="text-left">
                                                        福龙～分销返利搭建15863678895                      </td>
                      <td class="text-left"></td>
                      <td class="text-left"></td>
                      <td><a href="javascript:void(0)" onclick="javascript:$(this).parent().parent().remove();">删除</a></td>
                  </tr>                              
         	                  <tr>
                  	<td class="text-left">                
                           <input name="user_id[]" value="2619" type="checkbox">
                      </td>
                      <td class="text-left">2619</td>
                      <td class="text-left">注册会员</td>
                      <td class="text-left">
                                                        山丘                      </td>
                      <td class="text-left"></td>
                      <td class="text-left"></td>
                      <td><a href="javascript:void(0)" onclick="javascript:$(this).parent().parent().remove();">删除</a></td>
                  </tr>                              
         	   
         </tbody>
     </table>
 </div>
 <div class="row">
    <div class="text-left col-sm-10">
       <div class="dataTables_paginate paging_simple_numbers"><ul class="pagination">  <li class="paginate_button active"><a tabindex="0" data-dt-idx="1" aria-controls="example1" data-p="1" href="javascript:void(0)">1</a></li><li class="paginate_button"><a class="num" data-p="2" href="javascript:void(0)">2</a></li><li class="paginate_button"><a class="num" data-p="3" href="javascript:void(0)">3</a></li><li class="paginate_button"><a class="num" data-p="4" href="javascript:void(0)">4</a></li><li class="paginate_button"><a class="num" data-p="5" href="javascript:void(0)">5</a></li><li class="paginate_button"><a class="num" data-p="6" href="javascript:void(0)">6</a></li><li class="paginate_button"><a class="num" data-p="7" href="javascript:void(0)">7</a></li><li class="paginate_button"><a class="num" data-p="8" href="javascript:void(0)">8</a></li><li class="paginate_button"><a class="num" data-p="9" href="javascript:void(0)">9</a></li><li class="paginate_button"><a class="num" data-p="10" href="javascript:void(0)">10</a></li><li class="paginate_button"><a class="num" data-p="11" href="javascript:void(0)">11</a></li> <li id="example1_next" class="paginate_button next"><a class="next" data-p="2" href="javascript:void(0)">下一页</a></li> <li id="example1_previous" class="paginate_button previous disabled"><a class="end" data-p="260" href="javascript:void(0)">尾页</a></li></ul></div>    </div>
   <div class="text-right col-sm-2">
                          
	</div>
</div>			    
<script>
    $(".pagination  a").click(function(){
        var page = $(this).data('p');
        ajax_get_table('search-form2',page);
    });
</script></div>
          </form>
        </div>
      </div>
    </div>
  </section>
<script>
    $(document).ready(function(){
        ajax_get_table('search-form2',1);

    });

    // ajax 抓取页面
    function ajax_get_table(tab,page){
        cur_page = page; //当前页面 保存为全局变量
            $.ajax({
                type : "POST",
                url:"/index/Admin/Coupon/ajax_get_user/p/"+page,//+tab,
                data : $('#'+tab).serialize(),// 你的formid
                success: function(data){
                    $("#ajax_return").html('');
                    $("#ajax_return").append(data);
                }
            });
    }

    function doconfirm(){
  	   if($("input[type='checkbox']:checked").length == 0)
 	   {
 		   layer.alert('请选择会员', {icon: 2}); //alert('请选择商品');
 		   return false;
 	   }else{
 		   $('#form-user').submit();
 	   }
     }
</script>
</div>

</body></html>