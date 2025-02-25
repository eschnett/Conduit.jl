# Generate documentation with this command:
# (cd docs && julia make.jl)

push!(LOAD_PATH, "..")

using Documenter
using Conduit

makedocs(;
    authors="Erik Schnetter",
    format=Documenter.HTML(),
    modules=[Conduit],
    # pages=["index.md", "Domains" => "domains.md", "Categories" => "categories.md", "Helpers" => "helpers.md"],
    sitename="Conduit",
)

deploydocs(; devbranch="main", push_preview=true, repo="github.com/eschnett/Conduit.jl.git")
