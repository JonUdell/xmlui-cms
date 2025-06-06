# APICall

`APICall` is used to mutate (create, update or delete) some data on the backend. It is similar in nature to the `DataSource` component which retrieves data from the backend.

The component provides context values with which you can access some internal properties:

- `$param`: This value represents the first parameters passed to the `execute()` method to display the modal dialog.
- `$params`: This value represents the array of parameters passed to the `execute()` method. You can use `$params[0]` to access the first and `$params[1]` to access the second (and so on) parameters. `$param` is the same as `$params[0]`.

## Properties

### `body`

This property sets the request body. The object you pass here will be serialized to JSON when sending the request. Use the `rawBody` property to send another request body using its native format. When you define `body` and `rawBody`, the latest one prevails.

### `completedNotificationMessage`

This property defines the message to display automatically when the operation has been completed.

This property customizes the success message displayed in a toast after the finished API invocation. The `$result` context variable can refer to the response body. For example, you can use the following code snippet to display the first 100 characters in the completed operation's response body:

```xmlui copy
 <APICall
  id="ds"
  method="post"
  url="/api/shopping-list"
  completedNotificationMessage="Result: {JSON.stringify($result).substring(0, 100)}" />
```

### `confirmButtonLabel`

This optional string property enables the customization of the submit button in the confirmation dialog that is displayed before the `APICall` is executed.

### `confirmMessage`

This optional string sets the message in the confirmation dialog that is displayed before the `APICall` is executed.

### `confirmTitle`

This optional string sets the title in the confirmation dialog that is displayed before the `APICall` is executed.

### `errorNotificationMessage`

This property defines the message to display automatically when the operation results in an error.

This property customizes the message displayed in a toast when the API invocation results in an error. The `$error.statusCode` context variable can refer to the response's status code, while `$error. details` to the response body. For example, you can use the following code snippet to display the status code and the details:

```xmlui copy
 <APICall
  id="ds"
  method="post"
  url="/api/shopping-list"
  errorNotificationMessage="${error.statusCode}, {JSON.stringify($error.details)}" />
```

### `headers`

You can define request header values as key and value pairs, where the key is the ID of the particular header and the value is that header's value.

### `inProgressNotificationMessage`

This property customizes the message that is displayed in a toast while the API operation is in progress.

### `method (default: "get")`

The method of data manipulation can be done via setting this property.

Available values: `get` **(default)**, `post`, `put`, `delete`, `patch`, `head`, `options`, `trace`, `connect`

### `queryParams`

This property sets the query parameters for the request. The object you pass here will be serialized to a query string and appended to the request URL. You can specify key and value pairs where the key is the name of a particular query parameter and the value is that parameter's value.

### `rawBody`

This property sets the request body to the value provided here without any conversion. Use the * `body` property if you want the object sent in JSON. When you define `body` and `rawBody`, the latest one prevails.

### `url (required)`

Use this property to set the URL to send data to.

## Events

### `beforeRequest`

This event fires before the request is sent. Returning an explicit boolean`false` value will prevent the request from being sent.

### `error`

This event fires when a request results in an error.

### `success`

This event fires when a request results in a success.

## Exposed Methods

### `execute`

This method triggers the invocation of the API. You can pass an arbitrary number of parameters to the method. In the `APICall` instance, you can access those with the `$param` and `$params` context values.

## Styling

This component does not have any styles.
