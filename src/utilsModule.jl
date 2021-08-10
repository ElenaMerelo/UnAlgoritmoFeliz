#=
utils:
- Julia version:
- Author: cecimerelo
- Date: 2021-03-06
=#

module utilsModule

using JSON
using DataFrames
using CSV

using ..IndividualPackagesModule

const chromosome_size = "CHROMOSOME_SIZE"
const dimensions = "DIMENSIONS"
const population_size = "POPULATION_SIZE"
const max_evaluations = "MAX_EVALUATIONS"
const max_generations = "MAX_GENERATIONS"
const alpha_percentage = "ALPHA_PERCENTAGE"
const beta_percentage = "BETA_PERCENTAGE"
const gamma_percentage = "GAMMA_PERCENTAGE"
const delta_percentage = "DELTA_PERCENTAGE"
const epsilon_percentage = "EPSILON_PERCENTAGE"
const step_size = "STEP_SIZE"


function read_parameters_file(file_path::String)
    @info "Reading parameters file"
    config_parameters = JSON.parsefile(file_path)

    ConfigurationParametersEntity(config_parameters[chromosome_size],
        config_parameters[dimensions], config_parameters[population_size],
        config_parameters[max_evaluations], config_parameters[max_generations],
        config_parameters[alpha_percentage], config_parameters[beta_percentage],
        config_parameters[gamma_percentage], config_parameters[delta_percentage],
        config_parameters[epsilon_percentage], config_parameters[step_size])
end

end
