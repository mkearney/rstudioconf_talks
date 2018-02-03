tidy\_networks
================

Presenter
---------

-   [thomasp85](https://github.com/thomasp85): Biology + Data Science

Packages
--------

-   [thomasp85/tidygraph](https://github.com/thomasp85/tidygraph): A tidy API for graph manipulation

-   [thomasp85/ggraph](https://github.com/thomasp85/ggraph): Grammar of Graph Graphics

Functions
---------

-   `tidygraph::activate()`: Determine the context of subsequent manipulations As a tbl\_graph can be considered as a collection of two linked tables it is necessary to specify which table is referenced during manipulations. The activate verb does just that and needs affects all subsequent manipulations until a new table is activated. active is a simple query function to get the currently acitve context.

-   `tidygraph::bind_edges()`: Add graphs, nodes, or edges to a tbl\_graph These functions are tbl\_graph pendants to dplyr::bind\_rows() that allows you to grow your tbl\_graph by adding rows to either the nodes data, the edges data, or both. As with bind\_rows() columns are matched by name and are automatically filled with NA if the column doesn't exist in some instances. In the case of bind\_graphs() the graphs are automatically converted to tbl\_graph objects prior to binding. The edges in each graph will continue to reference the nodes in the graph where they originated, meaning that their terminal node indexes will be shifted to match the new index of the node in the combined graph. This means the bind\_graphs() always result in a disconnected graph. See graph\_join() for merging graphs on common nodes.

-   `tidygraph::bind_nodes()`: Add graphs, nodes, or edges to a tbl\_graph These functions are tbl\_graph pendants to dplyr::bind\_rows() that allows you to grow your tbl\_graph by adding rows to either the nodes data, the edges data, or both. As with bind\_rows() columns are matched by name and are automatically filled with NA if the column doesn't exist in some instances. In the case of bind\_graphs() the graphs are automatically converted to tbl\_graph objects prior to binding. The edges in each graph will continue to reference the nodes in the graph where they originated, meaning that their terminal node indexes will be shifted to match the new index of the node in the combined graph. This means the bind\_graphs() always result in a disconnected graph. See graph\_join() for merging graphs on common nodes.

-   `tidygraph::bind_graphs()`: Add graphs, nodes, or edges to a tbl\_graph These functions are tbl\_graph pendants to dplyr::bind\_rows() that allows you to grow your tbl\_graph by adding rows to either the nodes data, the edges data, or both. As with bind\_rows() columns are matched by name and are automatically filled with NA if the column doesn't exist in some instances. In the case of bind\_graphs() the graphs are automatically converted to tbl\_graph objects prior to binding. The edges in each graph will continue to reference the nodes in the graph where they originated, meaning that their terminal node indexes will be shifted to match the new index of the node in the combined graph. This means the bind\_graphs() always result in a disconnected graph. See graph\_join() for merging graphs on common nodes.

-   `ggraph::ggraph()`: Create a ggraph plot This function is the equivalent of ggplot in ggplot2. It takes care of setting up the plot object along with creating the layout for the plot based on the graph and the specification passed in. Alternatively a layout can be prepared in advance using create\_layout and passed as the data argument. See Details for a desciption of all available layouts.

-   `ggraph::geom_node_point()`: Show nodes as points This geom is equivalent in functionality to geom\_point and allows for simple plotting of nodes in different shapes, colours and sizes.

-   `ggraph::geom_edge_link()`: Draw edges as straight lines between nodes This geom draws edges in the simplest way - as straight lines between the start and end nodes. Not much more to say about that...
