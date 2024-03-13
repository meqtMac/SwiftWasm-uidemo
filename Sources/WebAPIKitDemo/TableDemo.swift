//
//  File.swift
//
//
//  Created by 蒋艺 on 2023/9/18.
//

import DOM

struct TableDemo: HTMDSL {
    let element: HTMLButtonElement
    
    init(title: String, parent: HTMLElement ) {
        element = Button(title: title) {
            parent.removeChilds()
            let table = Table {
                Caption {
                    "Data about the planets of our solar system (Planetary facts taken from"
                    A (href: "https://nssdc.gsfc.nasa.gov/planetary/factsheet/") {
                        "Nasa's Planetary Fact Sheet - Metric"
                    }
                    ")"
                }
                ColGroup {
                    Col(span: 2)
                    Col(style: "border: 2px solid black")
                    Col(span: 9)
                }
                Self.headers
                Self.data
            }
            parent.appendChild(node: table.element)
        }.element
    }
}

extension TableDemo {
    @HTMLBuilder
    static var headers: HTMLBuilder.Component {
        Thead {
            Tr {
                Td(colspan: 2)
                Th(scope: .col) { "Name" }
                Th(scope: .col) { "Mass (10"; Sup("24"); "kg)" }
                Th(scope: .col) { "Diameter(km)" }
                Th(scope: .col) { "Gravity(kg/m"; Sup("3"); ")" }
                Th(scope: .col) { "Length of day (hours)" }
                Th(scope: .col) { "Distance from Sun (10"; Sup("6"); "km" }
                Th(scope: .col) { "Mean temperature (°C)" }
                Th(scope: .col) { "Number of moons" }
                Th(scope: .col) { "Notes" }
            }
        }
    }
    
    static let data: [Planet] = [
        Planet("Mercury", mass: 0.333, diameter: 4.879, density: 5427, gravity: 3.7, lod: 4222.6, dfs: 57.9, tempature: 167, moons: 0) {
            Th(scope: .rowgroup, colspan: 2, rowSpan: 4) { "Terrestrial planets" }
        } comment: {
            "Closest to the sun"
        },
        Planet("Venus", mass: 0, diameter: 0, density: 0, gravity: 0, lod: 0, dfs: 0, tempature: 0, moons: 0),
        Planet("Earth", mass: 0, diameter: 0, density: 0, gravity: 0, lod: 0, dfs: 0, tempature: 0, moons: 0) { "Our World" },
        Planet("Mars", mass: 0, diameter: 0, density: 0, gravity: 0, lod: 0, dfs: 0, tempature: 0, moons: 0) { "The red planet" },
        Planet("Jupiter", mass: 1898, diameter: 142984, density: 1326, gravity: 23.1, lod: 9.9, dfs: 778.6, tempature: -100, moons: 67) {
            Th(scope: .rowgroup, rowSpan: 4) { "Jovian planets" }
            Th(scope: .rowgroup, rowSpan: 2) { "Gas giants" }
        } comment: {
            "The Largest Planet"
        },
        Planet("Saturn", mass: 0, diameter: 0, density: 0, gravity: 0, lod: 0, dfs: 0, tempature: 0, moons: 0),
        Planet("Uranus", mass: 0, diameter: 0, density: 0, gravity: 0, lod: 0, dfs: 0, tempature: 0, moons: 0, header: {
            Th(scope: .rowgroup, rowSpan: 2) { "Ice giants" }
        }),
        Planet("Neptune", mass: 0, diameter: 0, density: 0, gravity: 0, lod: 0, dfs: 0, tempature: 0, moons: 0),
        Planet("Pluto", mass: 0.0146, diameter: 2370, density: 2095, gravity: 0.7, lod: 153.3, dfs: 5906.4, tempature: -225, moons: 5) {
            Th(scope: .row, colspan: 2) { "Dwarf plant" }
        } comment: {
            "Declassified as a planet in 2006, but this "
            A(href: "https://www.usatoday.com/story/tech/2014/10/02/pluto-planet-solar-system/16578959/")
            { "remains controversial" }
            ")"
        }
    ]
}

