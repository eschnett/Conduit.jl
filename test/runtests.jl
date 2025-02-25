using Conduit
using Test

function show_node(node::Conduit.Node, level=0)
    println("  "^level, Conduit.node_name(node), ":")
    nchildren = Conduit.node_number_of_children(node)
    for child in 0:(nchildren - 1)
        show_node(Conduit.node_child(node, child), level + 1)
    end
end

node = Conduit.about()
# show_node(node)
Conduit.node_print(node)
# Conduit.node_print_detailed(node)

@show keys(node)
