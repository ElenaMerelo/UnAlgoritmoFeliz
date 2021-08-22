#=
utils:
- Julia version:
- Author: cecimerelo
- Date: 2021-03-06
=#

using JSON

const chromosome_size = "CHROMOSOME_SIZE"
const dimensions = "DIMENSIONS"
const population_size = "POPULATION_SIZE"
const max_evaluations = "MAX_EVALUATIONS"
const max_generations = "MAX_GENERATIONS"
const alpha_percentage = "ALPHA"
const beta_percentage = "BETA"
const gamma_percentage = "GAMMA"
const delta_percentage = "DELTA"
const epsilon_percentage = "EPSILON"
const alpha_mr = "ALPHA_MR"
const beta_mr = "BETA_MR"
const gamma_mr = "GAMMA_MR"
const delta_mr = "DELTA_MR"
const epsilon_mr = "EPSILON_MR"

function read_parameters_file(file_path::String)
    @info "Reading parameters file"
    config_parameters = JSON.parsefile(file_path)

    castes_percentages =
        Dict(
            alpha_percentage => config_parameters[alpha_percentage],
            beta_percentage => config_parameters[beta_percentage],
            gamma_percentage => config_parameters[gamma_percentage],
            delta_percentage => config_parameters[delta_percentage],
            epsilon_percentage => config_parameters[epsilon_percentage],
        )

    casts_mr =
        Dict(
            alpha_mr => config_parameters[alpha_mr],
            beta_mr => config_parameters[beta_mr],
            gamma_mr => config_parameters[gamma_mr],
            delta_mr => config_parameters[delta_mr],
            epsilon_mr => config_parameters[epsilon_mr],
        )

    return ConfigurationParametersEntity(config_parameters[chromosome_size],
        config_parameters[dimensions], config_parameters[population_size],
        config_parameters[max_evaluations], config_parameters[max_generations],
        castes_percentages, casts_mr)
end
