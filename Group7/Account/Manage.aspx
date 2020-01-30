<%@ Page Title="Manage Account" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Manage.aspx.vb" Inherits="Account_Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

	<div class="container img-rounded gap-ub">
		<h1 class="text-center">Management Platform</h1>
		<h3 class="text-center">You're logged in as <strong><%: User.Identity.GetUserName() %></strong>.</h3>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<br />
				<asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
					<h2 class="text-success text-center"><%: SuccessMessageText %></h2>
				</asp:PlaceHolder>
				<h3>It has <span class="error">[3 admin pages</span> to update, delete and insert data. All pages are located in MemberPages folder and it <span class="error">[cannot be access]</span> without log in.</h3>
				<br />
				<h3>4 <span class="error">[front pages]</span> to diplay content from database.</h3> 
				<br />
				<h3>3 <span class="error">[admin pages]</span> used for login, register and account management. Aaccount management <span class="error">[cannot be access]</span> without log in.</h3>
				<br />
				<h3>1 <span class="error">[master file]</span> to implement css to all pages.</h3>
				<br />
				<h3>2 <span class="error">[databases]</span>, one is access database to store normal data, the other one secured SQL server to store user accounts only.</h3>
				<br />
				<div class="row">
						<div class="col-md-3"><a runat="server" href="~/MemberPages/group-admin" class="btn btn-default form-control" target="_blank" style="height: 100%;">Status-Admin</a></div>
						<div class="col-md-3"><a runat="server" href="~/MemberPages/attendance-admin" class="btn btn-default form-control" target="_blank">Attendance-Admin</a></div>
						<div class="col-md-3"><a runat="server" href="~/MemberPages/grades-admin" class="btn btn-default form-control" target="_blank">Grades-Admin</a></div>
						<div class="col-md-3"><a runat="server" href="~/MemberPages/news-admin" class="btn btn-default form-control" target="_blank">News-Admin</a></div>
				</div>
				<section id="passwordForm" >
					<asp:PlaceHolder runat="server" ID="setPassword" Visible="false">
						<p>
							You do not have a local password for this site. Add a local
                        password so you can log in without an external login.
						</p>
						<div class="aspnet100">
							<h4>Set Password Form</h4>
							<hr />
							<div class="form-group">
								<asp:Label runat="server" AssociatedControlID="password" CssClass="control-label">Password</asp:Label>
								<asp:TextBox runat="server" ID="password" TextMode="Password" CssClass="form-control" />
								<asp:RequiredFieldValidator runat="server" ControlToValidate="password"
									CssClass="text-danger" ErrorMessage="The password field is required."
									Display="Dynamic" ValidationGroup="SetPassword" />
								<asp:ModelErrorMessage runat="server" ModelStateKey="NewPassword" AssociatedControlID="password"
									CssClass="text-danger" SetFocusOnError="true" />
							</div>
							<div class="form-group">
								<asp:Label runat="server" AssociatedControlID="confirmPassword" CssClass="control-label">Confirm password</asp:Label>
								<asp:TextBox runat="server" ID="confirmPassword" TextMode="Password" CssClass="form-control" />
								<asp:RequiredFieldValidator runat="server" ControlToValidate="confirmPassword"
									CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required."
									ValidationGroup="SetPassword" />
								<asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="confirmPassword"
									CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match."
									ValidationGroup="SetPassword" />
							</div>
							<div class="form-group">
								<div class="col-md-offset-2 col-md-10">
									<asp:Button runat="server" Text="Set Password" ValidationGroup="SetPassword" OnClick="SetPassword_Click" CssClass="btn btn-default" />
								</div>
							</div>
						</div>
					</asp:PlaceHolder>
					<br/>
										<br/>
					<asp:PlaceHolder runat="server" ID="changePasswordHolder" Visible="false">

						<div class="form-horizontal aspnet100">
							<h2 class="text-center">Change Password Form</h2>
							<hr />
							<asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
							<div class="form-group">
								<asp:Label runat="server" ID="CurrentPasswordLabel" AssociatedControlID="CurrentPassword" CssClass="control-label">Current Password</asp:Label><br />
								<asp:TextBox runat="server" ID="CurrentPassword" TextMode="Password" CssClass="form-control" />
								<asp:RequiredFieldValidator runat="server" ControlToValidate="CurrentPassword"
									CssClass="text-danger" ErrorMessage="The current password field is required."
									ValidationGroup="ChangePassword" />
							</div>
							<div class="form-group">
								<asp:Label runat="server" ID="NewPasswordLabel" AssociatedControlID="NewPassword" CssClass="control-label">New Password</asp:Label><br />
								<asp:TextBox runat="server" ID="NewPassword" TextMode="Password" CssClass="form-control" />
								<asp:RequiredFieldValidator runat="server" ControlToValidate="NewPassword"
									CssClass="text-danger" ErrorMessage="The new password is required."
									ValidationGroup="ChangePassword" />
							</div>
							<div class="form-group">
								<asp:Label runat="server" ID="ConfirmNewPasswordLabel" AssociatedControlID="ConfirmNewPassword" CssClass="control-label">Confirm New Password</asp:Label><br />
								<asp:TextBox runat="server" ID="ConfirmNewPassword" TextMode="Password" CssClass="form-control" />
								<asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmNewPassword"
									CssClass="text-danger" Display="Dynamic" ErrorMessage="Confirm new password is required."
									ValidationGroup="ChangePassword" />
								<asp:CompareValidator runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword"
									CssClass="text-danger" Display="Dynamic" ErrorMessage="The new password and confirmation password do not match."
									ValidationGroup="ChangePassword" />
							</div>
							<div class="form-group">
								<asp:Button runat="server" Text="Change Password" OnClick="ChangePassword_Click" CssClass="btn btn-primary form-control" ValidationGroup="ChangePassword" />
							</div>
						</div>
					</asp:PlaceHolder>
				</section>
				<section id="externalLoginsForm" hidden="hidden">
					<asp:ListView runat="server"
						ItemType="Microsoft.AspNet.Identity.UserLoginInfo"
						SelectMethod="GetLogins" DeleteMethod="RemoveLogin" DataKeyNames="LoginProvider,ProviderKey">
						<LayoutTemplate>
							<h4>Registered Logins</h4>
							<table class="table">
								<tbody>
									<tr runat="server" id="itemPlaceholder"></tr>
								</tbody>
							</table>
						</LayoutTemplate>
						<ItemTemplate>
							<tr>
								<td><%#: Item.LoginProvider %></td>
								<td>
									<asp:Button runat="server" Text="Remove" CommandName="Delete" CausesValidation="false"
										ToolTip='<%# "Remove this " + Item.LoginProvider + " login from your account" %>'
										Visible="<%# CanRemoveExternalLogins %>" CssClass="btn btn-default" />
								</td>
							</tr>
						</ItemTemplate>
					</asp:ListView>
					<uc:OpenAuthProviders runat="server" ReturnUrl="~/Account/Manage" />
				</section>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</asp:Content>
