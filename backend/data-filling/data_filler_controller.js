import Committee from '../models/committee_model.js';
import User from '../models/user_model.js';
import Member from '../models/user_model.js';
import mongoose from 'mongoose';

export const userFiller = async (req, res, next) => {

    const userObjects = [
        {
            name: "Aarav Sharma",
            emailId: "aarav.sharma@example.com",
            committees: []
          },
          {
            name: "Sophia Wilson",
            emailId: "sophia.wilson@example.com",
            committees: []
          },
          {
            name: "Ali Khan",
            emailId: "ali.khan@example.com",
            committees: []
          },
          {
            name: "Wei Zhang",
            emailId: "wei.zhang@example.com",
            committees: []
          },
          {
            name: "Maria Gonzalez",
            emailId: "maria.gonzalez@example.com",
            committees: []
          },
          {
            name: "Ethan Brown",
            emailId: "ethan.brown@example.com",
            committees: []
          },
          {
            name: "Zara Ahmed",
            emailId: "zara.ahmed@example.com",
            committees: []
          },
          {
            name: "Hiroshi Tanaka",
            emailId: "hiroshi.tanaka@example.com",
            committees: []
          },
          {
            name: "Olivia Smith",
            emailId: "olivia.smith@example.com",
            committees: []
          },
          {
            name: "Arjun Reddy",
            emailId: "arjun.reddy@example.com",
            committees: []
          },
          {
            name: "Fatima Hassan",
            emailId: "fatima.hassan@example.com",
            committees: []
          },
          {
            name: "Liam Davis",
            emailId: "liam.davis@example.com",
            committees: []
          },
          {
            name: "Chun-Li Wang",
            emailId: "chun.li.wang@example.com",
            committees: []
          },
          {
            name: "Ananya Patel",
            emailId: "ananya.patel@example.com",
            committees: []
          },
          {
            name: "Michael Johnson",
            emailId: "michael.johnson@example.com",
            committees: []
          },
          {
            name: "Javier Martinez",
            emailId: "javier.martinez@example.com",
            committees: []
          },
          {
            name: "Sarah Lee",
            emailId: "sarah.lee@example.com",
            committees: []
          },
          {
            name: "Ravi Prasad",
            emailId: "ravi.prasad@example.com",
            committees: []
          },
          {
            name: "Emily Garcia",
            emailId: "emily.garcia@example.com",
            committees: []
          },
          {
            name: "Omar Abdallah",
            emailId: "omar.abdallah@example.com",
            committees: []
          }
    ];

    const additionalMembers = [
        { name: "Ishaan Verma", emailId: "ishaan.verma@example.com", committees: [] },
        { name: "Aisha Ali", emailId: "aisha.ali@example.com", committees: [] },
        { name: "Diego Ramirez", emailId: "diego.ramirez@example.com", committees: [] },
        { name: "Chen Wei", emailId: "chen.wei@example.com", committees: [] },
        { name: "Emma Johnson", emailId: "emma.johnson@example.com", committees: [] },
        { name: "Karan Patel", emailId: "karan.patel@example.com", committees: [] },
        { name: "Leila Hassan", emailId: "leila.hassan@example.com", committees: [] },
        { name: "Igor Petrov", emailId: "igor.petrov@example.com", committees: [] },
        { name: "Anna Schmidt", emailId: "anna.schmidt@example.com", committees: [] },
        { name: "Rajesh Kulkarni", emailId: "rajesh.kulkarni@example.com", committees: [] },
        { name: "Fatou Ndiaye", emailId: "fatou.ndiaye@example.com", committees: [] },
        { name: "William Clark", emailId: "william.clark@example.com", committees: [] },
        { name: "Nia Kim", emailId: "nia.kim@example.com", committees: [] },
        { name: "Hassan Omar", emailId: "hassan.omar@example.com", committees: [] },
        { name: "Tomás Silva", emailId: "tomas.silva@example.com", committees: [] },
        { name: "Priya Nair", emailId: "priya.nair@example.com", committees: [] },
        { name: "Yuuki Nakamura", emailId: "yuuki.nakamura@example.com", committees: [] },
        { name: "Chloe Baker", emailId: "chloe.baker@example.com", committees: [] },
        { name: "Luca Rossi", emailId: "luca.rossi@example.com", committees: [] },
        { name: "Sara Novak", emailId: "sara.novak@example.com", committees: [] },
        { name: "Amir El-Sayed", emailId: "amir.el-sayed@example.com", committees: [] },
        { name: "Sofia Morales", emailId: "sofia.morales@example.com", committees: [] },
        { name: "Jin Park", emailId: "jin.park@example.com", committees: [] },
        { name: "Lila Carter", emailId: "lila.carter@example.com", committees: [] },
        { name: "Elijah Thomas", emailId: "elijah.thomas@example.com", committees: [] },
        { name: "Nadia Bousaid", emailId: "nadia.bousaid@example.com", committees: [] },
        { name: "Mohammed Faisal", emailId: "mohammed.faisal@example.com", committees: [] },
        { name: "Anya Kaur", emailId: "anya.kaur@example.com", committees: [] },
        { name: "Benjamin Scott", emailId: "benjamin.scott@example.com", committees: [] },
        { name: "Clara Müller", emailId: "clara.mueller@example.com", committees: [] },
        { name: "David Nguyen", emailId: "david.nguyen@example.com", committees: [] },
        { name: "Alejandra Ruiz", emailId: "alejandra.ruiz@example.com", committees: [] },
        { name: "Eleanor Bell", emailId: "eleanor.bell@example.com", committees: [] },
        { name: "Arif Rahman", emailId: "arif.rahman@example.com", committees: [] },
        { name: "Talia Levy", emailId: "talia.levy@example.com", committees: [] },
        { name: "Victor Hernandez", emailId: "victor.hernandez@example.com", committees: [] },
        { name: "Yara Mostafa", emailId: "yara.mostafa@example.com", committees: [] },
        { name: "Nathan Young", emailId: "nathan.young@example.com", committees: [] },
        { name: "Irene Garcia", emailId: "irene.garcia@example.com", committees: [] },
        { name: "Ahmed Ibrahim", emailId: "ahmed.ibrahim@example.com", committees: [] },
        { name: "Keira Adams", emailId: "keira.adams@example.com", committees: [] },
        { name: "Noah Simmons", emailId: "noah.simmons@example.com", committees: [] },
        { name: "Mei Lin", emailId: "mei.lin@example.com", committees: [] },
        { name: "Gabriel Costa", emailId: "gabriel.costa@example.com", committees: [] },
        { name: "Selena Torres", emailId: "selena.torres@example.com", committees: [] },
        { name: "Ethan Brooks", emailId: "ethan.brooks@example.com", committees: [] },
        { name: "Huda Karim", emailId: "huda.karim@example.com", committees: [] },
        { name: "Maxime Dubois", emailId: "maxime.dubois@example.com", committees: [] },
        { name: "Sophia Amari", emailId: "sophia.amari@example.com", committees: [] },
        { name: "Liam Porter", emailId: "liam.porter@example.com", committees: [] },
        { name: "Aya Youssef", emailId: "aya.youssef@example.com", committees: [] },
        { name: "Dylan Morgan", emailId: "dylan.morgan@example.com", committees: [] },
        { name: "Ritu Singh", emailId: "ritu.singh@example.com", committees: [] },
        { name: "Zain Ali", emailId: "zain.ali@example.com", committees: [] },
        { name: "Aria King", emailId: "aria.king@example.com", committees: [] },
        { name: "Leon Santos", emailId: "leon.santos@example.com", committees: [] },
        { name: "Eva Fischer", emailId: "eva.fischer@example.com", committees: [] },
        { name: "Hugo Torres", emailId: "hugo.torres@example.com", committees: [] },
        { name: "Nia Malik", emailId: "nia.malik@example.com", committees: [] },
        { name: "Lucas Hayes", emailId: "lucas.hayes@example.com", committees: [] }
    ];
    
    const additional2 = [
        
            {
              name: 'Aarav Joshi',
              emailId: 'aarav.joshi@example.com',
              committees: []
            },
            {
              name: 'Emma Thompson',
              emailId: 'emma.thompson@example.com',
              committees: []
            },
            {
              name: 'Ishaan Mehta',
              emailId: 'ishaan.mehta@example.com',
              committees: []
            },
            {
              name: 'Olivia Garcia',
              emailId: 'olivia.garcia@example.com',
              committees: []
            },
            {
              name: 'Vikram Kumar',
              emailId: 'vikram.kumar@example.com',
              committees: []
            },
            {
              name: 'Lily Brown',
              emailId: 'lily.brown@example.com',
              committees: []
            },
            {
              name: 'Aarya Shah',
              emailId: 'aarya.shah@example.com',
              committees: []
            },
            {
              name: 'Lucas Martinez',
              emailId: 'lucas.martinez@example.com',
              committees: []
            },
            {
              name: 'Saanvi Patel',
              emailId: 'saanvi.patel@example.com',
              committees: []
            },
            {
              name: 'Mohamed Ali',
              emailId: 'mohamed.ali@example.com',
              committees: []
            },
            {
              name: 'Ravi Singh',
              emailId: 'ravi.singh@example.com',
              committees: []
            },
            {
              name: 'Sophia Johnson',
              emailId: 'sophia.johnson@example.com',
              committees: []
            },
            {
              name: 'Arjun Patel',
              emailId: 'arjun.patel@example.com',
              committees: []
            },
            {
              name: 'Mia Wilson',
              emailId: 'mia.wilson@example.com',
              committees: []
            },
            {
              name: 'Rajeev Sharma',
              emailId: 'rajeeve.sharma@example.com',
              committees: []
            },
            {
              name: 'Emma Clark',
              emailId: 'emma.clark@example.com',
              committees: []
            },
            {
              name: 'Nina Gupta',
              emailId: 'nina.gupta@example.com',
              committees: []
            },
            {
              name: 'Ethan Harris',
              emailId: 'ethan.harris@example.com',
              committees: []
            },
            {
              name: 'Priya Kapoor',
              emailId: 'priya.kapoor@example.com',
              committees: []
            },
            {
              name: 'James Smith',
              emailId: 'james.smith@example.com',
              committees: []
            },
            {
              name: 'Ayesha Khan',
              emailId: 'ayesha.khan@example.com',
              committees: []
            },
            {
              name: 'Aryan Gupta',
              emailId: 'aryan.gupta@example.com',
              committees: []
            },
            {
              name: 'Sarah Taylor',
              emailId: 'sarah.taylor@example.com',
              committees: []
            },
            {
              name: 'Simran Kaur',
              emailId: 'simran.kaur@example.com',
              committees: []
            },
            {
              name: 'Carlos Fernandez',
              emailId: 'carlos.fernandez@example.com',
              committees: []
            },
            {
              name: 'Karan Aggarwal',
              emailId: 'karan.aggarwal@example.com',
              committees: []
            },
            {
              name: 'Alice Cooper',
              emailId: 'alice.cooper@example.com',
              committees: []
            },
            {
              name: 'Meera Reddy',
              emailId: 'meera.reddy@example.com',
              committees: []
            },
            {
              name: 'Zara Thompson',
              emailId: 'zara.thompson@example.com',
              committees: []
            },
            {
              name: 'Nikhil Jain',
              emailId: 'nikhil.jain@example.com',
              committees: []
            },
            {
              name: 'Ella Williams',
              emailId: 'ella.williams@example.com',
              committees: []
            },
            {
              name: 'Avi Verma',
              emailId: 'avi.verma@example.com',
              committees: []
            },
            {
              name: 'Maya Ali',
              emailId: 'maya.ali@example.com',
              committees: []
            },
            {
              name: 'Liam Davis',
              emailId: 'liam.davis@example.com',
              committees: []
            },
            {
              name: 'Aditya Choudhary',
              emailId: 'aditya.choudhary@example.com',
              committees: []
            },
            {
              name: 'Sophia Lee',
              emailId: 'sophia.lee@example.com',
              committees: []
            },
            {
              name: 'Evan Moore',
              emailId: 'evan.moore@example.com',
              committees: []
            },
            {
              name: 'Riya Nair',
              emailId: 'riya.nair@example.com',
              committees: []
            },
            {
              name: 'Luca Rossi',
              emailId: 'luca.rossi@example.com',
              committees: []
            },
            {
              name: 'Siddharth Agarwal',
              emailId: 'siddharth.agarwal@example.com',
              committees: []
            },
            {
              name: 'Isabella Clark',
              emailId: 'isabella.clark@example.com',
              committees: []
            },
            {
              name: 'Zain Khan',
              emailId: 'zain.khan@example.com',
              committees: []
            },
            {
              name: 'Ananya Desai',
              emailId: 'ananya.desai@example.com',
              committees: []
            },
            {
              name: 'Nathan Allen',
              emailId: 'nathan.allen@example.com',
              committees: []
            },
            {
              name: 'Vivek Thakur',
              emailId: 'vivek.thakur@example.com',
              committees: []
            },
            {
              name: 'Gianna White',
              emailId: 'gianna.white@example.com',
              committees: []
            },
            {
              name: 'Ibrahim Ali',
              emailId: 'ibrahim.ali@example.com',
              committees: []
            },
            {
              name: 'Hannah Jackson',
              emailId: 'hannah.jackson@example.com',
              committees: []
            },
            {
              name: 'Arvind Rao',
              emailId: 'arvind.rao@example.com',
              committees: []
            },
            {
              name: 'Leo Hernandez',
              emailId: 'leo.hernandez@example.com',
              committees: []
            },
            {
              name: 'Ayush Yadav',
              emailId: 'ayush.yadav@example.com',
              committees: []
            },
            {
              name: 'Charlotte Lewis',
              emailId: 'charlotte.lewis@example.com',
              committees: []
            },
            {
              name: 'Madhavi Singh',
              emailId: 'madhavi.singh@example.com',
              committees: []
            },
            {
              name: 'Isaac Martin',
              emailId: 'isaac.martin@example.com',
              committees: []
            },
            {
              name: 'Ariya Mehra',
              emailId: 'ariya.mehra@example.com',
              committees: []
            },
            {
              name: 'Freya Allen',
              emailId: 'freya.allen@example.com',
              committees: []
            },
            {
              name: 'Vikram Soni',
              emailId: 'vikram.soni@example.com',
              committees: []
            },
            {
              name: 'Maya Patel',
              emailId: 'maya.patel@example.com',
              committees: []
            },
            {
              name: 'Jack Green',
              emailId: 'jack.green@example.com',
              committees: []
            },
            {
              name: 'Manisha Gupta',
              emailId: 'manisha.gupta@example.com',
              committees: []
            },
            {
              name: 'Joshua Lee',
              emailId: 'joshua.lee@example.com',
              committees: []
            },
            {
              name: 'Arden Zhou',
              emailId: 'arden.zhou@example.com',
              committees: []
            },
            {
              name: 'Priya Reddy',
              emailId: 'priya.reddy@example.com',
              committees: []
            },
            {
              name: 'Kaitlyn Young',
              emailId: 'kaitlyn.young@example.com',
              committees: []
            },
            {
              name: 'Anish Iyer',
              emailId: 'anish.iyer@example.com',
              committees: []
            },
            {
              name: 'Blake Anderson',
              emailId: 'blake.anderson@example.com',
              committees: []
            },
            {
              name: 'Neha Mehta',
              emailId: 'neha.mehta@example.com',
              committees: []
            },
            {
              name: 'Elliot Adams',
              emailId: 'elliot.adams@example.com',
              committees: []
            },
            {
              name: 'Karan Bhatia',
              emailId: 'karan.bhatia@example.com',
              committees: []
            },
            {
              name: 'Leah Scott',
              emailId: 'leah.scott@example.com',
              committees: []
            },
            {
              name: 'Tejas Nair',
              emailId: 'tejas.nair@example.com',
              committees: []
            },
            {
              name: 'Ashley Martinez',
              emailId: 'ashley.martinez@example.com',
              committees: []
            },
            {
              name: 'Shweta Verma',
              emailId: 'shweta.verma@example.com',
              committees: []
            },
            {
              name: 'Austin Wilson',
              emailId: 'austin.wilson@example.com',
              committees: []
            },
            {
              name: 'Snehal Patel',
              emailId: 'snehal.patel@example.com',
              committees: []
            },
            {
              name: 'Ethan Carter',
              emailId: 'ethan.carter@example.com',
              committees: []
            },
            {
              name: 'Maya Das',
              emailId: 'maya.das@example.com',
              committees: []
            },
            {
              name: 'Jacob Walker',
              emailId: 'jacob.walker@example.com',
              committees: []
            },
            {
              name: 'Pooja Saini',
              emailId: 'pooja.saini@example.com',
              committees: []
            },
            {
              name: 'Isaac Clark',
              emailId: 'isaac.clark@example.com',
              committees: []
            },
            {
              name: 'Farhan Malik',
              emailId: 'farhan.malik@example.com',
              committees: []
            },
            {
              name: 'Rhea Arora',
              emailId: 'rhea.arora@example.com',
              committees: []
            },
            {
              name: 'Benjamin King',
              emailId: 'benjamin.king@example.com',
              committees: []
            },
            {
              name: 'Meghan Fox',
              emailId: 'meghan.fox@example.com',
              committees: []
            },
            {
              name: 'Tanvi Deshmukh',
              emailId: 'tanvi.deshmukh@example.com',
              committees: []
            }    
    ]

    for(const item of userObjects){
      const user = User({
        name : item.name,
        emailId : item.emailId,
        committees : [],
      });

      await user.save();
    }

    for(const item of additionalMembers){
      const user = User({
        name : item.name,
        emailId : item.emailId,
        committees : [],
      });

      await user.save();
    }

    for(const item of additional2){
      const user = User({
        name : item.name,
        emailId : item.emailId,
        committees : [],
      });

      await user.save();
    }

    return res.status(200).json({
        message : "Out of loop",
    });
};

