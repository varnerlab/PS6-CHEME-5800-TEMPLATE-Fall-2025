"""
    function build(modeltype::Type{MyExperimentalDrugCocktailContext}, data::NamedTuple)::MyExperimentalDrugCocktailContext

A factory function to build instances of the MyExperimentalDrugCocktailContext model type.

### Arguments
- `modeltype::Type{MyExperimentalDrugCocktailContext}`: the model type to build
- `data::NamedTuple`: a named tuple containing the data to populate the model fields

The `data` named tuple should contain the following fields:
- `K::Int64`: number of drug types
- `m::Int64`: number of features per drug type
- `γ::Array{Float64,1}`: effectiveness parameters
- `B::Float64`: total budget in USD
- `cost::Dict{Int, Float64}`: maps drug type to cost per mg/kg
- `levels::Dict{Int, NamedTuple}`: maps drug level to drug concentration in mg/kg
- `W::Float64`: weight of the patient in kg
- `S::Float64`: safety constraint for maximum allowable dosage units: mg/kg-day
- `bounds::Array{Float64,2}`: bounds for each drug type (L,U)

"""
function build(modeltype::Type{MyExperimentalDrugCocktailContext}, data::NamedTuple)::MyExperimentalDrugCocktailContext
    
    # create new context instance -
    context = modeltype() # model is empty instance

    # populate context fields from data -
    context.K = data.K
    context.m = data.m
    context.γ = data.γ
    context.B = data.B
    context.cost = data.cost
    context.levels = data.levels
    context.W = data.W
    context.S = data.S
    context.bounds = data.bounds

    return context
end

"""
    function build(modeltype::Type{MyQLearningAgentModel}, data::NamedTuple)::MyQLearningAgentModel

A factory function to build instances of the MyQLearningAgentModel type.

### Arguments
- `modeltype::Type{MyQLearningAgentModel}`: the model type to build
- `data::NamedTuple`: a named tuple containing the data to populate the model fields

The `data` named tuple should contain the following fields:
- `states::Array{Int,1}`: array of states
- `actions::Array{Int,1}`: array of actions
- `γ::Float64`: discount factor
- `α::Float64`: learning rate
- `Q::Array{Float64,2}`: Q-value table
"""
function build(modeltype::Type{MyQLearningAgentModel}, data::NamedTuple)::MyQLearningAgentModel
    
    # create new model instance -
    model = modeltype()

    # populate model fields from data -
    model.states = data.states
    model.actions = data.actions
    model.γ = data.γ
    model.α = data.α
    model.Q = data.Q

    return model
end