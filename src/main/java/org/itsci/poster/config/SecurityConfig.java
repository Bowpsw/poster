package org.itsci.poster.config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
    /*@Bean
    public UserDetailsService userDetailsService() {
        InMemoryUserDetailsManager manager = new InMemoryUserDetailsManager();
        manager.createUser(User.withUsername("john")
                .password("{noop}test123").roles("EMPLOYEE")
                .build());
        manager.createUser(User.withUsername("mary")
                .password("{noop}test123").roles("EMPLOYEE", "MANAGER")
                .build());
        manager.createUser(User.withUsername("susan")
                .password("{noop}test123").roles("EMPLOYEE", "ADMIN")
                .build());
        return manager;
    }*/

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http)
            throws Exception {
        http.authorizeRequests(configurer -> {
            //configurer.anyRequest().authenticated();
            configurer.antMatchers("/create/**").hasRole("MANAGER")
                    .antMatchers("/update/**").hasRole("MANAGER")
                    .antMatchers("/delete/**").hasRole("MANAGER");
        });
        http.exceptionHandling(configurer -> {
            configurer.accessDeniedPage("/access-denied");
        });
        http.formLogin(configurer -> {
                    try {
                        configurer.loginPage("/login")
                                .loginProcessingUrl("/authenticate")
                                .permitAll()
                                .and()
                                .logout().permitAll();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
        );
        return http.build();
    }
}