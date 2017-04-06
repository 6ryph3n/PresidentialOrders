
import GameKit

struct President {
    let name: String
    let inauguration: Int
    let learnMore: String
}

let presidents: [President] = [
    President(name: "George Washington", inauguration: 1789, learnMore: "https://en.wikipedia.org/wiki/George_Washington"),
    President(name: "John Adams", inauguration: 1797, learnMore: "https://en.wikipedia.org/wiki/John_Adams"),
    President(name: "Thomas Jefferson", inauguration: 1801, learnMore: "https://en.wikipedia.org/wiki/Thomas_Jefferson"),
    President(name: "James Madison", inauguration: 1809, learnMore: "https://en.wikipedia.org/wiki/James_Madison"),
    President(name: "James Monroe", inauguration: 1817, learnMore: "https://en.wikipedia.org/wiki/James_Monroe"),
    President(name: "John Quincy Adams", inauguration: 1825, learnMore: "https://en.wikipedia.org/wiki/John_Quincy_Adams"),
    President(name: "Andrew Jackson", inauguration: 1829, learnMore: "https://en.wikipedia.org/wiki/Andrew_Jackson"),
    President(name: "Martin Van Buren", inauguration: 1837, learnMore: "https://en.wikipedia.org/wiki/Martin_Van_Buren"),
    President(name: "William Henry Harrison", inauguration: 1841, learnMore: "https://en.wikipedia.org/wiki/William_Henry_Harrison"),
    President(name: "John Tyler", inauguration: 1841, learnMore: "https://en.wikipedia.org/wiki/John_Tyler"),
    President(name: "James K. Polk", inauguration: 1845, learnMore: "https://en.wikipedia.org/wiki/James_K._Polk"),
    President(name: "Zachary Taylor", inauguration: 1849, learnMore: "https://en.wikipedia.org/wiki/Zachary_Taylor"),
    President(name: "Millard Fillmore", inauguration: 1850, learnMore: "https://en.wikipedia.org/wiki/Millard_Fillmore"),
    President(name: "Franklin Pierce", inauguration: 1853, learnMore: "https://en.wikipedia.org/wiki/Franklin_Pierce"),
    President(name: "James Buchanan", inauguration: 1857, learnMore: "https://en.wikipedia.org/wiki/James_Buchanan"),
    President(name: "Abraham Lincoln", inauguration: 1861, learnMore: "https://en.wikipedia.org/wiki/Abraham_Lincoln"),
    President(name: "Andrew Johnson", inauguration: 1865, learnMore: "https://en.wikipedia.org/wiki/Andrew_Johnson"),
    President(name: "Ulyssese S. Grant", inauguration: 1869, learnMore: "https://en.wikipedia.org/wiki/Ulysses_S._Grant"),
    President(name: "Rutherford B. Hayes", inauguration: 1877, learnMore: "https://en.wikipedia.org/wiki/Rutherford_B._Hayes"),
    President(name: "James A. Garfield", inauguration: 1881, learnMore: "https://en.wikipedia.org/wiki/James_A._Garfield"),
    President(name: "Chester A. Arther", inauguration: 1881, learnMore: "https://en.wikipedia.org/wiki/Chester_A._Arthur"),
    President(name: "Grover Cleveland (first term)", inauguration: 1885, learnMore: "https://en.wikipedia.org/wiki/Grover_Cleveland"),
    President(name: "Benjamin Harrison", inauguration: 1889, learnMore: "https://en.wikipedia.org/wiki/Benjamin_Harrison"),
    President(name: "Grover Cleveland (second term)", inauguration: 1893, learnMore: "https://en.wikipedia.org/wiki/Grover_Cleveland"),
    President(name: "William McKinley", inauguration: 1897, learnMore: "https://en.wikipedia.org/wiki/William_McKinley"),
    President(name: "Theodore Roosevelt", inauguration: 1901, learnMore: "https://en.wikipedia.org/wiki/Theodore_Roosevelt"),
    President(name: "William Howard Taft", inauguration: 1909, learnMore: "https://en.wikipedia.org/wiki/William_Howard_Taft"),
    President(name: "Woodrow Wilson", inauguration: 1913, learnMore: "https://en.wikipedia.org/wiki/Woodrow_Wilson"),
    President(name: "Warren G. Harding", inauguration: 1921, learnMore: "https://en.wikipedia.org/wiki/Warren_G._Harding"),
    President(name: "Calvin Coolidge", inauguration: 1923, learnMore: "https://en.wikipedia.org/wiki/Calvin_Coolidge"),
    President(name: "Herbert Hoover", inauguration: 1929, learnMore: "https://en.wikipedia.org/wiki/Herbert_Hoover"),
    President(name: "Franklin D. Roosevelt", inauguration: 1933, learnMore: "https://en.wikipedia.org/wiki/Franklin_D._Roosevelt"),
    President(name: "Harry S. Truman", inauguration: 1945, learnMore: "https://en.wikipedia.org/wiki/Harry_S._Truman"),
    President(name: "Dwight D. Eisenhower", inauguration: 1953, learnMore: "https://en.wikipedia.org/wiki/Dwight_D._Eisenhower"),
    President(name: "John F. Kennedy", inauguration: 1961, learnMore: "https://en.wikipedia.org/wiki/John_F._Kennedy"),
    President(name: "Lydon B. Johnson", inauguration: 1963, learnMore: "https://en.wikipedia.org/wiki/Lyndon_B._Johnson"),
    President(name: "Richard Nixon", inauguration: 1969, learnMore: "https://en.wikipedia.org/wiki/Richard_Nixon"),
    President(name: "Gerald Ford", inauguration: 1974, learnMore: "https://en.wikipedia.org/wiki/Gerald_Ford"),
    President(name: "Jimmy Carter", inauguration: 1977, learnMore: "https://en.wikipedia.org/wiki/Jimmy_Carter"),
    President(name: "Ronald Reagan", inauguration: 1981, learnMore: "https://en.wikipedia.org/wiki/Ronald_Reagan"),
    President(name: "George H. W. Bush", inauguration: 1989, learnMore: "https://en.wikipedia.org/wiki/George_H._W._Bush"),
    President(name: "Bill Clinton", inauguration: 1993, learnMore: "https://en.wikipedia.org/wiki/Bill_Clinton"),
    President(name: "George W. Bush", inauguration: 2001, learnMore: "https://en.wikipedia.org/wiki/George_W._Bush"),
    President(name: "Barack Obama", inauguration: 2009, learnMore: "https://en.wikipedia.org/wiki/Barack_Obama"),
    President(name: "Donald Trump", inauguration: 2017, learnMore: "https://en.wikipedia.org/wiki/Donald_Trump")
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
    
    
    while president2.name == president1.name {
        president2 = PresidentProvider()
    }
    
    while president3.name == president1.name || president3.name == president2.name {
        president3 = PresidentProvider()
    }
    
    while president4.name == president1.name || president4.name == president2.name  || president4.name == president3.name {
        president4 = PresidentProvider()
    }
    
    
    return (president1, president2, president3, president4)
}
