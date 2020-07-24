# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
	email: "aa@aa.com",
	password: "aaaaaa",
	name: "開発用",
	introduction: "開発中"
)

User.create!(
	email: "bb@aa.com",
	password: "aaaaaa",
	name: "マコト",
	introduction: "タニタ"
)

User.create!(
	email: "cc@aa.com",
	password: "aaaaaa",
	name: "フラット",
	introduction: "アビス"
)

User.create!(
	email: "dd@aa.com",
	password: "aaaaaa",
	name: "ユキ",
	introduction: "まんた"
)

User.create!(
	email: "ee@aa.com",
	password: "aaaaaa",
	name: "ペンギン",
	introduction: "しじみ"
)

Song.create!(
	user_id: "1",
	title: "I see…",
	body: "曲調◯",
	artist_name: "乃木坂46"
)

Song.create!(
	user_id: "2",
	title: "沼津みなと新鮮館",
	body: "妙な中毒性あり",
	artist_name: "飯田徳孝"
)

Song.create!(
	user_id: "3",
	title: "秒針を噛む",
	body: "儚くも力強い曲調がかっこいい！",
	artist_name: "ずっと真夜中でいいのに"
)

Song.create!(
	user_id: "4",
	title: "パプリカ",
	body: "米津版パプリカ違った雰囲気でGOOD!",
	artist_name: "米津玄師"
)

Song.create!(
	user_id: "5",
	title: "夜に駆ける",
	body: "曲調良し",
	artist_name: "YOASOBI"
)

