<h2><%= @creature.name %></h2>
<h2><%= @pcreature.description %></h2>
<hr>
<%= link_to "Edit", edit_post_path(@creature), :class => "btn btn-default" %>
<%= link_to "Delete", creature_path(@creature),
          method: :delete,
          data: {confirm: "Are you sure?"},
          :class => "btn btn-danger" %>
<hr>

<h3>Add Creature</h3>
<%= form_for([@creature, @creature.comments.build]) do |f| %>
  <p>
    <%= f.label :name %><br>
    <%= f.text_field(:name, {:class => "form-control"}) %>
  </p>

  <p>
    <%= f.label :description %><br>
    <%= f.text_area(:description, {:class => "form-control"})  %>
  </p>

  <p>
    <%= f.submit ({:class => "btn btn-default"})%>
  </p>
<% end %>
