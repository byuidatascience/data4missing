### Data for names package

pacman::p_load(tidyverse, fs, jsonlite)
pacman::p_load_gh("byuidss/DataPushR")

package_name_text <- "data4missing"
base_folder <- "../../byuidatascience/"
user <- "byuidatascience"
package_path <- str_c(base_folder, package_name_text)
github_info <- dpr_info_github(user, package_name_text)
usethis::proj_set(package_path)

# github_info <- dpr_create_github(user, package_name_text)
# 
# package_path <- dpr_create_package(list_data = NULL,
#                                       package_name = package_name_text,
#                                       export_folder = base_folder,
#                                       git_remote = github_info$clone_url)
# usethis::proj_set(package_path)
##### dpr_delete_github(user, package_name_text) ########### End create section

## https://github.com/jdorfman/awesome-json-datasets
## https://think.cs.vt.edu/corgis/datasets/json/airlines/airlines.json

# flights <- fromJSON("projects/flights/data/flights.json") %>%
#     flatten() %>%
#     as_tibble()

flights_missing <- fromJSON("projects/flights/data/flights_missing.json") %>%
    flatten() %>%
    as_tibble() %>%
    rename_with(str_to_lower) %>%
    rename_with(~str_replace_all(., " ", "_"))

mtcars_missing <- fromJSON("projects/flights/data/mtcars_missing.json") %>%
    flatten() %>%
    as_tibble() %>%
    rename_with(str_to_lower) %>%
    rename_with(~str_replace_all(., " ", "_"))

usethis::use_data(mtcars_missing, flights_missing, overwrite = TRUE)


dpr_export(flights_missing, export_folder = path(package_path, "data-raw"), 
           export_format = c(".csv", ".xlsx", ".json"))

dpr_export(mtcars_missing, export_folder = path(package_path, "data-raw"), 
           export_format = c(".csv", ".xlsx", ".json"))


dpr_document(mtcars_missing, extension = ".md.R", export_folder = usethis::proj_get(),
             object_name = "mtcars_missing", title = "Missing Airline Delays (US)",
             description = "Monthly Airline Delays by Airport for US Flights, 2003-2016",
             source = "datasets::mtcars, Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391–411.",
             var_details = list(mpg = "Miles/(US) gallon",
               cyl = "Number of cylinders", 
               disp = "Displacement (cu.in.)",
               hp   = "Gross horsepower",
               drat = "Rear axle ratio",
               wt   = "Weight (1000 lbs)",
               qsec = "1/4 mile time",
               vs   = "Engine (0 = V-shaped, 1 = straight)", 
               am   = "Transmission (0 = automatic, 1 = manual)",
               gear = "Number of forward gears",
               carb = "Number of carburetors"))

# fdetails <- names(flights_missing) %>%
#     str_replace_all("_", " ") %>%
#     str_to_title() %>%
#     as.list()
# 
# names(fdetails) <- names(flights_missing)

dpr_document(flights_missing, extension = ".md.R", 
    export_folder = usethis::proj_get(),
    object_name = "flights_missing", 
    title = "Missing Airline Delays (US)",
    description = "Monthly Airline Delays by Airport for US Flights, 2003-2016",
    source = "https://think.cs.vt.edu/corgis/datasets/json/airlines/airlines.json 
        and https://github.com/byuistats/CSE250",
    var_details = list(airport_code = "Airport Code", 
                       airport_name = "Airport Name", 
                       month = "Month", 
                       year = "Year", 
                       num_of_flights_total = "Num Of Flights Total", 
                       num_of_delays_carrier = "Num Of Delays Carrier", 
                       num_of_delays_late_aircraft = "Num Of Delays Late Aircraft", 
                       num_of_delays_nas = "Num Of Delays Nas", 
                       num_of_delays_security = "Num Of Delays Security", 
                       num_of_delays_weather = "Num Of Delays Weather", 
                       num_of_delays_total = "Num Of Delays Total", 
                       minutes_delayed_carrier = "Minutes Delayed Carrier", 
                       minutes_delayed_late_aircraft = "Minutes Delayed Late Aircraft", 
                       minutes_delayed_nas = "Minutes Delayed Nas", 
                       minutes_delayed_security = "Minutes Delayed Security", 
                       minutes_delayed_weather = "Minutes Delayed Weather", 
                       minutes_delayed_total = "Minutes Delayed Total"))



dpr_readme(usethis::proj_get(), package_name_text, user)

dpr_write_script(folder_dir = package_path, r_read = "scripts_general/names_package.R", 
                 r_folder_write = "data-raw", r_write = str_c(package_name_text, ".R"))

dpr_write_script(folder_dir = package_path, r_read = "projects/baby_names/data_format.py", r_folder_write = "data-raw",
                 r_write = "names.py")

devtools::document(package_path) 

dpr_push(folder_dir = package_path, message = "'Second data set'", repo_url = NULL)