extension TableDemo {
    struct Planet {
        let header: TableRowBuilder.Component?
        let name: String
        let mass: Double
        let diameter: Double
        let density: Double
        let gravity: Double
        /// length of day
        let lod: Double
        /// distance from sun
        let dfs: Double
        let tempature: Double
        let moons: UInt32
        let comment: TableRowBuilder.Element?
        
        private init(header: TableRowBuilder.Component?, name: String, mass: Double, diameter: Double, density: Double, gravity: Double, lod: Double, dfs: Double, tempature: Double, moons: UInt32, comment: TableRowBuilder.Element?) {
            self.header = header
            self.name = name
            self.mass = mass
            self.diameter = diameter
            self.density = density
            self.gravity = gravity
            self.lod = lod
            self.dfs = dfs
            self.tempature = tempature
            self.moons = moons
            self.comment = comment
        }
    }
    
}

extension TableDemo.Planet {
    init(
        _ name: String,
        mass: Double,
        diameter: Double,
        density: Double,
        gravity: Double,
        lod: Double,
        dfs: Double,
        tempature: Double,
        moons: UInt32
    ) {
        self.init( header: nil,
                   name: name,
                   mass: mass,
                   diameter: diameter,
                   density: density,
                   gravity: gravity,
                   lod: lod,
                   dfs: dfs,
                   tempature: tempature,
                   moons: moons,
                   comment: nil)
    }
    
    init(
        _ name: String,
        mass: Double,
        diameter: Double,
        density: Double,
        gravity: Double,
        lod: Double,
        dfs: Double,
        tempature: Double,
        moons: UInt32,
        @TableRowBuilder header: () -> TableRowBuilder.Component
    ) {
        self.init( header: header(),
                   name: name,
                   mass: mass,
                   diameter: diameter,
                   density: density,
                   gravity: gravity,
                   lod: lod,
                   dfs: dfs,
                   tempature: tempature,
                   moons: moons,
                   comment: nil)
    }
    
    init(_ name: String,  mass: Double, diameter: Double, density: Double, gravity: Double, lod: Double, dfs: Double, tempature: Double, moons: UInt32, @TableCellBuilder comment: () -> TableCellBuilder.Component ) {
        self.init(header: nil,
                  name: name,
                  mass: mass,
                  diameter: diameter,
                  density: density,
                  gravity: gravity,
                  lod: lod,
                  dfs: dfs,
                  tempature: tempature,
                  moons: moons,
                  comment: .td(Td(content: comment))
        )
    }
    
    init(
        
        _ name: String,
        mass: Double,
        diameter: Double,
        density: Double,
        gravity: Double,
        lod: Double,
        dfs: Double,
        tempature: Double,
        moons: UInt32,
        @TableRowBuilder header: () -> TableRowBuilder.Component,
        @TableCellBuilder comment: () -> TableCellBuilder.Component
    ) {
        self.init(header: header(),
                  name: name,
                  mass: mass,
                  diameter: diameter,
                  density: density,
                  gravity: gravity,
                  lod: lod,
                  dfs: dfs,
                  tempature: tempature,
                  moons: moons,
                  comment: .td(Td(content: comment))
        )
    }
    
    var tr: Tr {
        Tr {
            if let header {
                header
            }
            Th(scope: .row) { self.name }
            Td { "\(mass)"}
            Td { "\(diameter)"}
            Td { "\(density)"}
            Td { "\(gravity)"}
            Td { "\(lod)"}
            Td { "\(dfs)"}
            Td { "\(tempature)"}
            Td { "\(moons)"}
            if let comment {
                Td { comment }
            }
        }
    }
}


extension HTMLBuilder {
    static func buildExpression(_ expression: [TableDemo.Planet]) -> HTMLBuilder.Component {
        [
            TBody {
                expression.map { $0.tr }
            }
        ]
    }
}