export const populateCommittees = async () => {
  try {
      // Fetch all users
      const users = await User.find();

      if (users.length < 30) {
          throw new Error("Not enough users in the database. At least 30 are required.");
      }

      // Shuffle the users array to randomize selection
      const shuffledUsers = users.sort(() => 0.5 - Math.random());
      
      // Select the first 30 users
      const selectedUsers = shuffledUsers.slice(0, 30);

      // Define the committee names
      const committeeNames = [
          "Computer Society Of India",
          "Google Developers Student's Club",
          "Association of Computer Machinery",
          "Unstop Igniters Club",
          "Student Council"
      ];

      // Define roles
      const roles = ["Lead", "Co-Lead", "Publicity Head", "Sponsorship Head", "Technical Head", "Events Head"];

      // Create committees
      const committees = committeeNames.map((name, index) => {
          // Assign roles to random users
          const authorities = roles.map((role, roleIndex) => {
              return {
                  position: role,
                  memberId: selectedUsers[(index * roles.length + roleIndex) % selectedUsers.length]._id
              };
          });

          return {
              name,
              authorities,
              members: [],
              events: [],
              announcements: [],
              imageUrl: ""
          };
      });

      // Insert committees into the database
      await Committee.insertMany(committees);

      console.log("Committees populated successfully.");
  } catch (error) {
      console.error("Error populating committees:", error);
  }
};

