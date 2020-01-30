<%@ Page Language="VB" Title="Group-Admin" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeFile="group-admin.aspx.vb" Inherits="group_admin" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
	<%-------------------------------------Data Source-------------------------------------------%>
	<asp:AccessDataSource
		ID="ADSStudents"
		runat="server"
		DataFile="~/App_LocalResources/value.mdb"
		DeleteCommand="DELETE FROM [Students] WHERE [ID] = ?"
		InsertCommand="INSERT INTO [Students] ([status], [studentName], [facultyID], [StudentNumber]) VALUES (?, ?, ?, ?)"
		SelectCommand="SELECT * FROM [Students]"
		UpdateCommand="UPDATE [Students] SET [status] = ?, [studentName] = ?, [facultyID] = ?, [StudentNumber] = ? WHERE [ID] = ?">
		<DeleteParameters>
			<asp:Parameter Name="ID" Type="Int32" />
		</DeleteParameters>
		<InsertParameters>
			<asp:Parameter Name="status" Type="String" />
			<asp:Parameter Name="studentName" Type="String" />
			<asp:Parameter Name="facultyID" Type="String" />
			<asp:Parameter Name="StudentNumber" Type="Int32" />
		</InsertParameters>
		<UpdateParameters>
			<asp:Parameter Name="status" Type="String" />
			<asp:Parameter Name="studentName" Type="String" />
			<asp:Parameter Name="facultyID" Type="String" />
			<asp:Parameter Name="ID" Type="Int32" />
		</UpdateParameters>
	</asp:AccessDataSource>
	<asp:AccessDataSource
		ID="ADSStatus"
		runat="server"
		DataFile="~/App_LocalResources/value.mdb"
		SelectCommand="SELECT [statusID], [statusName] FROM [StudentStatus]"></asp:AccessDataSource>
	<asp:AccessDataSource
		ID="ADSFaculty"
		runat="server"
		DataFile="~/App_LocalResources/value.mdb"
		SelectCommand="SELECT [facultyID], [facultyName] FROM [FacultyType]"></asp:AccessDataSource>
	<%-------------------------------------Data Source-------------------------------------------%>
	<div class="img-rounded gap-ub">
		<div class="row">
			<div class="col-lg-2">
			</div>
			<div class="col-lg-8">
				<h1 class="text-center">Group-Admin Page</h1>
				<br />
				<asp:FormView
					ID="FVUpdate"
					runat="server"
					DataKeyNames="ID"
					DataSourceID="ADSStudents"
					CssClass="aspnet100"
					BorderStyle="None">
					<InsertItemTemplate>
						<b>Status:</b>
						<asp:DropDownList
							ID="ddlStatus"
							runat="server"
							DataSourceID="ADSStatus"
							DataTextField="statusName"
							DataValueField="statusName"
							SelectedValue='<%# Bind("status") %>'
							CssClass="form-control">
						</asp:DropDownList>
						<br />
						<asp:RequiredFieldValidator
							runat="server"
							ControlToValidate="studentName"
							ErrorMessage="* Student name is required. *"
							ValidationGroup="Add"
							Text="*" CssClass="error">
						</asp:RequiredFieldValidator>
						<asp:RegularExpressionValidator
							runat="server"
							ControlToValidate="studentName"
							ErrorMessage="Student name must be 2-20 characters."
							ValidationExpression=".{2,20}"
							ValidationGroup="Add"
							Text="*" CssClass="error">
						</asp:RegularExpressionValidator>
						<b>Student Name:</b>
						<asp:TextBox
							ID="studentName"
							runat="server"
							Text='<%# Bind("studentName") %>'
							CssClass="form-control"
							ValidationGroup="Add" />
						<br />
						<b>Faculty:</b>
						<asp:DropDownList
							ID="ddlFaculty"
							runat="server"
							DataSourceID="ADSFaculty"
							DataTextField="facultyName"
							DataValueField="facultyID"
							SelectedValue='<%# Bind("facultyID") %>'
							CssClass="form-control">
						</asp:DropDownList>
						<br />
						<b>Student Number:</b>
						<asp:TextBox
							ID="txtStudentNumber"
							runat="server"
							Text='<%# Bind("studentNumber") %>'
							CssClass="form-control"
							ValidationGroup="Add" 
							MaxLength="4"/>
								<asp:RequiredFieldValidator
									runat="server"
									ControlToValidate="txtStudentNumber"
									ErrorMessage="* Student Number is required. *"
									ValidationGroup="Add"
									CssClass="error"
									Text="*">
								</asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator
									ID="RegularExpressionValidator2"
									ControlToValidate="txtStudentNumber"
									runat="server"
									ErrorMessage="* Only Numbers allowed *."
									ValidationExpression="\d+"
									ValidationGroup="Add"
									CssClass="error"
									Text="*">
								</asp:RegularExpressionValidator>
								<asp:RangeValidator
									ID="Rangevalidator1"
									ErrorMessage="* Please enter value between 1000-9999. *"
									ControlToValidate="txtStudentNumber"
									MinimumValue="1000"
									MaximumValue="9999"
									runat="server"
									Type="Integer"
									ValidationGroup="Add"
									CssClass="error"
									Text="*">
								</asp:RangeValidator>
						<br />
						<asp:ValidationSummary
							DisplayMode="BulletList"
							EnableClientScript="true"
							runat="server"
							ValidationGroup="Add"
							ShowSummary="true"
							Font-Bold="true" CssClass="validationSummary" />
						<asp:LinkButton
							ID="InsertButton"
							runat="server"
							CommandName="Insert"
							Text="Insert"
							CssClass="btn btn-primary form-control" ValidationGroup="Add" />
						<asp:LinkButton
							ID="UpdateCancelButton"
							runat="server"
							CommandName="Cancel"
							Text="Cancel"
							CssClass="btn btn-warning form-control" />
					</InsertItemTemplate>
					<ItemTemplate>
						<asp:LinkButton
							ID="NewButton"
							runat="server"
							CommandName="New"
							Text="+ New Record"
							CssClass="btn btn-info" Width="100%" />
					</ItemTemplate>
				</asp:FormView>
				<br />
				<asp:GridView
					ID="GridView1"
					runat="server"
					AutoGenerateColumns="False"
					DataKeyNames="ID"
					DataSourceID="ADSStudents"
					CssClass="table table-striped text-center aspnet100"
					BorderStyle="None"
					FooterStyle-BackColor="LightGray"
					GridLines="None"
					AllowSorting="True"
					AllowPaging="true"
					PageSize="15">
					<Columns>
						<asp:TemplateField HeaderText="Status" SortExpression="status">
							<EditItemTemplate>
								<asp:DropDownList
									ID="ddlStatus"
									runat="server"
									DataSourceID="ADSStatus"
									DataTextField="statusName"
									DataValueField="statusName"
									AutoPostBack="true"
									SelectedValue='<%# Bind("status") %>'
									CssClass="form-control text-center">
								</asp:DropDownList>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:DropDownList
									ID="ddlStatus"
									runat="server"
									DataSourceID="ADSStatus"
									DataTextField="statusName"
									DataValueField="statusName"
									AutoPostBack="true"
									SelectedValue='<%# Bind("status") %>'
									CssClass="form-control text-center"
									Enabled="false">
								</asp:DropDownList>
							</ItemTemplate>
							<HeaderStyle CssClass="aspText" />
							<ItemStyle Width="20%" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Student Name" SortExpression="studentName">
							<EditItemTemplate>
								<%--								Edit Textbox Validation Area--%>
								<asp:TextBox
									ID="txtStudentName"
									runat="server"
									Text='<%# Bind("studentName") %>'
									CssClass="form-control text-center"
									MaxLength="50">
								</asp:TextBox>
								<asp:RequiredFieldValidator
									runat="server"
									ControlToValidate="txtStudentName"
									ErrorMessage="* Student name is required. *"
									ValidationGroup="Edit" CssClass="error">
								</asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator
									runat="server"
									ControlToValidate="txtStudentName"
									ErrorMessage="* Student name must be 2-20 characters. *"
									ValidationExpression=".{2,20}"
									ValidationGroup="Edit" CssClass="error" />
								<%--								Textbox Validation Area--%>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="Label3"
									runat="server"
									Text='<%# Bind("studentName") %>'>
								</asp:Label>
							</ItemTemplate>
							<HeaderStyle CssClass="aspText" />
							<ItemStyle Width="30%" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Faculty" SortExpression="facultyID">
							<EditItemTemplate>
								<asp:DropDownList
									ID="ddlFaculty"
									runat="server"
									DataSourceID="ADSFaculty"
									DataTextField="facultyName"
									DataValueField="facultyID"
									AutoPostBack="true"
									SelectedValue='<%# Bind("facultyID") %>'
									CssClass="form-control text-center">
								</asp:DropDownList>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:DropDownList
									ID="ddlFaculty"
									runat="server"
									DataSourceID="ADSFaculty"
									DataTextField="facultyName"
									DataValueField="facultyID"
									AutoPostBack="true"
									SelectedValue='<%# Bind("facultyID") %>'
									CssClass="form-control text-center"
									Enabled="false">
								</asp:DropDownList>
							</ItemTemplate>
							<HeaderStyle CssClass="aspText" />
							<ItemStyle Width="20%" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Student No." SortExpression="StudentNumber">
							<EditItemTemplate>
								<%--								Edit Textbox Validation Area--%>
								<asp:TextBox
									ID="txtStudentNumber"
									runat="server"
									Text='<%# Bind("StudentNumber") %>'
									CssClass="form-control text-center"
									MaxLength="4">
								</asp:TextBox>
								<asp:RequiredFieldValidator
									runat="server"
									ControlToValidate="txtStudentNumber"
									ErrorMessage="* Student Number is required. *"
									ValidationGroup="Edit"
									CssClass="error">
								</asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator
									ID="RegularExpressionValidator2"
									ControlToValidate="txtStudentNumber"
									runat="server"
									ErrorMessage="* Only Numbers allowed *."
									ValidationExpression="\d+"
									ValidationGroup="Edit"
									CssClass="error">
								</asp:RegularExpressionValidator>
								<asp:RangeValidator
									ID="Rangevalidator1"
									ErrorMessage="* Please enter value between 1000-9999. *"
									ControlToValidate="txtStudentNumber"
									MinimumValue="1000"
									MaximumValue="9999"
									runat="server"
									Type="Integer"
									ValidationGroup="Edit"
									CssClass="error">
								</asp:RangeValidator>
								<%--								Textbox Validation Area--%>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="LblStudentNumber"
									runat="server"
									Text='<%# Bind("StudentNumber") %>'
									MaxLength="4">
								</asp:Label>
							</ItemTemplate>
							<HeaderStyle CssClass="aspText" />
							<ItemStyle Width="20%" />
						</asp:TemplateField>
						<asp:CommandField
							ShowEditButton="True"
							ButtonType="Button"
							ItemStyle-Width="5%"
							ControlStyle-CssClass="btn btn-default"
							ValidationGroup="Edit" />
						<asp:CommandField
							ShowDeleteButton="True"
							ButtonType="Button"
							ItemStyle-Width="5%"
							ControlStyle-CssClass="btn btn-danger" />
					</Columns>
					<PagerStyle CssClass="pagination-ys" HorizontalAlign="Center"></PagerStyle>
				</asp:GridView>
			</div>
			<div class="col-lg-2"></div>
		</div>
	</div>
</asp:Content>

