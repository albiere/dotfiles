vim.g.projectionist_heuristics = {
  ["*"] = {
    ["app/components/*_component.rb"] = {
      alternate = "app/components/{}_component.html.erb"
    },
    ["app/components/*_component.html.erb"] = {
      alternate = "app/components/{}_component.rb"
    },
    ["app/models/*.rb"] = {
      alternate = "test/models/{}_test.rb"
    },
    ["test/models/*_test.rb"] = {
      alternate = "app/models/{}.rb"
    },
    ["app/controllers/*.rb"] = {
      alternate = "test/controllers/{}_test.rb"
    },
    ["test/controllers/*_test.rb"] = {
      alternate = "app/controllers/{}.rb"
    },
    ["app/mailers/*.rb"] = {
      alternate = "test/mailers/{}_test.rb"
    },
    ["test/mailers/*_test.rb"] = {
      alternate = "app/mailers/{}.rb"
    }
  }
}
