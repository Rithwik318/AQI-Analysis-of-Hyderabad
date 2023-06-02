# Analysis of Hyderabad’s Air Quality Index Data (2016-2022)

This project focuses on analyzing and predicting the Air Quality Index (AQI) of Hyderabad, India, from the years 2016 to 2022. The repository contains the R code and data files required to perform the analysis and gain insights into the trends and patterns of air pollution in the city.

## Motivation and Background
The increasing population and urbanization in Hyderabad have led to a rise in air pollution levels. This project aims to address the need for analyzing the AQI trends and predicting future air quality in the city. By understanding the factors contributing to air pollution and identifying areas of concern, appropriate measures can be taken to control and improve the air quality in Hyderabad.

## Dataset
The dataset used for this project has been collected from the official website of the Telangana State Pollution Control Board. The yearly data is provided in the form of Excel files, containing AQI values for various localities in Hyderabad. The dataset has undergone preprocessing to ensure its quality and suitability for analysis.

## Methodology
The project follows a comprehensive methodology that includes data preprocessing, exploratory data analysis, clustering, and predictive modeling. The R code provided in this repository performs these steps to analyze and visualize the AQI trends in Hyderabad.

The code utilizes packages such as `readxl`, `tidyverse`, `plotly`, `ggfortify`, `nbclust`, `cluster`, `plotrix`, and `factoextra` for data processing, visualization, clustering analysis, and plotting. The code reads the Excel files, performs data cleaning and preprocessing, generates plots and visualizations, and creates predictive models using linear regression.

## Conclusion and Recommendations
The analysis of the Hyderabad AQI data from 2016 to 2022 revealed interesting insights. The year 2020 showed a significant decrease in AQI values, likely due to the COVID-19 pandemic and associated lockdown measures. However, in subsequent years, the AQI values have been increasing, albeit at lower levels compared to the years before 2020.

Based on the findings, several recommendations can be made to address air pollution in Hyderabad. Industries in pollution-prone areas, such as Pashamylaram and Shameerpet, should be closely monitored and subjected to stringent emission control measures. Public awareness campaigns should emphasize the use of public transportation and electric vehicles to reduce vehicular emissions. Efforts should also be made to ensure the availability and efficiency of public transportation systems.

## Repository Structure
- `data/`: Contains the dataset used for analysis (Excel files).
- `code/`: Includes the R program file(s) with the code for data preprocessing, exploratory data analysis, clustering, and predictive modeling.
- `plots/`: Contains the generated plots and visualizations.
- `README.md`: The README file providing an overview of the project.

## How to Use
1. Clone the repository to your local machine.
2. Install R and the required packages mentioned in the code.
3. Place the dataset files in the `data/` directory.
4. Open the R program file(s) in the `code/` directory to run the analysis.
5. Explore the generated plots and visualizations in the `plots/` directory.
6. Customize the code and analysis as per your requirements.

Feel free to contribute to the repository by providing enhancements, bug fixes, or additional analyses.

## License
This project is licensed under the [MIT License](LICENSE).
