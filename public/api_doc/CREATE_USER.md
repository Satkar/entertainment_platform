**Create User in a system**
----

* **URL**
  ```
    api/v1/users
  ```

* **Method:**

  ```
  POST
  ```

* **Data Params**

  ``` json
    {"user":{"email":"sansat1387@gmail.com"}}
  ```

* **Response:**
  - Example 1 when user id is invalid
   * **Content:** <br />
    ``` json
      {
        "id": 21,
        "email": "sansat13811@gmail.com",
        "created_at": "2021-01-31T16:49:54.000Z",
        "updated_at": "2021-01-31T16:49:54.000Z"
      }
    ```
