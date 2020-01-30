<%@ Page Language="VB" Title="Student Attendance - Admin" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeFile="attendance-admin.aspx.vb" Inherits="MemberPages_attendance_admin" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
	<%-------------------------------------Data Source-------------------------------------------%>
	<asp:AccessDataSource
		ID="ADSCurrent"
		runat="server"
		DataFile="~/App_LocalResources/value.mdb"
		SelectCommand="SELECT * FROM [Students] WHERE [status] = 'CURRENT'"
		DeleteCommand="DELETE FROM [Students] WHERE [ID] = ?"
		InsertCommand="INSERT INTO [Students] ([ID], [status], [studentName], [facultyID], [StudentNumber], [Class_1], [Class_2], [Class_3], [Class_4], [Class_5], [Class_6], [Class_7], [Class_8], [Class_9], [Class_10]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
		UpdateCommand="UPDATE [Students] SET [status] = ?, [studentName] = ?, [facultyID] = ?, [StudentNumber] = ?, [Class_1] = ?, [Class_2] = ?, [Class_3] = ?, [Class_4] = ?, [Class_5] = ?, [Class_6] = ?, [Class_7] = ?, [Class_8] = ?, [Class_9] = ?, [Class_10] = ? WHERE [ID] = ?">
		<DeleteParameters>
			<asp:Parameter Name="ID" Type="Int32" />
		</DeleteParameters>
		<UpdateParameters>
			<asp:Parameter Name="status" Type="String" />
			<asp:Parameter Name="studentName" Type="String" />
			<asp:Parameter Name="facultyID" Type="String" />
			<asp:Parameter Name="StudentNumber" Type="String" />
			<asp:Parameter Name="Class_1" Type="Boolean" />
			<asp:Parameter Name="Class_2" Type="Boolean" />
			<asp:Parameter Name="Class_3" Type="Boolean" />
			<asp:Parameter Name="Class_4" Type="Boolean" />
			<asp:Parameter Name="Class_5" Type="Boolean" />
			<asp:Parameter Name="Class_6" Type="Boolean" />
			<asp:Parameter Name="Class_7" Type="Boolean" />
			<asp:Parameter Name="Class_8" Type="Boolean" />
			<asp:Parameter Name="Class_9" Type="Boolean" />
			<asp:Parameter Name="Class_10" Type="Boolean" />
			<asp:Parameter Name="ID" Type="Int32" />
		</UpdateParameters>
	</asp:AccessDataSource>
	<%-------------------------------------Data Source-------------------------------------------%>
	<div class="asp100 text-center gap-ub">
		<div class="row">
			<div class="col-lg-1"></div>
			<div class="col-lg-10">
				<div class="alert alert-danger">
					<h1 class="hovereffect">Current-Students Attendance Admin</h1>
				</div>
				<asp:GridView
					ID="GridView1"
					runat="server"
					AllowSorting="True"
					AutoGenerateColumns="False"
					DataKeyNames="ID"
					DataSourceID="ADSCurrent"
					CssClass="table table-striped text-center container"
					BorderStyle="None"
					FooterStyle-BackColor="LightGray"
					GridLines="None"
					AllowPaging="True"
					PageSize="15">
					<Columns>
						<asp:TemplateField HeaderText="Name" SortExpression="studentName">
							<EditItemTemplate>
								<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("studentName") %>' Enabled="false" CssClass="form-control text-center"></asp:TextBox>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="Label3" runat="server" Text='<%# Bind("studentName") %>'></asp:Label>
							</ItemTemplate>
							<HeaderStyle CssClass="aspText" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Faculty" SortExpression="facultyID">
							<EditItemTemplate>
								<asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("facultyID") %>' Enabled="false" CssClass="form-control text-center"></asp:TextBox>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="Label4" runat="server" Text='<%# Bind("facultyID") %>'></asp:Label>
							</ItemTemplate>
							<HeaderStyle CssClass="aspText" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Student No." SortExpression="StudentNumber">
							<EditItemTemplate>
								<asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("StudentNumber") %>' Enabled="false" CssClass="form-control text-center"></asp:TextBox>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="Label5" runat="server" Text='<%# Bind("StudentNumber") %>'></asp:Label>
							</ItemTemplate>
							<HeaderStyle CssClass="aspText" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Class_1" SortExpression="Class_1">
							<EditItemTemplate>
								<asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Class_1") %>' />
							</EditItemTemplate>
							<ItemTemplate>
								<asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Class_1") %>' Enabled="false" />
							</ItemTemplate>
							<HeaderStyle CssClass="aspText" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Class_2" SortExpression="Class_2">
							<EditItemTemplate>
								<asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("Class_2") %>' />
							</EditItemTemplate>
							<ItemTemplate>
								<asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("Class_2") %>' Enabled="false" />
							</ItemTemplate>
							<HeaderStyle CssClass="aspText" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Class_3" SortExpression="Class_3">
							<EditItemTemplate>
								<asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("Class_3") %>' />
							</EditItemTemplate>
							<ItemTemplate>
								<asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("Class_3") %>' Enabled="false" />
							</ItemTemplate>
							<HeaderStyle CssClass="aspText" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Class_4" SortExpression="Class_4">
							<EditItemTemplate>
								<asp:CheckBox ID="CheckBox4" runat="server" Checked='<%# Bind("Class_4") %>' />
							</EditItemTemplate>
							<ItemTemplate>
								<asp:CheckBox ID="CheckBox4" runat="server" Checked='<%# Bind("Class_4") %>' Enabled="false" />
							</ItemTemplate>
							<HeaderStyle CssClass="aspText" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Class_5" SortExpression="Class_5">
							<EditItemTemplate>
								<asp:CheckBox ID="CheckBox5" runat="server" Checked='<%# Bind("Class_5") %>' />
							</EditItemTemplate>
							<ItemTemplate>
								<asp:CheckBox ID="CheckBox5" runat="server" Checked='<%# Bind("Class_5") %>' Enabled="false" />
							</ItemTemplate>
							<HeaderStyle CssClass="aspText" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Class_6" SortExpression="Class_6">
							<EditItemTemplate>
								<asp:CheckBox ID="CheckBox6" runat="server" Checked='<%# Bind("Class_6") %>' />
							</EditItemTemplate>
							<ItemTemplate>
								<asp:CheckBox ID="CheckBox6" runat="server" Checked='<%# Bind("Class_6") %>' Enabled="false" />
							</ItemTemplate>
							<HeaderStyle CssClass="aspText" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Class_7" SortExpression="Class_7">
							<EditItemTemplate>
								<asp:CheckBox ID="CheckBox7" runat="server" Checked='<%# Bind("Class_7") %>' />
							</EditItemTemplate>
							<ItemTemplate>
								<asp:CheckBox ID="CheckBox7" runat="server" Checked='<%# Bind("Class_7") %>' Enabled="false" />
							</ItemTemplate>
							<HeaderStyle CssClass="aspText" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Class_8" SortExpression="Class_8">
							<EditItemTemplate>
								<asp:CheckBox ID="CheckBox8" runat="server" Checked='<%# Bind("Class_8") %>' />
							</EditItemTemplate>
							<ItemTemplate>
								<asp:CheckBox ID="CheckBox8" runat="server" Checked='<%# Bind("Class_8") %>' Enabled="false" />
							</ItemTemplate>
							<HeaderStyle CssClass="aspText" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Class_9" SortExpression="Class_9">
							<EditItemTemplate>
								<asp:CheckBox ID="CheckBox9" runat="server" Checked='<%# Bind("Class_9") %>' />
							</EditItemTemplate>
							<ItemTemplate>
								<asp:CheckBox ID="CheckBox9" runat="server" Checked='<%# Bind("Class_9") %>' Enabled="false" />
							</ItemTemplate>
							<HeaderStyle CssClass="aspText" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Class_10" SortExpression="Class_10">
							<EditItemTemplate>
								<asp:CheckBox ID="CheckBox10" runat="server" Checked='<%# Bind("Class_10") %>' />
							</EditItemTemplate>
							<ItemTemplate>
								<asp:CheckBox ID="CheckBox10" runat="server" Checked='<%# Bind("Class_10") %>' Enabled="false" />
							</ItemTemplate>
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
					<FooterStyle BackColor="LightGray"></FooterStyle>
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
