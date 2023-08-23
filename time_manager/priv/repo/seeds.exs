# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TimeManager.Repo.insert!(%TimeManager.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias TimeManager.Repo
alias TimeManager.Account
alias TimeManager.Teams.Team

Account.create_user(%{
  username: "washington",
  email: "washingto.per@egl-inc.info",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "tejal",
  email: "teja_zor@egl-inc.info",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "bruno",
  email: "bruno-no@progressenergyinc.info",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "di_zo",
  email: "di_zo@acusage.net",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "lucy",
  email: "luc.ens@arketmay.com",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "malana",
  email: "mal-sic@autozone-inc.info",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "barnabas",
  email: "barnabas.pe@autozone-inc.info",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "medusa",
  email: "me.ma@acusage.net",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "safford",
  email: "sa_barthol@egl-inc.info",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "parbond",
  email: "par-bond@autozone-inc.info",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "bower",
  email: "prbower@acusage.net",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "galihail",
  email: "gali.hail@careful-organics.org",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "bevale",
  email: "bevale@arvinmeritor.info",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "naomi",
  email: "naomi_vana@acusage.net",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "alektree",
  email: "alek-tree@careful-organics.org",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "frasie",
  email: "frasie.pavo@autozone-inc.info",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "katibade",
  email: "katibade@arketmay.com",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "nickie",
  email: "nicki-mullaney@acusage.net",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "fanwol",
  email: "fan.wol@arketmay.com",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "raine",
  email: "raine-mcelligott@acusage.net",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "tomsal",
  email: "tom.sal@careful-organics.org",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "alecomer",
  email: "ale.comer@arketmay.com",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "lykoop",
  email: "ly.koopman@arvinmeritor.info",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "damcdani",
  email: "da-mcdani@careful-organics.org",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "sawsan",
  email: "sawsan.warde@egl-inc.info",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "gaidur",
  email: "gai.dur@autozone-inc.info",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "isaubos",
  email: "isau_bos@arketmay.com",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "farre",
  email: "farre-mcelligo@consolidated-farm-research.net",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "tucker",
  email: "tucker_varn@acusage.net",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "gargvan",
  email: "garg-van@careful-organics.org",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "eunichowe",
  email: "eunichowe@diaperstack.com",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "caitrsee",
  email: "caitr.seeger@diaperstack.com",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "ziavill",
  email: "zia.villarreal@arvinmeritor.info",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "longavi",
  email: "longavi_bos@diaperstack.com",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "prabod",
  email: "prabod.deb@egl-inc.info",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "felipa",
  email: "felipaclinar@arvinmeritor.info",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "garsal",
  email: "garsaleh@arvinmeritor.info",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "frank",
  email: "frank.villarreal@acusage.net",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "rilest",
  email: "rilest@egl-inc.info",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "mehe",
  email: "me-he@autozone-inc.info",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "courbri",
  email: "cour.bri@progressenergyinc.info",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "kaeddle",
  email: "ka.eddlema@progressenergyinc.info",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "eiris",
  email: "eiri-schau@acusage.net",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "dahli",
  email: "dahli.sorrell@progressenergyinc.info",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "chow",
  email: "cho.dul@arketmay.com",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "sudevi",
  email: "sudevi.am@autozone-inc.info",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "elroy",
  email: "elroy_kenw@autozone-inc.info",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "felke",
  email: "la.felke@careful-organics.org",
  password: "password",
  role: "employee"
})

Account.create_user(%{
  username: "badmin",
  email: "bishesh@admin.com",
  password: "bishesh",
  role: "admin"
})

Account.create_user(%{
  username: "bmanager",
  email: "bishesh@manager.com",
  password: "bishesh",
  role: "manager"
})

Account.create_user(%{
  username: "bmanager2",
  email: "bishesh@manager2.com",
  password: "bishesh",
  role: "manager"
})

Account.create_user(%{
  username: "bgmanager",
  email: "bishesh@general-manager.com",
  password: "bishesh",
  role: "general-manager"
})

Account.create_user(%{
  username: "bemployee",
  email: "bishesh@employee.com",
  password: "bishesh",
  role: "employee"
})

Repo.insert!(%Team{
  name: "Team 1",
  users: [1, 2, 3, 4, 5, 6, 7, 8],
  creator: 50
})

Repo.insert!(%Team{
  name: "Team 2",
  users: [9, 10, 11, 12, 13, 14, 15, 16],
  creator: 50
})

Repo.insert!(%Team{
  name: "Team 3",
  users: [17, 18, 19, 20, 21, 22, 23, 24],
  creator: 51
})

