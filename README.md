# 📌 BoostOrder Demo Mobile App Summary

## 📂 Overview  
The **BoostOrder Mobile App** is a **Flutter-based** application designed to streamline **product management and ordering processes**. It **fetches product data from a REST API**, supports **offline access using Hive**, and ensures a **seamless user experience** even without an internet connection.  

## 🎯 Key Features  

### 🔄 API Integration  
- **Fetches product data** from a WooCommerce backend.  
- Uses **Basic Authentication** for secure API requests.  

### 📦 Product Management  
- Parses **product details**, including **variations, categories, and images**.  
- Ensures **data consistency** by handling **missing or null values** properly.  
- Implements **fallback data** for missing attributes (e.g., categories).  

### 📥 Offline Storage with Hive  
- Saves **API responses locally** for offline access.  
- Retrieves stored data **if API fetching fails**.  
- Uses **path_provider** for efficient storage directory management.  

## ✅ Achieved Features  

### 🏷️ 1. Category Page  
- **Fetches product categories from API** and displays them dynamically.  

### 📖 2. Catalog Page  
- Displays **all product details** from the selected category.  

### 🛒 3. Cart Page  
- Shows **correct unit price, quantity, and total** for each item.  
- Displays **line item count and cart total** at the bottom.  
- **Swipe to remove a product** from the cart with real-time updates.  
- **Clear cart option** available from the **top-right menu**.  

## ⭐ Bonus Features (Implemented for Extra Marks)  

### 📌 Catalog Page Enhancements  
- **Cart Icon Badge**:  
  - Displays the **number of items** added to the cart.  
  - Updates **dynamically** as items are added or removed.  
- **Unit of Measurement (UOM) Dropdown**:  
  - Changing **UOM updates the product price**.  
  - Uses the **`variations` list** from the API payload for pricing adjustments.  
- **Product Search**:  
  - Implements **search functionality** for quick product lookup.  


## ⏳ Timeframe  
- **Project Completed in:** 3 Days  
- **Total Hours Spent:** ~12 Hours

## 📽️ Video Demo  

### 🌐 Online Mode  
[![Online Mode](https://img.youtube.com/vi/2l1q21C809o/0.jpg)](https://youtube.com/shorts/2l1q21C809o?feature=share)  

### 📴 Offline Mode  
[![Offline Mode](https://img.youtube.com/vi/73YjxQs-Qrk/0.jpg)](https://youtube.com/shorts/73YjxQs-Qrk?feature=share)  
---

This summary provides a **clear and structured overview** of the **BoostOrder Mobile App**, highlighting its **core functionalities, technical achievements, and advanced features**. 🚀  



