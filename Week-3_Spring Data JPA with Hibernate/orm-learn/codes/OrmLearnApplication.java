package com.cognizant.ormlearn;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

import com.cognizant.ormlearn.model.Country;
import com.cognizant.ormlearn.service.CountryService;

@SpringBootApplication
public class OrmLearnApplication {

    private static final Logger LOGGER = LoggerFactory.getLogger(OrmLearnApplication.class);
    private static CountryService countryService;

    public static void main(String[] args) throws Exception {
        ApplicationContext context = SpringApplication.run(OrmLearnApplication.class, args);
        countryService = context.getBean(CountryService.class);
        LOGGER.info("Inside main");

        testGetAllCountries();
        testFindCountryByCode();
        testAddCountry();
        testUpdateCountry();
        testDeleteCountry();
    }

    private static void testGetAllCountries() {
        LOGGER.info("Start getAllCountries");
        List<Country> countries = countryService.getAllCountries();
        LOGGER.debug("Countries={}", countries);
        LOGGER.info("End getAllCountries");
    }

    private static void testFindCountryByCode() throws Exception {
        LOGGER.info("Start findCountryByCode");
        Country country = countryService.findCountryByCode("IN");
        LOGGER.debug("Country: {}", country);
        LOGGER.info("End findCountryByCode");
    }

    private static void testAddCountry() throws Exception {
        LOGGER.info("Start addCountry");
        Country country = new Country();
        country.setCode("ZZ");
        country.setName("Testland");
        countryService.addCountry(country);
        LOGGER.debug("Added country: {}", countryService.findCountryByCode("ZZ"));
        LOGGER.info("End addCountry");
    }

    private static void testUpdateCountry() throws Exception {
        LOGGER.info("Start updateCountry");
        countryService.updateCountry("ZZ", "New Testland");
        LOGGER.debug("Updated country: {}", countryService.findCountryByCode("ZZ"));
        LOGGER.info("End updateCountry");
    }

    private static void testDeleteCountry() throws Exception {
        LOGGER.info("Start deleteCountry");
        countryService.deleteCountry("ZZ");
        LOGGER.info("Deleted country with code ZZ");
        LOGGER.info("End deleteCountry");
    }
}
