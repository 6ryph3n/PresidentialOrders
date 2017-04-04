
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
    President(name: "John Quincy Adams", inauguration: 1825),
    President(name: "Andrew Jackson", inauguration: 1829),
    President(name: "Martin Van Buren", inauguration: 1837),
    President(name: "William Henry Harrison", inauguration: 1841),
    President(name: "John Tyler", inauguration: 1841),
    President(name: "James K. Polk", inauguration: 1845),
    President(name: "Zachary Taylor", inauguration: 1849),
    President(name: "Millard Fillmore", inauguration: 1850),
    President(name: "Franklin Pierce", inauguration: 1853),
    President(name: "James Buchanan", inauguration: 1857),
    President(name: "Abraham Lincoln", inauguration: 1861),
    President(name: "Andrew Johnson", inauguration: 1865),
    President(name: "Ulyssese S. Grant", inauguration: 1869),
    President(name: "Rutherford B. Hayes", inauguration: 1877),
    President(name: "James A. Garfield", inauguration: 1881),
    President(name: "Chester A. Arther", inauguration: 1881),
    President(name: "Grover Cleveland (first term)", inauguration: 1885),
    President(name: "Benjamin Harrison", inauguration: 1889),
    President(name: "Grover Cleveland (second term)", inauguration: 1893),
    President(name: "William McKinley", inauguration: 1897),
    President(name: "Theodore Roosevelt", inauguration: 1901),
    President(name: "William Howard Taft", inauguration: 1909),
    President(name: "Woodrow Wilson", inauguration: 1913),
    President(name: "Warren G. Harding", inauguration: 1921),
    President(name: "Calvin Coolidge", inauguration: 1923),
    President(name: "Herbert Hoover", inauguration: 1929),
    President(name: "Franklin D. Roosevelt", inauguration: 1933),
    President(name: "Harry S. Truman", inauguration: 1945),
    President(name: "Dwight D. Eisenhower", inauguration: 1953),
    President(name: "John F. Kennedy", inauguration: 1961),
    President(name: "Lydon B. Johnson", inauguration: 1963),
    President(name: "Richard Nixon", inauguration: 1969),
    President(name: "Gerald Ford", inauguration: 1974),
    President(name: "Jimmy Carter", inauguration: 1977),
    President(name: "Ronald Reagan", inauguration: 1981),
    President(name: "George H. W. Bush", inauguration: 1989),
    President(name: "Bill Clinton", inauguration: 1993),
    President(name: "George W. Bush", inauguration: 2001),
    President(name: "Barack Obama", inauguration: 2009),
    President(name: "Donald Trump", inauguration: 2017)
]

func PresidentProvider() -> President {
    let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: presidents.count)
    let randomPresident = presidents[randomNumber]
    return randomPresident
}




func NewSet() -> (President, President, President, President) {
    
    
    var president1 = PresidentProvider()
    var president2 = PresidentProvider()
    var president3 = PresidentProvider()
    var president4 = PresidentProvider()
    
    if president2.name == president1.name {
        president2 = PresidentProvider()
    }
    
    if president3.name == president1.name || president3.name == president2.name {
        president3 = PresidentProvider()
    }
    
    if president4.name == president1.name || president4.name == president2.name  || president4.name == president3.name {
        president4 = PresidentProvider()
    }
    
    
    return (president1, president2, president3, president4)
}
