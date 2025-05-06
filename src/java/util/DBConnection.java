package util;

import com.zaxxer.hikari.HikariConfig;
import java.sql.SQLException;
import com.zaxxer.hikari.HikariDataSource;
import java.sql.Connection;

public class DBConnection {
    private static volatile HikariDataSource dataSource;
    private static final Object lock = new Object();
    
    // Private constructor to prevent instantiation
    private DBConnection() {}
    
    public static Connection getConnection() throws SQLException {
        if (dataSource == null) {
            synchronized (lock) {
                if (dataSource == null) {
                    initializeDataSource();
                }
            }
        }
        return dataSource.getConnection();
    }
    
    private static void initializeDataSource() {
        try {
            HikariConfig config = new HikariConfig();
            
            // Essential configuration
            config.setJdbcUrl("jdbc:mysql://localhost:3306/student_management_system?useSSL=false&serverTimezone=UTC");
            config.setUsername("root");
            config.setPassword("");
            config.setDriverClassName("com.mysql.cj.jdbc.Driver");
            
            // Connection pool sizing
            config.setMaximumPoolSize(10);
            config.setMinimumIdle(2);
            
            // Timeout settings
            config.setConnectionTimeout(30000); // 30 seconds
            config.setIdleTimeout(600000); // 10 minutes
            config.setMaxLifetime(1800000); // 30 minutes
            
            // MySQL-specific optimization
            config.addDataSourceProperty("cachePrepStmts", "true");
            config.addDataSourceProperty("prepStmtCacheSize", "250");
            config.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");
            config.addDataSourceProperty("useServerPrepStmts", "true");
            
            dataSource = new HikariDataSource(config);
            
            // Test the connection
            try (Connection connection = dataSource.getConnection()) {
                System.out.println("Successfully established database connection");
            }
            
        } catch (Exception e) {
            System.err.println("Failed to initialize connection pool: " + e.getMessage());
            throw new RuntimeException("Database initialization failed", e);
        }
    }
    
    // Optional: Get the DataSource directly if needed
    public static HikariDataSource getDataSource() {
        if (dataSource == null) {
            synchronized (lock) {
                if (dataSource == null) {
                    initializeDataSource();
                }
            }
        }
        return dataSource;
    }
}