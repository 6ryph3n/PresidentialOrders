
import GameKit

struct President {
    let name: String
    let inauguration: Int
}

let presidents: [President] = [
    President(name: "George Washington", inauguration: 1789),
    President(name: "John Adams", inauguration: 1797),
    President(name: "Thomas Jefferson", inauguration: 1801),
    President(name: "James Madison", inauguration: 1809),
    President(name: "James Monroe", inauguration: 1817),
    President(name: "John Quincy Adams", inauguration: 1825)
]

func PresidentProvider() -> President {
    let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: presidents.count)
    let randomPresident = presidents[randomNumber]
    return randomPresident
}