export const updateUserCommittees = async () => {
  try {
      // Fetch all committees
      const committees = await Committee.find();

      // Update users' committee information
      for (const committee of committees) {
          for (const authority of committee.authorities) {
              await User.findByIdAndUpdate(
                  authority.memberId,
                  {
                      $push: {
                          committees: {
                              position: authority.position,
                              committee_doc: committee._id,
                              committee_name: committee.name
                          }
                      }
                  }
              );
          }
      }

      console.log("User committee information updated successfully.");
  } catch (error) {
      console.error("Error updating user committees:", error);
  }
};


export const assignMembersToCommittees = async () => {
  try {
    // Fetch all committees and users
    const committees = await Committee.find();
    const users = await User.find();

    // Filter out users already holding an authority position in any committe
    const usersNotInAuthorities = users.filter(user => {
      return !committees.some(committee =>
        committee.authorities.some(authority =>
          authority.memberId.toString() === user._id.toString()
        )
      );
    });

    // Randomize the filtered users
    const shuffledUsers = usersNotInAuthorities.sort(() => Math.random() - 0.5);

    // Take the first 75 users
    const selectedUsers = shuffledUsers.slice(0, 75);

    // Distribute users evenly across 5 committees
    const usersPerCommittee = Math.floor(selectedUsers.length / committees.length);
    const remainingUsers = selectedUsers.length % committees.length;

    // Prepare bulk operations for MongoDB updates
    const bulkCommitteeOps = [];
    const bulkUserOps = [];

    // Distribute users to committees
    let userIndex = 0;
    for (const committee of committees) {
      const membersToAdd = [];
      const membersForThisCommittee = [];

      // Add users to the committee's members
      for (let i = 0; i < usersPerCommittee; i++) {
        if (selectedUsers[userIndex]) {
          membersToAdd.push(selectedUsers[userIndex]._id);
          membersForThisCommittee.push({
            committee_doc: committee._id,
            committee_name: committee.name,
            position: "Member"
          });
          userIndex++;
        }
      }

      // Add remaining users to the first committees (if any)
      if (remainingUsers > 0) {
        if (selectedUsers[userIndex]) {
          membersToAdd.push(selectedUsers[userIndex]._id);
          membersForThisCommittee.push({
            committee_doc: committee._id,
            committee_name: committee.name,
            position: "Member"
          });
          userIndex++;
        }
        remainingUsers--;
      }

      // Update the committee's members array
      bulkCommitteeOps.push({
        updateOne: {
          filter: { _id: committee._id },
          update: { $push: { members: { $each: membersToAdd } } }
        }
      });

      // Update each user's committees array
      for (const user of membersForThisCommittee) {
        bulkUserOps.push({
          updateOne: {
            filter: { _id: user._id },
            update: {
              $push: {
                committees: {
                  committee_doc: user.committee_doc,
                  committee_name: user.committee_name,
                  position: user.position
                }
              }
            }
          }
        });
      }
    }

    // Execute the bulk write operations for both committees and users
    if (bulkCommitteeOps.length > 0) {
      await Committee.bulkWrite(bulkCommitteeOps);
    }

    if (bulkUserOps.length > 0) {
      await User.bulkWrite(bulkUserOps);
    }

    console.log("Members successfully assigned to committees.");
  } catch (error) {
    console.error("Error assigning members to committees:", error);
  }
};

