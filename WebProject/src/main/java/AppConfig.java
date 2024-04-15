import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import javax.sql.DataSource;

@Configuration
@PropertySource("classpath:jdbc.properties")
public class AppConfig {

    @Bean
    public DataSource dataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName(System.getProperty("jdbc.driverClassName"));
        dataSource.setUrl(System.getProperty("jdbc.url"));
        dataSource.setUsername(System.getProperty("jdbc.username"));
        dataSource.setPassword(System.getProperty("jdbc.password"));
        return dataSource;
    }

    @Bean
    public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
        return new PropertySourcesPlaceholderConfigurer();
    }
}
