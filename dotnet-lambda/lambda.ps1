Push-Location
Set-Location $PSScriptRoot

dotnet-lambda deploy-function `
    --function-name DotNetFunction `
    --package-type image `
    --region us-east-2 `
    --profile arn:aws:iam::440457658525:user/benchmark `
    --aws-access-key-id AKIAWNDKSQCO5KU5KVOK `
    --aws-secret-key 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 `
    --dockerfile ../../Dockerfile.dotnet5.0 `
    --project-location src/DotNetFunction `
    --docker-host-build-output-dir .\published

Pop-Location