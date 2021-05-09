
# precision matrix for Bernoulli GLM
begin
    F = zeros(9,9)
    F[diagind(F)] = [1 + sqrt((i-1)/9) for i in 1:9]
    F[3:10:81] .= 1  # i, i-2
    F[2:10:81] .= -2  # i, i-1
    Λ = F'F

    (
    sir = Prior([LogNormal(log(0.4), 0.5), LogNormal(log(1/8), 0.2)]),
    gaussian_linear = Prior([MvNormal(fill(√0.1, 10))]),
    gaussian_linear_uniform = Prior(fill(Uniform(-1,1), 10)),
    gaussian_mixture = Prior(fill(Uniform(-10, 10), 2)),
    bernoulli_glm = Prior([Normal(0,2), MvNormalCanon(Λ)])
    # bernoulli_glm_raw = Prior([Normal(0,2), MvNormalCanon(Λ)])  # 100d statistics
    # slcp = Prior(fill(Uniform(-3, 3), 5)),  # Bi/Multimodal
    # slcp_distractors = Prior(fill(Uniform(-3, 3), 5)), # Bi/Multimodal
    # two_moons = Prior([Uniform(-1,1), Uniform(-1,1)]),  # Bi/Multimodal
    # lotka_volterra = Product([LogNormal(-0.125, 0.5), LogNormal(-3, 0.5), LogNormal(-0.125, 0.5), LogNormal(-3, 0.5)])  # Takes exceptionally long
    )
end
