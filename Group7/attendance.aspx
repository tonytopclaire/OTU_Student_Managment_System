<%@ Page Language="VB" Title="Student Attendance" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeFile="attendance.aspx.vb" Inherits="attendance" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
	<%-------------------------------------Data Source-------------------------------------------%>
	<asp:AccessDataSource
		ID="ADSCurrent"
		runat="server"
		DataFile="~/App_LocalResources/value.mdb"
		SelectCommand="SELECT [studentName], [facultyID], [Class_1], [Class_2], [Class_3], [Class_4], [Class_5], [Class_6], [Class_7], [Class_8], [Class_9], [Class_10] FROM [Students] WHERE [status] = 'CURRENT'"></asp:AccessDataSource>
	<%-------------------------------------Data Source-------------------------------------------%>
	<div class="container text-center gap-ub">
		<div class="alert alert-danger">
			<h1 class="hovereffect">Current-Students Attendance Marks</h1>
		</div>
		<asp:GridView
			ID="GVCurrent"
			runat="server"
			AutoGenerateColumns="False"
			DataSourceID="ADSCurrent"
			CssClass="table table-striped text-center"
			BorderStyle="None"
			AllowSorting="True"
			GridLines="None">
			<Columns>
				<asp:TemplateField HeaderText="Student Name" SortExpression="studentName">
					<ItemTemplate>
						<asp:Label ID="Label1" runat="server" Text='<%# Bind("studentName") %>'></asp:Label>
					</ItemTemplate>
					<HeaderStyle CssClass="aspText" />
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Faculty" SortExpression="facultyID">
					<ItemTemplate>
						<asp:Label ID="Label2" runat="server" Text='<%# Bind("facultyID") %>'></asp:Label>
					</ItemTemplate>
					<HeaderStyle CssClass="aspText" />
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Class_1" SortExpression="Class_1">
					<ItemTemplate>
						<asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Class_1") %>' Enabled="false" />
					</ItemTemplate>
					<HeaderStyle CssClass="aspText" />
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Class_2" SortExpression="Class_2">
					<ItemTemplate>
						<asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("Class_2") %>' Enabled="false" />
					</ItemTemplate>
					<HeaderStyle CssClass="aspText" />
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Class_3" SortExpression="Class_3">
					<ItemTemplate>
						<asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("Class_3") %>' Enabled="false" />
					</ItemTemplate>
					<HeaderStyle CssClass="aspText" />
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Class_4" SortExpression="Class_4">
					<ItemTemplate>
						<asp:CheckBox ID="CheckBox4" runat="server" Checked='<%# Bind("Class_4") %>' Enabled="false" />
					</ItemTemplate>
					<HeaderStyle CssClass="aspText" />
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Class_5" SortExpression="Class_5">
					<ItemTemplate>
						<asp:CheckBox ID="CheckBox5" runat="server" Checked='<%# Bind("Class_5") %>' Enabled="false" />
					</ItemTemplate>
					<HeaderStyle CssClass="aspText" />
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Class_6" SortExpression="Class_6">
					<ItemTemplate>
						<asp:CheckBox ID="CheckBox6" runat="server" Checked='<%# Bind("Class_6") %>' Enabled="false" />
					</ItemTemplate>
					<HeaderStyle CssClass="aspText" />
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Class_7" SortExpression="Class_7">
					<ItemTemplate>
						<asp:CheckBox ID="CheckBox7" runat="server" Checked='<%# Bind("Class_7") %>' Enabled="false" />
					</ItemTemplate>
					<HeaderStyle CssClass="aspText" />
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Class_8" SortExpression="Class_8">
					<ItemTemplate>
						<asp:CheckBox ID="CheckBox8" runat="server" Checked='<%# Bind("Class_8") %>' Enabled="false" />
					</ItemTemplate>
					<HeaderStyle CssClass="aspText" />
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Class_9" SortExpression="Class_9">
					<ItemTemplate>
						<asp:CheckBox ID="CheckBox9" runat="server" Checked='<%# Bind("Class_9") %>' Enabled="false" />
					</ItemTemplate>
					<HeaderStyle CssClass="aspText" />
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Class_10" SortExpression="Class_10">
					<ItemTemplate>
						<asp:CheckBox ID="CheckBox10" runat="server" Checked='<%# Bind("Class_10") %>' Enabled="false" />
					</ItemTemplate>
					<HeaderStyle CssClass="aspText" />
				</asp:TemplateField>
			</Columns>
		</asp:GridView>
	</div>
</asp:Content>


