package link_sharing

class UserListController {

    def userListService

    def findUser() {
        List<User1> listAll = userListService.allUser();
        render(view: "hey", model: [lol:listAll])

    }
}
