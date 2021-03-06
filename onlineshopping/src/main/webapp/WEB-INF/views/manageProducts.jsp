<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<div class="container">

	<div class="row">

		<c:if test="${not empty message}">
			<div class="col-xs-12">
				<div class="alert alert-success alert-dismissible">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					${message}
				</div>
			</div>
		</c:if>

		<div class="col-md-offset-2 col-md-8">
			<div class="panel panel-warning">
				<div class="panel-heading">
					<h4>Product Management</h4>
				</div>
				<div class="panel-body">
					<!--  FORM ELEMENTS -->
					<sf:form class="form-horizontal" modelAttribute="product" action="${contextRoot}/manage/products" method="POST" enctype="multipart/form-data">

						<div class="form-group">
							<label class="control-label col-md-4" for="name">Enter Product Name: </label>
							<div class="col-md-8">
								<sf:input type="text" path="name" id="name" placeholder="Product Name" class="form-control" />
								<sf:errors path="name" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="brand">Enter Brand Name: </label>
							<div class="col-md-8">
								<sf:input type="text" path="brand" id="brand" placeholder="Brand Name" class="form-control" />
								<sf:errors path="brand" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="description">Product Description: </label>
							<div class="col-md-8">
								<sf:textarea path="description" id="description" rows="4" placeholder="Write a description for the product!" class="form-control" />
								<sf:errors path="description" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="unitPrice">Enter Unit Price: </label>
							<div class="col-md-8">
								<sf:input type="number" path="unitPrice" id="unitPrice" placeholder="Unit Price In &#8377;" class="form-control" />
								<sf:errors path="unitPrice" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="quantity">Quantity Available: </label>
							<div class="col-md-8">
								<sf:input type="number" path="quantity" id="quantity" placeholder="Quantity Available" class="form-control" />
							</div>
						</div>

						<!-- File element for image upload -->
						<div class="form-group">
							<label class="control-label col-md-4" for="file">Select an Image: </label>
							<div class="col-md-8">
								<sf:input type="file" path="file" id="file" class="form-control" />
								<sf:errors path="file" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="categoryId">Select Category: </label>
							<div class="col-md-8">
								<sf:select class="form-control" id="categoryId" path="categoryId" items="${categories}" 
								    itemLabel="name" 
									itemValue="id" 
								/>
								<!-- Add category toggle button  -->
								<c:if test="${product.id == 0}">
									<div class="text-right"> <!-- to asign button to right -->
										<br />
										<button type="button" data-toggle="modal" data-target="#myCategoryModal" class="btn btn-warning btn-xs">
										       Add Category</button>
									</div>
								</c:if>

							</div>
						</div>

						<div class="form-group">
							<div class="col-md-offset-4 col-md-8">
								<input type="submit" name="submit" id="submit" value="Submit" class="btn btn-primary" />
								<!-- Hidden fields for products -->
								<sf:hidden path="id" />
								<sf:hidden path="code" />
								<sf:hidden path="supplierId" />
								<sf:hidden path="active" />
								<sf:hidden path="purchases" />
								<sf:hidden path="views" />
							</div>
						</div>

					</sf:form>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-xs-12"></div>
		<h3>Available Products</h3>
		<hr />
		<div class="col-xs-12">
			<div class="container-fluid">

				<div class="table-responsive">
					<div style="overflow: auto">

						<!-- Product Table for admin  -->
						<table id="adminProductsTable"
							class="table table-striped table-borderd">


							<thead>

								<tr>
									<th>ID</th>
									<th>&#160;</th>
									<th>Brand</th>
									<th>Name</th>
									<th>Quantity</th>
									<th>Unit Price</th>
									<th>Active</th>
									<th>Edit</th>

								</tr>

							</thead>

							<%-- <tbody>
							
								<tr>
									<td>4</td>
									<td>
										<img class="adminDataTableImg" src="${contextRoot}/resources/images/PRDMNO123PQRX.jpg" alt="Macbook Pro" />
									</td>
									<td>Macbook Pro</td>
									<td>3</td>
									<td>&#8377; 54000.00/-</td>								
									<td><!-- togal Switch to activate or deactivate product  -->
									
										<label class="switch"> 
											<input type="checkbox" checked="checked" value="4" />
											<div class="slider"></div>
											
										</label>
									</td>
									<td>
										<a href="${contextRoot}/manage/4/product" class="btn btn-warning">
											<span class="glyphicon glyphicon-pencil"></span>
										</a>
									</td>
								</tr>


								<tr>
									<td>4</td>
									<td>
										<img class="adminDataTableImg" src="${contextRoot}/resources/images/PRDMNO123PQRX.jpg" alt="Macbook Pro" />
									</td>
									<td>Macbook Pro</td>
									<td>3</td>
									<td>&#8377; 54000.00/-</td>
									<!-- togal Switch to activate or deactivate product  -->
									<td>
										<label class="switch">
											 <input type="checkbox" value="4" />
											 <div class="slider"></div>
										</label>
									</td>
									<td>
										<a href="${contextRoot}/manage/4/product" class="btn btn-warning">
									   		 <span class="glyphicon glyphicon-pencil"></span>
										</a>
								  </td>
								</tr>
							</tbody> --%>
							<tfoot>
								<tr>
									<th>ID</th>
									<th>&#160;</th>
									<th>Brand</th>
									<th>Name</th>
									<th>Quantity</th>
									<th>Unit Price</th>
									<th>Active</th>
									<th>Edit</th>

								</tr>

							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>


<!-- category dialogue box  -->
	<div class="modal fade" id="myCategoryModal" role="dialog" tabindex="-1">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
			<!-- Nodal Header  -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
					<h4 class="modal-title">Add New Category</h4>
				</div>
				<div class="modal-body">
				  <!-- Category Form  -->
				  <sf:form id="categoryForm" modelAttribute="category" action="${contextRoot}/manage/category" method="POST" class="form-horizontal">
				    
				    <div class="form-group">
							<label class="control-label col-md-4" for="category_name">Enter Category Name: </label>
							<div class="col-md-8">
								<sf:input type="text" path="name" id="category_name" placeholder="Category Name" class="form-control" />
								<sf:errors path="name" cssClass="help-block" element="em" />
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4" for="category_description">Category Description: </label>
							<div class="col-md-8">
								<sf:textarea path="description" id="category_description" rows="4" placeholder="Write a description for the Category!" class="form-control" />
								<sf:errors path="description" cssClass="help-block" element="em" />
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-md-offset-4 col-md-8">
								<input type="submit" name="submit" id="submit" value="Add Category" class="btn btn-primary" />
							</div>
						</div>
				  </sf:form>
				</div>
			</div>
		</div>
	</div>
	
	
</div> <!-- Container closed  -->
