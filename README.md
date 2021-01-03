# GitHub-GM-Exercise

Application workflow:

### Application workflow

1. The application checks for the network connection on opening the app.
2. If a network connection is available
    - The app tries to fetch the data from the provided API, parse them.
    - Then it creates a new CommitModel List to display the data in Table View.
3. If a network connection is not available,
  - The app will simply toast a message "No Internet".

### Improvements

  - The app should display the data from the database on opening the app if previously fetched data is available in the database, and then try to fetch the new data from the API in the background. This can be achieved through different scenarios based on an application requirement. For example, an API service can provide only the updated data since the last fetched data or by comparing the previously fetched data with the new data. In any scenario, if an app is displaying critical data to the user without interfering with the current user's position, the app should display an action view to let the user know that new data is available and allow to update the view by clicking on the action view or by Pull-To-Refresh functionality.

