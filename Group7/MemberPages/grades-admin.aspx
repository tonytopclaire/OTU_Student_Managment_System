<%@ Page Language="VB" Title="Student Grades - Admin" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeFile="grades-admin.aspx.vb" Inherits="grades_admin" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
	<%-------------------------------------Data Source-------------------------------------------%>
	<asp:AccessDataSource
		ID="ADSCurrent"
		runat="server"
		DataFile="~/App_LocalResources/value.mdb"
		SelectCommand="SELECT * FROM [Students] WHERE [status] = 'CURRENT'"
		DeleteCommand="DELETE FROM [Students] WHERE [StudentNumber] = ?"
		InsertCommand="INSERT INTO [Students] ([StudentNumber], [Midterm], [Final], [Quizs], [Assignments], [Final_Project], [GPA]) VALUES (?, ?, ?, ?, ?, ?, ?)"
		UpdateCommand="UPDATE [Students] SET [Midterm] = ?, [Final] = ?, [Quizs] = ?, [Assignments] = ?, [Final_Project] = ?, [GPA] = ? WHERE [StudentNumber] = ?">
		<DeleteParameters>
			<asp:Parameter Name="StudentNumber" Type="String" />
		</DeleteParameters>
		<UpdateParameters>
			<asp:Parameter Name="Midterm" Type="String" />
			<asp:Parameter Name="Final" Type="Int32" />
			<asp:Parameter Name="Quizs" Type="Int32" />
			<asp:Parameter Name="Assignments" Type="Int32" />
			<asp:Parameter Name="Final_Project" Type="Int32" />
			<asp:Parameter Name="GPA" Type="String" />
			<asp:Parameter Name="StudentNumber" Type="String" />
		</UpdateParameters>
	</asp:AccessDataSource>
	<asp:AccessDataSource
		ID="ADSGPA"
		runat="server"
		DataFile="~/App_LocalResources/value.mdb"
		SelectCommand="SELECT [ID], [GPA] FROM [GPA]"></asp:AccessDataSource>
	<%-------------------------------------Data Source-------------------------------------------%>
	<div class="asp100 text-center gap-ub">
		<div class="row">
			<div class="col-lg-1"></div>
			<div class="col-lg-10">
				<div class="alert alert-danger">
					<h1 class="hovereffect">Current-Students Grades Admin</h1>
				</div>
				<asp:GridView
					ID="GridView1"
					runat="server"
					AllowSorting="True"
					AutoGenerateColumns="False"
					DataKeyNames="StudentNumber"
					DataSourceID="ADSCurrent"
					CssClass="table table-striped text-center aspnet100"
					BorderStyle="None"
					FooterStyle-BackColor="LightGray"
					GridLines="None"
					AllowPaging="true"
					PageSize="15">
					<Columns>
						<asp:TemplateField HeaderText="Student Name" SortExpression="StudentName">
							<EditItemTemplate>
								<asp:Label ID="lblStudentNameE" runat="server" Text='<%# Eval("StudentName") %>' Enabled="false" CssClass="text-center"></asp:Label>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="lblStudentNameI" runat="server" Text='<%# Eval("StudentName") %>' Enabled="false" CssClass="text-center"></asp:Label>
							</ItemTemplate>
							<ItemStyle Width="15%" />
							<HeaderStyle CssClass="aspText" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Faculty" SortExpression="Faculty">
							<EditItemTemplate>
								<asp:Label ID="lblFacultyE" runat="server" Text='<%# Eval("facultyID") %>' Enabled="false" CssClass="text-center"></asp:Label>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="LlblFacultyI" runat="server" Text='<%# Bind("facultyID") %>'></asp:Label>
							</ItemTemplate>
							<ItemStyle Width="10%" />
							<HeaderStyle CssClass="aspText" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Student No." SortExpression="StudentNumber">
							<EditItemTemplate>
								<asp:Label ID="LblStudentNumberE" runat="server" Text='<%# Eval("StudentNumber") %>' Enabled="false" CssClass="text-center"></asp:Label>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="lblStudentNumberI" runat="server" Text='<%# Bind("StudentNumber") %>' CssClass="text-center" MaxLength="4"></asp:Label>
							</ItemTemplate>
							<ItemStyle Width="10%" />
							<HeaderStyle CssClass="aspText" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Midterm" SortExpression="Midterm">
							<EditItemTemplate>
								<asp:TextBox ID="txtMidterm" runat="server" Text='<%# Bind("Midterm") %>' CssClass="form-control text-center"></asp:TextBox>
								<asp:RequiredFieldValidator
									runat="server"
									ControlToValidate="txtMidterm"
									ErrorMessage="* Midterm grade is required. *"
									ValidationGroup="Edit"
									CssClass="error"
									Text="*">
								</asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator ID="RegularExpressionValidator1"
									ControlToValidate="txtMidterm" runat="server"
									ErrorMessage="* Only Numbers allowed *."
									ValidationExpression="\d+"
									ValidationGroup="Edit"
									Text="*"
									CssClass="error">
								</asp:RegularExpressionValidator>
								<asp:RangeValidator
									ID="Rangevalidator0"
									ErrorMessage="* Please enter value between 0-100. *"
									ControlToValidate="txtMidterm"
									MinimumValue="0"
									MaximumValue="100"
									runat="server"
									Type="Integer"
									ValidationGroup="Edit"
									Text="*"
									CssClass="error">
								</asp:RangeValidator>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="Label2" runat="server" Text='<%# Bind("Midterm") %>' CssClass="text-center" MaxLength="3"></asp:Label>
							</ItemTemplate>
							<ItemStyle Width="5%" />
							<HeaderStyle CssClass="aspText" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Final" SortExpression="Final">
							<EditItemTemplate>
								<asp:TextBox ID="txtFinal" runat="server" Text='<%# Bind("Final") %>' CssClass="form-control text-center"></asp:TextBox>
								<asp:RequiredFieldValidator
									runat="server"
									ControlToValidate="txtFinal"
									ErrorMessage="* Final grade is required. *"
									ValidationGroup="Edit"
									CssClass="error"
									Text="*">
								</asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator
									ID="RegularExpressionValidator2"
									ControlToValidate="txtFinal"
									runat="server"
									ErrorMessage="* Only Numbers allowed *."
									ValidationExpression="\d+"
									ValidationGroup="Edit"
									Text="*"
									CssClass="error">
								</asp:RegularExpressionValidator>
								<asp:RangeValidator ID="Rangevalidator1"
									ErrorMessage="* Please enter value between 0-100. *"
									ControlToValidate="txtFinal"
									MinimumValue="0"
									MaximumValue="100"
									runat="server"
									Type="Integer"
									ValidationGroup="Edit"
									Text="*"
									CssClass="error">
								</asp:RangeValidator>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="Label3" runat="server" Text='<%# Bind("Final") %>' CssClass="text-center" MaxLength="3"></asp:Label>
							</ItemTemplate>
							<ItemStyle Width="5%" />
							<HeaderStyle CssClass="aspText" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Quizs" SortExpression="Quizs">
							<EditItemTemplate>
								<asp:TextBox ID="txtQuizs" runat="server" Text='<%# Bind("Quizs") %>' CssClass="form-control text-center"></asp:TextBox>
								<asp:RequiredFieldValidator
									runat="server"
									ControlToValidate="txtQuizs"
									ErrorMessage="* Quizs grade is required. *"
									ValidationGroup="Edit"
									CssClass="error"
									Text="*">
								</asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator
									ID="RegularExpressionValidator3"
									ControlToValidate="txtQuizs"
									runat="server"
									ErrorMessage="* Only Numbers allowed *."
									ValidationExpression="\d+"
									Text="*"
									CssClass="error">
								</asp:RegularExpressionValidator>
								<asp:RangeValidator
									ID="Rangevalidator2"
									ErrorMessage="* Please enter value between 0-100. *"
									ControlToValidate="txtQuizs"
									MinimumValue="0"
									MaximumValue="100"
									runat="server"
									Type="Integer"
									ValidationGroup="Edit"
									Text="*"
									CssClass="error">
								</asp:RangeValidator>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="Label4" runat="server" Text='<%# Bind("Quizs") %>' CssClass="text-center" MaxLength="3"></asp:Label>
							</ItemTemplate>
							<ItemStyle Width="5%" />
							<HeaderStyle CssClass="aspText" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Assignments" SortExpression="Assignments">
							<EditItemTemplate>
								<asp:TextBox ID="txtAssignments" runat="server" Text='<%# Bind("Assignments") %>' CssClass="form-control text-center"></asp:TextBox>
								<asp:RequiredFieldValidator
									runat="server"
									ControlToValidate="txtAssignments"
									ErrorMessage="* Assignment grades is required. *"
									ValidationGroup="Edit"
									CssClass="error"
									Text="*">
								</asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator
									ID="RegularExpressionValidator4"
									ControlToValidate="txtAssignments"
									runat="server"
									ErrorMessage="* Only Numbers allowed *."
									ValidationExpression="\d+"
									ValidationGroup="Edit"
									Text="*"
									CssClass="error">
								</asp:RegularExpressionValidator>
								<asp:RangeValidator
									ID="Rangevalidator3"
									ErrorMessage="* Please enter value between 0-100. *"
									ControlToValidate="txtAssignments"
									MinimumValue="0"
									MaximumValue="100"
									runat="server"
									Type="Integer"
									ValidationGroup="Edit"
									Text="*"
									CssClass="error">
								</asp:RangeValidator>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="Label5" runat="server" Text='<%# Bind("Assignments") %>' CssClass="text-center" MaxLength="3"></asp:Label>
							</ItemTemplate>
							<ItemStyle Width="5%" />
							<HeaderStyle CssClass="aspText" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Final_Project" SortExpression="Final_Project">
							<EditItemTemplate>
								<asp:TextBox ID="txtProject" runat="server" Text='<%# Bind("Final_Project") %>' CssClass="form-control text-center"></asp:TextBox>
								<asp:RequiredFieldValidator
									runat="server"
									ControlToValidate="txtProject"
									ErrorMessage="* Final Project grade is required. *"
									ValidationGroup="Edit"
									Text="*"
									CssClass="error">
								</asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator
									ID="RegularExpressionValidator5"
									ControlToValidate="txtProject"
									runat="server"
									ErrorMessage="* Only Numbers allowed. *"
									ValidationExpression="\d+"
									Text="*" CssClass="error">
								</asp:RegularExpressionValidator>
								<asp:RangeValidator
									ID="Rangevalidator4"
									ErrorMessage="* Please enter value between 0-100. *"
									ControlToValidate="txtProject"
									MinimumValue="0"
									MaximumValue="100"
									runat="server"
									Type="Integer"
									ValidationGroup="Edit"
									Text="*"
									CssClass="error">
								</asp:RangeValidator>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="Label7" runat="server" Text='<%# Bind("Final_Project") %>' CssClass="text-center" MaxLength="3"></asp:Label>
							</ItemTemplate>
							<ItemStyle Width="5%" />
							<HeaderStyle CssClass="aspText" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="GPA" SortExpression="GPA">
							<EditItemTemplate>
								<asp:DropDownList
									ID="ddlGPAE"
									runat="server"
									DataSourceID="ADSGPA"
									DataTextField="GPA"
									DataValueField="GPA"
									SelectedValue='<%# Bind("GPA") %>'
									CssClass="form-control">
								</asp:DropDownList>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:DropDownList
									ID="ddlGPAI"
									runat="server"
									DataSourceID="ADSGPA"
									DataTextField="GPA"
									DataValueField="GPA"
									SelectedValue='<%# Bind("GPA") %>'
									CssClass="form-control"
									Enabled="false">
								</asp:DropDownList>
							</ItemTemplate>
							<ItemStyle Width="10%" />
							<HeaderStyle CssClass="aspText" />
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
				<asp:ValidationSummary
					DisplayMode="BulletList"
					EnableClientScript="true"
					runat="server"
					ValidationGroup="Edit"
					ShowSummary="true"
					Font-Bold="true" CssClass="validationSummary" />
			</div>
			<div class="col-lg-1"></div>
		</div>
	</div>
</asp:Content>
