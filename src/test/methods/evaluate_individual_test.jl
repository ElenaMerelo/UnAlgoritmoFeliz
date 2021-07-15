include("../../individual/IndividualModule.jl")
using .IndividualModule

include("../../utilsModule.jl")
using .utilsModule

include("../../methods/evaluate_individual.jl")

using BlackBoxOptimizationBenchmarking
using Test

@testset "Test evaluate_individual method " begin
    file_path = "./src/test/data/set_test.csv"
    genes = utilsModule.from_file_to_genes(file_path, FeaturesArray,
                                                    Float16;
                                                    delimiter=',')
    f = evaluate_individual(genes, BlackBoxOptimizationBenchmarking.F1)
    @test f == -1219.778257715676
end
