<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>
<script>
function submitElement()
{
document.getElementById("page2").style.display="none";
}
function removeElement()
{
document.getElementById("page2").style.display="none";
document.getElementById("page3").style.display="none";
}
function openElement()
{
document.getElementById("page3").style.display="inline";
}
</script>
<c:import url="../_frag/pager/pagerForm.jsp"></c:import>
<div class="pageContent">
<form method="post"  action="<c:url value='/management/department/saveUpdate.htm'/>"   onsubmit="return validateCallback(this)" >
<div class="accordion" style="width:99%;">
		<div class="accordionContent" layoutH="70">	
		<div class="pageFormContent" layoutH="130">
		<p>
			<label>部门ID： </label>
			<input type="text" name="id" value="${department.id}" readonly="readonly" class="required"/>
		</p>
		<p>
			<label>部门代码： </label>
			<input type="text" name="code" value="${department.code}" class="required" readonly="readonly" />
		</p>
		<p>
			<label>部门名称： </label>
			<input type="text" name="caption" value="${department.caption}" class="required" />
		</p>
		<p>
			<label>状态： </label>
			<select name="useflag" class="combox">
				<option value="1" ${"1" eq department.use_flag ? 'selected="selected"' : ''}>使用</option>
				<option value="0" ${"0" eq department.use_flag ? 'selected="selected"' : ''}>未使用</option>
			</select>
		</p>
		<p>
			<label>排序索引： </label>
			<input type="text" name="orderIndex" value="${department.order_index}" class="required" />
		</p>
		<p>
		   <label>所属部门：</label>
		   <select name="fatherId" class="combox">
				<c:forEach items="${departmentList}" var="dl" varStatus="s">
					<option value="${dl.id}" ${dl.id eq department.father_id ? 'selected="selected"' : ''}>${dl.caption}</option>
				</c:forEach>
			</select>
		</p>
		<p>
			<label>节点属性: </label>
			<c:if test="${department.is_leaf==1}">
				<label>子部门</label>
			</c:if>
			<c:if test="${department.is_leaf==0}">
				<label>非子部门</label>
			</c:if>
			<input type="hidden" name="isLeaf" value="${department.is_leaf}" class="required" />
		</p>
	</div>
	<div class="formBar">
		<ul class="toolBar">
			<li><div class="buttonActive"><div class="buttonContent"><button type="button" onclick="openElement()">添加子部门</button></div></div></li>
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit" onclick="submitElement()">保存</button></div></div></li>
			<li><div class="buttonActive"><div class="buttonContent"><button type="button" onclick="removeElement()">关闭</button></div></div></li>
		</ul>
	</div>
</div>
</div>
</form> 
</div>           


