Deface::Override.new(:virtual_path => "spree/admin/users/_form",
                     :name => "example-1",
                     :replace => "div.form-group") do


      '
     <% if spree_current_user.has_spree_role?("hms-admin") %>
      <div data-hook="admin_user_form_roles" class="form-group">
      <strong><%= Spree.t(:roles) %></strong>
      <% @roles.where(name: "user").each do |role| %>
        <div class="checkbox">
          <%= label_tag "user_spree_role_#{role.name}" do %>
            <%= check_box_tag "user[spree_role_ids][]", role.id, @user.spree_roles.include?(role), :id => "user_spree_role_#{role.name}" %>
            <%= role.name %>
          <% end %>
        </div>
      <% end %>
      <%= hidden_field_tag "user[spree_role_ids][]", "" %>
    </div>
     <% else %>

<div data-hook="admin_user_form_roles" class="form-group">
      <strong><%= Spree.t(:roles) %></strong>
      <% @roles.each do |role| %>
        <div class="checkbox">
          <%= label_tag "user_spree_role_#{role.name}" do %>
            <%= check_box_tag "user[spree_role_ids][]", role.id, @user.spree_roles.include?(role), :id => "user_spree_role_#{role.name}" %>
            <%= role.name %>
          <% end %>
        </div>
      <% end %>
      <%= hidden_field_tag "user[spree_role_ids][]", "" %>
    </div>
    <% end %>
     '


end