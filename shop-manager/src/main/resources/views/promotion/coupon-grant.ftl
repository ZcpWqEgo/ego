<#assign ctx=request.contextPath/>
<html><head>
    <meta charset="UTF-8">
    <title>ego管理后台</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.4 -->
    <link href="${ctx}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <!-- FontAwesome 4.3.0 -->
 	<link href="${ctx}/static/bootstrap/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Ionicons 2.0.0 --
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
    <link href="${ctx}/static/js/layer/skin/layer.css" rel="stylesheet" type="text/css"><!-- 弹窗js 参考文档 http://layer.layui.com/-->
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
 

<div class="wrapper">
  <section class="content">
    <div class="container-fluid">
      <div class="panel panel-default">
        <div class="panel-body">
          <div class="navbar navbar-default">
              <form action="${ctx}/promotion/grantList" id="search-form" class="navbar-form form-inline" method="post">
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
                <button type="submit" id="button-filter" class="btn btn-info" onclick="">确定发送优惠券</button>
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
                    <input name="nickname" value="" placeholder="搜索词" id="input-nickname" class="form-control" type="text">
                  </div>
                </div>
                <button type="button" onclick="ajax_get_select()" id="button-filter search-order" class="btn btn-primary"><i class="fa fa-search"></i>查找</button>
              	<button type="button" onclick="" id="button-filter" class="btn btn-info pull-right">确定发送优惠券</button>
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
         <#if userList??&& (userList?size > 0)>
             <#list userList as user>
                 <tr>
                     <td class="text-left">
                         <input name="user_id[]" value="${user.userId}" type="checkbox">
                     </td>
                     <td class="text-left">${user.userId}</td>
                     <td class="text-left">${user.level}</td>
                     <td class="text-left">${user.nickname}</td>
                     <td class="text-left">${user.mobile}</td>
                     <td class="text-left">${user.email}</td>
                     <td><a href="javascript:void(0)" onclick="javascript:$(this).parent().parent().remove();">删除</a></td>
                 </tr>
             </#list>
         </#if>
         </tbody>
     </table>
 </div>
 <div class="row">
    <div class="text-left col-sm-10">
       <div class="dataTables_paginate paging_simple_numbers">
           <ul class="pagination">
               <#if userPage.pageInfo??&& (userPage.pageInfo.list?size > 0)>
               <li id="example1_previous" class="paginate_button previous disabled">
                   <a class="end" data-p="260" href="${ctx}/promotion/grantList?pageNum=1">首页</a>
               </li>

                <#if userPage.pageInfo.hasPreviousPage>
                   <li id="example1_previous" class="paginate_button previous disabled">
                       <a class="end" data-p="260" href="${ctx}/promotion/grantList?pageNum=${userPage.pageInfo.prePage}">上一页</a>
                   </li>
                    </#if>

               <#list userPage.pageInfo.navigatepageNums as i >
                    <#if i==userPage.pageInfo.pageNum>
                        <li class="paginate_button active">
                            <a tabindex="0" data-dt-idx="${i}" aria-controls="example1" data-p="${i}" href="javascript:void(0)">${i}</a>
                        </li>
                        <#else>
                            <li class="paginate_button">
                                <a class="num" data-p="${i}" href="${ctx}/promotion/grantList?pageNum=${i}">${i}</a>
                            </li>
                    </#if>


               </#list>

               <#if userPage.pageInfo.hasNextPage>
                   <li id="example1_previous" class="paginate_button previous disabled">
                       <a class="end" data-p="260" href="${ctx}/promotion/grantList?pageNum=${userPage.pageInfo.nextPage}">下一页</a>
                   </li>
               </#if>
               <li id="example1_previous" class="paginate_button previous disabled">
                   <a class="end" data-p="260" href="${ctx}/promotion/grantList?pageNum=${userPage.pageInfo.pages}">尾页</a>
               </li>
            </#if>
           </ul>
       </div>
    </div>
</div>			    
<script>
</script></div>
          </form>
        </div>
      </div>
    </div>
  </section>
<script>
    function ajax_get_select(){
        var str="";
        //inputMobile手机号码
        var  inputMobile=$("#input-mobile").val();
        //inputEmail
        var  inputEmail=$("#input-email").val();
        //inputNickname昵称
        var  inputNickname=$("#input-nickname").val();
        console.log(inputMobile+inputEmail+inputNickname)
        console.log(typeof(inputMobile)+"  "+typeof(inputEmail)+"  "+typeof(inputNickname))
        if(inputMobile != "undefined"&&typeof(inputMobile) != undefined&&inputMobile != ""){
            str+="&inputMobile=";
            str+=inputMobile;
        }
        if(inputEmail != "undefined"&&typeof(inputEmail) != undefined&&inputEmail != ""){
            str+="&inputEmail=";
            str+=inputEmail;
        }
        if(inputNickname!= "undefined"&&typeof(inputNickname) != undefined&&inputNickname!= ""){
            str+="&inputNickname=";
            str+=inputNickname;
        }
        console.log(str);
        window.location.href="${ctx}/promotion/grantList?ageNum=1"+str;
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
     function ajax_submit_add(id) {

     }
</script>
</div>

</body></html>