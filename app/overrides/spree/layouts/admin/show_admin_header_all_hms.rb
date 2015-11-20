Deface::Override.new(:virtual_path => "spree/admin/shared/_header",
                     :name => "hide_roles_based_on_role_in_user_area",
                     :replace => "div.container-fluid") do
      '<div class="container-fluid">
      <div class="row">
        <div class="navbar-header col-sm-3 col-md-2">
          <%= link_to(
            image_tag(Spree::Config[:admin_interface_logo], id: "logo"),
            spree.admin_path,
            class: "logo navbar-brand"
          ) %>
            <span class="navbar-toggle" id="sidebar-toggle">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </span>
        </div>

          <div class="col-sm-9 col-md-10">
            <div class="navbar-right" data-hook="admin_login_navigation_bar"></div>
          </div>
      </div>
    </div>'
end