Repo.insert!(%Team{
  name: "Team 4",
  users: [25, 26, 27, 28, 29, 30, 31, 32],
  creator: 51
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-17 08:00:00],
  end: ~N[2010-04-17 17:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-17 08:00:00],
  end: ~N[2010-04-17 16:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-18 09:00:00],
  end: ~N[2010-04-18 17:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-18 10:00:00],
  end: ~N[2010-04-18 17:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-19 08:00:00],
  end: ~N[2010-04-19 12:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-19 14:00:00],
  end: ~N[2010-04-19 17:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-20 08:00:00],
  end: ~N[2010-04-20 12:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-20 14:00:00],
  end: ~N[2010-04-20 20:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 08:00:00],
  end: ~N[2010-04-21 12:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 14:00:00],
  end: ~N[2010-04-21 21:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 18:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 08:00:00],
  end: ~N[2010-04-21 21:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 16:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 07:00:00],
  end: ~N[2010-04-21 15:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 16:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 08:00:00],
  end: ~N[2010-04-21 13:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 08:00:00],
  end: ~N[2010-04-21 21:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 15:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 14:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 08:00:00],
  end: ~N[2010-04-21 13:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 14:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 18:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 21:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 13:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 08:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 13:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 21:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 22:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 08:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 08:00:00],
  end: ~N[2010-04-21 20:00:00],
  user: 1
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-17 09:00:00],
  end: ~N[2010-04-17 17:00:00],
  user: 7
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-17 10:00:00],
  end: ~N[2010-04-17 20:00:00],
  user: 7
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-18 09:00:00],
  end: ~N[2010-04-18 15:00:00],
  user: 7
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-18 09:00:00],
  end: ~N[2010-04-18 12:00:00],
  user: 7
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-19 08:00:00],
  end: ~N[2010-04-19 16:00:00],
  user: 7
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-19 09:00:00],
  end: ~N[2010-04-19 18:00:00],
  user: 7
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-20 08:00:00],
  end: ~N[2010-04-20 15:00:00],
  user: 7
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-20 10:00:00],
  end: ~N[2010-04-20 17:00:00],
  user: 7
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 11:00:00],
  end: ~N[2010-04-21 18:00:00],
  user: 7
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 08:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 7
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-17 10:00:00],
  end: ~N[2010-04-17 17:00:00],
  user: 6
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-17 09:00:00],
  end: ~N[2010-04-17 18:00:00],
  user: 6
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-18 10:00:00],
  end: ~N[2010-04-18 21:00:00],
  user: 6
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-18 09:00:00],
  end: ~N[2010-04-18 17:00:00],
  user: 6
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-19 08:00:00],
  end: ~N[2010-04-19 14:00:00],
  user: 6
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-19 09:00:00],
  end: ~N[2010-04-19 18:00:00],
  user: 6
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-20 10:00:00],
  end: ~N[2010-04-20 20:00:00],
  user: 6
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-20 08:00:00],
  end: ~N[2010-04-20 17:00:00],
  user: 6
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 21:00:00],
  user: 6
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 07:00:00],
  end: ~N[2010-04-21 14:00:00],
  user: 6
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-17 10:00:00],
  end: ~N[2010-04-17 17:00:00],
  user: 5
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-17 09:00:00],
  end: ~N[2010-04-17 19:00:00],
  user: 5
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-18 09:00:00],
  end: ~N[2010-04-18 17:00:00],
  user: 5
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-18 08:00:00],
  end: ~N[2010-04-18 16:00:00],
  user: 5
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-19 09:00:00],
  end: ~N[2010-04-19 18:00:00],
  user: 5
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-19 08:00:00],
  end: ~N[2010-04-19 17:00:00],
  user: 5
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-20 08:00:00],
  end: ~N[2010-04-20 21:00:00],
  user: 5
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-20 09:00:00],
  end: ~N[2010-04-20 17:00:00],
  user: 5
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 08:00:00],
  end: ~N[2010-04-21 21:00:00],
  user: 5
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 5
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-17 07:00:00],
  end: ~N[2010-04-17 14:00:00],
  user: 4
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-17 08:00:00],
  end: ~N[2010-04-17 13:00:00],
  user: 4
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-18 08:00:00],
  end: ~N[2010-04-18 18:00:00],
  user: 4
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-18 08:00:00],
  end: ~N[2010-04-18 14:00:00],
  user: 4
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-19 08:00:00],
  end: ~N[2010-04-19 15:00:00],
  user: 4
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-19 09:00:00],
  end: ~N[2010-04-19 17:00:00],
  user: 4
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-20 08:00:00],
  end: ~N[2010-04-20 20:00:00],
  user: 4
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-20 10:00:00],
  end: ~N[2010-04-20 21:00:00],
  user: 4
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 18:00:00],
  user: 4
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 4
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-17 08:00:00],
  end: ~N[2010-04-17 17:00:00],
  user: 3
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-17 08:00:00],
  end: ~N[2010-04-17 14:00:00],
  user: 3
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-18 09:00:00],
  end: ~N[2010-04-18 21:00:00],
  user: 3
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-18 08:00:00],
  end: ~N[2010-04-18 18:00:00],
  user: 3
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-19 08:00:00],
  end: ~N[2010-04-19 17:00:00],
  user: 3
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-19 08:00:00],
  end: ~N[2010-04-19 17:00:00],
  user: 3
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-20 08:00:00],
  end: ~N[2010-04-20 20:00:00],
  user: 3
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-20 07:00:00],
  end: ~N[2010-04-20 17:00:00],
  user: 3
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 08:00:00],
  end: ~N[2010-04-21 21:00:00],
  user: 3
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 3
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-17 09:00:00],
  end: ~N[2010-04-17 17:00:00],
  user: 2
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-17 09:00:00],
  end: ~N[2010-04-17 18:00:00],
  user: 2
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-18 09:00:00],
  end: ~N[2010-04-18 17:00:00],
  user: 2
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-18 08:00:00],
  end: ~N[2010-04-18 22:00:00],
  user: 2
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-19 08:00:00],
  end: ~N[2010-04-19 18:00:00],
  user: 2
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-19 08:00:00],
  end: ~N[2010-04-19 17:00:00],
  user: 2
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-20 08:00:00],
  end: ~N[2010-04-20 18:00:00],
  user: 2
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-20 10:00:00],
  end: ~N[2010-04-20 17:00:00],
  user: 2
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 08:00:00],
  end: ~N[2010-04-21 16:00:00],
  user: 2
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 2
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 8
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 8
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 18:00:00],
  user: 8
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 20:00:00],
  user: 8
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 21:00:00],
  user: 8
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 19:00:00],
  user: 8
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 22:00:00],
  user: 8
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 19:00:00],
  user: 8
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 20:00:00],
  user: 8
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 8
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 9
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 9
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 18:00:00],
  user: 9
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 20:00:00],
  user: 9
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 21:00:00],
  user: 9
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 19:00:00],
  user: 9
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 22:00:00],
  user: 9
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 19:00:00],
  user: 9
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 20:00:00],
  user: 9
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 9
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 10
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 10
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 18:00:00],
  user: 10
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 20:00:00],
  user: 10
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 21:00:00],
  user: 10
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 19:00:00],
  user: 10
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 22:00:00],
  user: 10
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 19:00:00],
  user: 10
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 20:00:00],
  user: 10
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 10
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 11
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 11
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 18:00:00],
  user: 11
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 20:00:00],
  user: 11
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 21:00:00],
  user: 11
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 19:00:00],
  user: 11
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 22:00:00],
  user: 11
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 19:00:00],
  user: 11
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 20:00:00],
  user: 11
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 11
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 12
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 12
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 18:00:00],
  user: 12
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 20:00:00],
  user: 11
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 21:00:00],
  user: 11
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 19:00:00],
  user: 11
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 22:00:00],
  user: 11
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 19:00:00],
  user: 11
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 20:00:00],
  user: 11
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 12
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 13
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 13
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 18:00:00],
  user: 13
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 20:00:00],
  user: 13
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 21:00:00],
  user: 13
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 19:00:00],
  user: 13
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 22:00:00],
  user: 13
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 19:00:00],
  user: 13
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 20:00:00],
  user: 13
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 13
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 14
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 14
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 18:00:00],
  user: 14
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 20:00:00],
  user: 14
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 21:00:00],
  user: 14
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 19:00:00],
  user: 14
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 22:00:00],
  user: 14
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 19:00:00],
  user: 14
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 20:00:00],
  user: 14
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 14
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 15
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 15
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 18:00:00],
  user: 15
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 20:00:00],
  user: 15
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 21:00:00],
  user: 15
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 19:00:00],
  user: 15
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 22:00:00],
  user: 15
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 19:00:00],
  user: 15
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 20:00:00],
  user: 15
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 15
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 16
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 16
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 18:00:00],
  user: 16
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 20:00:00],
  user: 16
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 21:00:00],
  user: 16
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 19:00:00],
  user: 16
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 22:00:00],
  user: 16
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 19:00:00],
  user: 16
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 20:00:00],
  user: 16
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 16
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 17
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 17
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 18:00:00],
  user: 17
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 20:00:00],
  user: 17
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 21:00:00],
  user: 17
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 19:00:00],
  user: 17
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 22:00:00],
  user: 17
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 19:00:00],
  user: 17
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 20:00:00],
  user: 17
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 17
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 18
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 18
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 18:00:00],
  user: 18
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 20:00:00],
  user: 18
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 21:00:00],
  user: 18
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 19:00:00],
  user: 18
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 22:00:00],
  user: 18
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 19:00:00],
  user: 18
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 20:00:00],
  user: 18
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 18
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 19
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 19
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 18:00:00],
  user: 19
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 20:00:00],
  user: 19
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 21:00:00],
  user: 19
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 19:00:00],
  user: 19
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 22:00:00],
  user: 19
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 19:00:00],
  user: 19
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 20:00:00],
  user: 19
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 19
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 20
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 20
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 18:00:00],
  user: 20
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 20:00:00],
  user: 20
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 21:00:00],
  user: 20
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 19:00:00],
  user: 20
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 22:00:00],
  user: 20
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 19:00:00],
  user: 20
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 10:00:00],
  end: ~N[2010-04-21 20:00:00],
  user: 20
})

TimeManager.WorkingTimes.create_working_time(%{
  start: ~N[2010-04-21 09:00:00],
  end: ~N[2010-04-21 17:00:00],
  user: 20
})