export const updateUsersMembers = async () => {
  try {
    // Fetch all committees and populate their members
    const committees = await Committee.find().populate('members');
    
    // Prepare bulk write operations for updating users
    const bulkUserOps = [];
    
    // Iterate through all committees
    for (const committee of committees) {
      // Iterate through each member of the committee
      for (const member of committee.members) {
        // Add a committe to the user's committees array if not already added
        bulkUserOps.push({
          updateOne: {
            filter: { _id: member._id }, // Find user by ID
            update: {
              $addToSet: {  // $addToSet ensures no duplicates in the array
                committees: {
                  committee_doc: committee._id,  // Committee ObjectId
                  committee_name: committee.name, // Committee name
                  position: 'Member'  // User's position
                }
              }
            }
          }
        });
      }
    }

    // Execute the bulk operations to update the users
    if (bulkUserOps.length > 0) {
      await User.bulkWrite(bulkUserOps);
      console.log("User committees updated successfully.");
    } else {
      console.log("No users to update.");
    }
  } catch (error) {
    console.error("Error updating user committees:", error);
  }
};

export const deleteExtraComms = async (req, res, next) => {
  try {
    // Remove null values from the committees array in User collection
    const cleanedUsers = await User.updateMany(
      { committees: { $in: [null] } }, // Match users with null in their committees array
      { $pull: { committees: null } } // Remove all null values
    );

    return res.status(200).json({
      message: "Null values removed successfully from committees array",
      modifiedCount: cleanedUsers.modifiedCount
    });
  } catch (err) {
    return res.status(500).json({
      message: "An error occurred while removing null values",
      error: err.message
    });
  }
};
