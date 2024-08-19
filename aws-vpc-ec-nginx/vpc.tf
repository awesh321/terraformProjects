resource "aws_vpc" "aweVPC" {
    cidr_block = "10.0.0.0/16"  
}

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.aweVPC.id
    cidr_block = "10.0.1.0/24"
}

resource "aws_subnet" "private" {
    vpc_id = aws_vpc.aweVPC.id
    cidr_block = "10.0.2.0/24"
}

resource "aws_internet_gateway" "aweig" {
    vpc_id = aws_vpc.aweVPC.id
}

resource "aws_route_table" "aweroute" {
    vpc_id = aws_vpc.aweVPC.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.aweig.id
    }
}

resource "aws_route_table_association" "name" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.aweroute.id
}