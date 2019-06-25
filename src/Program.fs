open System
open Suave
open Suave.Successful
open Suave.Operators
open Suave.Filters

let app =
    choose [
        GET >=> path "/time" >=> OK(sprintf "Server time: %O" DateTime.Now)
    ]
    |> startWebServer defaultConfig
