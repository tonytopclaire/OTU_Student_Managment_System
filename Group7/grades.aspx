<%@ Page Language="VB" Title="Student Grades" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeFile="grades.aspx.vb" Inherits="grades" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
	<%-------------------------------------Data Source-------------------------------------------%>
	<asp:AccessDataSource
		ID="ADSCurrent"
		runat="server"
		DataFile="~/App_LocalResources/value.mdb"
		SelectCommand="SELECT * FROM [Students] WHERE [status] = 'CURRENT'"></asp:AccessDataSource>
	<%-------------------------------------Data Source-------------------------------------------%>
	<div class="container text-center gap-ub">
		<div class="alert alert-danger">
			<h1 class="hovereffect">Current-Students Grades</h1>
		</div>
		<asp:GridView
			ID="GVCurrent"
			runat="server"
			AutoGenerateColumns="False"
			DataKeyNames="StudentNumber"
			DataSourceID="ADSCurrent"
			CssClass="table table-striped text-center"
			BorderStyle="None"
			AllowSorting="True"
			GridLines="None">
			<Columns>
				<asp:TemplateField HeaderText="Name." SortExpression="StudentNumber">
					<ItemTemplate>
						<asp:Label ID="Label1" runat="server" Text='<%# Bind("StudentName") %>'></asp:Label>
					</ItemTemplate>
					<HeaderStyle CssClass="aspText" />
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Faculty" SortExpression="facultyID">
					<ItemTemplate>
						<asp:Label ID="Label1" runat="server" Text='<%# Bind("facultyID") %>'></asp:Label>
					</ItemTemplate>
					<HeaderStyle CssClass="aspText" />
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Midterm" SortExpression="Midterm">
					<ItemTemplate>
						<asp:Label ID="Label2" runat="server" Text='<%# Bind("Midterm") %>'></asp:Label>
					</ItemTemplate>
					<HeaderStyle CssClass="aspText" />
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Final" SortExpression="Final">
					<ItemTemplate>
						<asp:Label ID="Label3" runat="server" Text='<%# Bind("Final") %>'></asp:Label>
					</ItemTemplate>
					<HeaderStyle CssClass="aspText" />
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Quizs" SortExpression="Quizs">
					<ItemTemplate>
						<asp:Label ID="Label4" runat="server" Text='<%# Bind("Quizs") %>'></asp:Label>
					</ItemTemplate>
					<HeaderStyle CssClass="aspText" />
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Assignments" SortExpression="Assignments">
					<ItemTemplate>
						<asp:Label ID="Label5" runat="server" Text='<%# Bind("Assignments") %>'></asp:Label>
					</ItemTemplate>
					<HeaderStyle CssClass="aspText" />
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Final Project" SortExpression="Final Project">
					<ItemTemplate>
						<asp:Label ID="Label6" runat="server" Text='<%# Bind("[Final_Project]") %>'></asp:Label>
					</ItemTemplate>
					<HeaderStyle CssClass="aspText" />
				</asp:TemplateField>
				<asp:TemplateField HeaderText="GPA" SortExpression="GPA">
					<ItemTemplate>
						<asp:Label ID="Label7" runat="server" Text='<%# Bind("GPA") %>'></asp:Label>
					</ItemTemplate>
					<HeaderStyle CssClass="aspText" />
				</asp:TemplateField>
			</Columns>
		</asp:GridView>
	</div>
</asp:Content>


