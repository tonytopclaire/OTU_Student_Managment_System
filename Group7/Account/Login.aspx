<%@ Page Title="Log in" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Login.aspx.vb" Inherits="Account_Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
	<div class="container img-rounded gap-ub">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<h1 class="text-center">Login Platform</h1>
				<h4 class="text-center">Use local accounts to login.</h4>
				<hr />
				<section id="loginForm">
					<div class="form-horizontal">
						<asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
							<p class="text-danger">
								<asp:Literal runat="server" ID="FailureText" />
							</p>
						</asp:PlaceHolder>
						<div class="form-group">
							<asp:Label runat="server" AssociatedControlID="UserName" CssClass="control-label">User Name</asp:Label>
							<asp:TextBox runat="server" ID="UserName" CssClass="form-control" />
							<asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
								CssClass="error" ErrorMessage="The user name field is required." />
						</div>
						<div class="form-group">
							<asp:Label runat="server" AssociatedControlID="Password" CssClass="control-label">Password</asp:Label>
							<asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
							<asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="error" ErrorMessage="The password field is required." />
						</div>
						<div class="form-group">
							<div class="checkbox">
								<asp:CheckBox runat="server" ID="RememberMe" />
								<asp:Label runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
							</div>
						</div>
						<div class="form-group">
							<asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-primary form-control" />
							<asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled" CssClass="btn btn-default form-control">Register</asp:HyperLink>
						</div>
					</div>
				</section>
			</div>
			<div class="col-md-4">
				<section id="socialLoginForm">
					<uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" Visible="false" />
				</section>
			</div>
		</div>
	</div>
</asp:Content>

