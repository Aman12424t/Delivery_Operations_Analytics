USE DeliveryOperations

CREATE TABLE delivery_operations (
    order_id VARCHAR(50),
    order_date DATE,
    customer_id VARCHAR(50),
    customer_segment VARCHAR(50),
    customer_city VARCHAR(100),
    warehouse_id VARCHAR(50),
    warehouse_city VARCHAR(100),
    product_category VARCHAR(100),
    quantity INT,
    order_value DECIMAL(12,2),
    delivery_partner VARCHAR(100),
    vehicle_type VARCHAR(50),
    shipping_mode VARCHAR(50),
    distance_km DECIMAL(10,2),
    package_weight_kg DECIMAL(10,2),
    promised_delivery_date DATE,
    dispatch_date DATE,
    delivery_date DATE,
    delivery_status VARCHAR(50),
    delay_days INT,
    weather_condition VARCHAR(50),
    return_flag INT,
    return_reason VARCHAR(255),
    customer_rating VARCHAR(50)
)