<%@ Page Title="Register" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Register.aspx.vb" Inherits="Account_Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

	<div class="container img-rounded gap-ub">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<p class="text-danger" hidden="hidden">
					<asp:Literal runat="server" ID="ErrorMessage" />
				</p>
				<h1 class="text-center">Register Platform</h1>
				<div class="form-horizontal">
					<h4 class="text-center">Create a new account.</h4>
					<br />
					<div class="form-group">
						<asp:Label runat="server" AssociatedControlID="UserName" CssClass="control-label">User Name</asp:Label>
						<asp:TextBox runat="server" ID="UserName" CssClass="form-control" />
						<asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
							CssClass="text-danger" ErrorMessage="The user name field is required." />
					</div>
					<div class="form-group">
						<asp:Label runat="server" AssociatedControlID="Password" CssClass="control-label">Password</asp:Label>
						<asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
						<asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
							CssClass="text-danger" ErrorMessage="The password field is required." />
					</div>
					<div class="form-group">
						<asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="control-label">Confirm Password</asp:Label>
						<asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
						<asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
							CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
						<asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
							CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
					</div>
					<div class="form-group">
						<asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-primary form-control" />
					</div>
				</div>
			</div>
			<div class="col-md-4"></div>
		</div>
	</div>
</asp:Content>

